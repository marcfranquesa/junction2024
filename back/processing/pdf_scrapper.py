import os
import requests
from bs4 import BeautifulSoup
from urllib.parse import urlsplit, unquote
from tqdm import tqdm

# Path to your saved HTML file
html_file_path = 'data/page.html'  # Replace with the actual path

# Directory to save the PDFs
download_dir = 'data'  # Change this if you want a different directory
os.makedirs(download_dir, exist_ok=True)  # Create the directory if it doesn't exist

# Open and read the saved HTML file
with open(html_file_path, 'r', encoding='utf-8') as file:
    html_content = file.read()

# Parse the HTML content with BeautifulSoup
soup = BeautifulSoup(html_content, 'html.parser')

# Find all <a> tags with href attribute containing "api/documents/file/"
api_links = soup.find_all('a', href=True)

# Filter the links that start with "api/documents/file/"
pdf_links = [link['href'] for link in api_links if link['href'].startswith('/api/documents/file/')]

# If the links are relative, prepend the base URL to form complete URLs
base_url = 'https://palvelut.datahub.fi'  # Adjust the base URL if necessary
pdf_urls = [base_url + link for link in pdf_links]

# Function to download a PDF with its original file name
def download_pdf(url, file_path):
    try:
        # Send GET request to the PDF link
        response = requests.get(url)
        
        # Check if the request was successful
        if response.status_code == 200:
            with open(file_path, 'wb') as f:
                f.write(response.content)
        else:
            print(f"Failed to download {url}. Status code: {response.status_code}")
    except Exception as e:
        print(f"Error downloading {url}: {e}")

# Function to extract the PDF file name from the URL
def get_pdf_filename(url):
    # Extract the file name from the URL (last part after '/')
    path = urlsplit(url).path
    filename = os.path.basename(path)  # Get the last part of the URL path
    return unquote(filename)  # Decode any URL-encoded characters

# Download the PDFs
for pdf_url in tqdm(pdf_urls):
    # Extract the filename from the URL
    file_name = get_pdf_filename(pdf_url)
    
    # Generate a file path to save the PDF
    file_path = os.path.join(download_dir, file_name)
    
    # Download the PDF and save it to the file path
    download_pdf(pdf_url, file_path+".pdf")
