import os
import json
from mistralai import Mistral

# api_key = os.environ["MISTRAL_API_KEY"]
api_key = "coEq39ZaZIRPHHFHCc3hTosfmszgfToq"
model = "mistral-large-latest"

client = Mistral(api_key=api_key)

prompts = {
    'feature_extraction': """
    Analyze this text and extract all mentioned software features.
    For each feature provide:
    - Feature ID (if mentioned)
    - Feature name
    - Brief description
    - Status (new/existing/modified)
    Format the response as a JSON list.
    Give ONLY the JSON, no extra text, please.
    """,
    
    'requirements': """
    Identify all requirements mentioned in this text.
    Include:
    - Functional requirements
    - Non-functional requirements
    - Technical constraints
    Format the response as a JSON list.
    Give ONLY the JSON, no extra text, please.
    """,
    
    'action_items': """
    Extract all action items and next steps from this text.
    For each item include:
    - Description
    - Assigned to (if mentioned)
    - Due date (if mentioned)
    - Priority (if mentioned)
    Format the response as a JSON list.
    Give ONLY the JSON, no extra text, please.
    """,
    
    'decisions': """
    Identify all decisions made in this meeting.
    Include:
    - Decision description
    - Context/rationale
    - Stakeholders involved
    Format the response as a JSON list.
    Give ONLY the JSON, no extra text, please.
    """
}

txt_filenames = sorted([z for _, _, z in os.walk("data/txt/")][0])
for filename in txt_filenames:
    with open("data/txt/"+filename, 'r', encoding='utf-8') as file:
        content = file.read()
        os.makedirs(f"data/outputs/{filename.strip('.txt')}", exist_ok=True)
        for name, prompt in prompts.items():
            print(name)
            print(prompt)
            chat_response = client.chat.complete(
                model= model,
                messages = [
                    {
                        "role": "user",
                        "content": prompt + "\n" + content,
                    },
                ]
            )
            print(f"data/outputs/{filename.strip('.txt')}/{name}.json")
            print(chat_response)
            print()
            resp_str = chat_response.choices[0].message.content.strip('```').strip('json\n')
            data = json.loads(resp_str)
            resp_dict = {"resp": data}
            with open(f"data/outputs/{filename.strip('.txt')}/{name}.json", "w", encoding="utf-8") as file:
                json.dump(resp_dict, file, indent=4)  # indent=4 for readable formatting
            # chat_responses[name][filename] = chat_response.choices[0].message.content


