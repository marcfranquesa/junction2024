import fitz  # PyMuPDF

def extract_text_from_pdf(pdf_path):
    text = ""
    with fitz.open(pdf_path) as pdf:
        for page_num in range(pdf.page_count):
            page = pdf[page_num]
            text += page.get_text()  # Extract text from each page
    return text

pdf_path = "your_file.pdf"
text = extract_text_from_pdf(pdf_path)
print(text)

