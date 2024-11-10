import fitz  # PyMuPDF
from deep_translator import GoogleTranslator
import os
from tqdm import tqdm

def translate_text(text, src_lang='fi', dest_lang='en'):
    try:
        translated = GoogleTranslator(source=src_lang, target=dest_lang).translate(text)
    except Exception as e:
        print(e)
        return "<translation failed>"
    return translated

def extract_text_from_pdf(pdf_path):
    text = ""
    with fitz.open(pdf_path) as pdf:
        for page_num in range(pdf.page_count):
            page = pdf[page_num]
            text += page.get_text()  # Extract text from each page
    return text

pdfs = []
for _, _, files in os.walk("data/"):
    pdfs = files
    break

pdf_texts = []
pdf_filtered = []
for pdf in tqdm(pdfs):
    if ".pdf" in pdf:
        try:
            fi_text = extract_text_from_pdf("data/"+pdf)
        except Exception as e:
            print(f"error in {pdf} ")
            continue
        if "Aika" in fi_text:
            os.makedirs("data/filtered_pdfs", exist_ok=True)
            os.rename("data/"+pdf, "data/filtered_pdfs/"+pdf)
            pdf_filtered.append(pdf)
            bs = 4999
            if len(fi_text) >= bs:
                en_text = [translate_text(fi_text[i:i + bs]) for i in range(0, len(fi_text), bs)]
            else:
                en_text = translate_text(fi_text)
            pdf_texts.append(en_text)


for i, t in enumerate(pdf_texts):
    with open(f"data/txt/pdf{i:02d}.txt", "w") as file:
        # Write each string in the list to the file, each on a new line
        for string in t:
            file.write(string)


