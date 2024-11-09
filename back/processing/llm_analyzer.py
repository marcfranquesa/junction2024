import os
from pathlib import Path
import logging
from typing import Dict, List, Optional
from dataclasses import dataclass
import ollama
import json
from concurrent.futures import ThreadPoolExecutor
from tqdm import tqdm

@dataclass
class ProcessingResult:
    filename: str
    prompt: str
    response: str
    model: str
    error: Optional[str] = None

class LLMFileProcessor:
    def __init__(self, model_name: str = "mistral"):
        """
        Initialize LLM processor with specified model.
        Default is mistral, but you can use any model available in Ollama:
        - llama2
        - codellama
        - mistral
        - mixtral
        etc.
        """
        self.model_name = model_name
        
        # Configure logging
        logging.basicConfig(
            level=logging.INFO,
            format='%(asctime)s - %(levelname)s - %(message)s'
        )
        self.logger = logging.getLogger(__name__)
        
        # Default prompts for different analysis tasks
        self.default_prompts = {
            'feature_extraction': """
            Analyze this text and extract all mentioned software features.
            For each feature provide:
            - Feature ID (if mentioned)
            - Feature name
            - Brief description
            - Status (new/existing/modified)
            Format the response as a JSON list.
            """,
            
            'requirements': """
            Identify all requirements mentioned in this text.
            Include:
            - Functional requirements
            - Non-functional requirements
            - Technical constraints
            Format the response as a JSON list.
            """,
            
            'action_items': """
            Extract all action items and next steps from this text.
            For each item include:
            - Description
            - Assigned to (if mentioned)
            - Due date (if mentioned)
            - Priority (if mentioned)
            Format the response as a JSON list.
            """,
            
            'decisions': """
            Identify all decisions made in this meeting.
            Include:
            - Decision description
            - Context/rationale
            - Stakeholders involved
            Format the response as a JSON list.
            """
        }

    def load_file(self, file_path: Path) -> str:
        """Load and read a text file."""
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                return f.read()
        except Exception as e:
            self.logger.error(f"Error reading file {file_path}: {str(e)}")
            raise

    def process_single_prompt(self, text: str, prompt: str) -> ProcessingResult:
        """Process a single text with a specific prompt."""
        try:
            # Combine prompt with text
            full_prompt = f"{prompt}\n\nText to analyze:\n{text}"
            
            # Query the LLM
            response = ollama.chat(model=self.model_name, messages=[
                {
                    'role': 'user',
                    'content': full_prompt,
                    'api_key': "coEq39ZaZIRPHHFHCc3hTosfmszgfToq",
                }
            ])
            
            return ProcessingResult(
                filename="current_file",
                prompt=prompt,
                response=response['message']['content'],
                model=self.model_name
            )
            
        except Exception as e:
            return ProcessingResult(
                filename="current_file",
                prompt=prompt,
                response="",
                model=self.model_name,
                error=str(e)
            )

    def process_file(self, file_path: Path, prompts: Dict[str, str]) -> Dict[str, ProcessingResult]:
        """Process a single file with multiple prompts."""
        try:
            text = self.load_file(file_path)
            results = {}
            
            for prompt_name, prompt in prompts.items():
                self.logger.info(f"Processing {file_path} with prompt: {prompt_name}")
                result = self.process_single_prompt(text, prompt)
                result.filename = str(file_path)
                results[prompt_name] = result
                
            return results
            
        except Exception as e:
            self.logger.error(f"Error processing file {file_path}: {str(e)}")
            return {
                'error': ProcessingResult(
                    filename=str(file_path),
                    prompt="",
                    response="",
                    model=self.model_name,
                    error=str(e)
                )
            }

    def process_directory(self, 
                         directory: str, 
                         prompts: Optional[Dict[str, str]] = None,
                         max_workers: int = 4) -> Dict[str, Dict[str, ProcessingResult]]:
        """
        Process all txt files in directory with specified prompts.
        Uses thread pool for parallel processing.
        """
        dir_path = Path(directory)
        if not dir_path.exists():
            raise FileNotFoundError(f"Directory '{directory}' does not exist")
            
        # Use default prompts if none provided
        prompts = prompts or self.default_prompts
        
        # Get all txt files
        txt_files = list(dir_path.glob('*.txt'))
        results = {}
        
        # Process files in parallel
        with ThreadPoolExecutor(max_workers=max_workers) as executor:
            # Create a list of future objects
            future_to_file = {
                executor.submit(self.process_file, file_path, prompts): file_path
                for file_path in txt_files
            }
            
            # Process results as they complete
            for future in tqdm(future_to_file, desc="Processing files"):
                file_path = future_to_file[future]
                try:
                    results[str(file_path)] = future.result()
                except Exception as e:
                    self.logger.error(f"Error processing {file_path}: {str(e)}")
                    results[str(file_path)] = {
                        'error': ProcessingResult(
                            filename=str(file_path),
                            prompt="",
                            response="",
                            model=self.model_name,
                            error=str(e)
                        )
                    }
        
        return results

    def save_results(self, results: Dict[str, Dict[str, ProcessingResult]], output_file: str):
        """Save results to a JSON file."""
        # Convert results to serializable format
        serializable_results = {}
        for file_path, file_results in results.items():
            serializable_results[file_path] = {
                prompt_name: {
                    'filename': result.filename,
                    'prompt': result.prompt,
                    'response': result.response,
                    'model': result.model,
                    'error': result.error
                }
                for prompt_name, result in file_results.items()
            }
        
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(serializable_results, f, indent=2)

def main():
    # Example usage
    processor = LLMFileProcessor(model_name="mistral")
    
    # Define custom prompts (optional)
    # custom_prompts = {
    #     'bugs': """
    #     Identify all bug reports and issues mentioned in this text.
    #     Include severity and impact if mentioned.
    #     Format as JSON.
    #     """,
    #     'timeline': """
    #     Extract all mentioned dates, deadlines, and timeline information.
    #     Format as JSON.
    #     """
    # }

    # Process all txt files
    results = processor.process_directory(
        "data/txt/",
        # prompts=custom_prompts,  # Use custom_prompts or leave empty for defaults
        max_workers=4
    )
    
    # Save results
    fpath = "data/analysis_results.json"
    processor.save_results(results, fpath)
    
    # Print some results
    for file_path, file_results in results.items():
        print(f"\nResults for {file_path}:")
        for prompt_name, result in file_results.items():
            if not result.error:
                print(f"\n{prompt_name} analysis:")
                print(result.response[:200] + "...")  # Print first 200 chars
            else:
                print(f"Error in {prompt_name}: {result.error}")

    print("--"*80)

    with open(fpath, "r") as file:
        data = json.load(file)
        for f in data:
            for prompt_name, result in data[f].items():
                if not result["error"]:
                    print(f"\n{prompt_name} analysis:")
                    print(result.response[:200] + "...")  # Print first 200 chars
                else:
                    print(f"Error in {prompt_name}: {result['error']}")


if __name__ == "__main__":
    main()
