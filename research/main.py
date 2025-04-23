
"""
This code sample shows Prebuilt Layout operations with the Azure AI Document Intelligence client library.
The async versions of the samples require Python 3.8 or later.

To learn more, please visit the documentation - Quickstart: Document Intelligence (formerly Form Recognizer) SDKs
https://learn.microsoft.com/azure/ai-services/document-intelligence/quickstarts/get-started-sdks-rest-api?pivots=programming-language-python
"""
import os
from azure.core.credentials import AzureKeyCredential
from azure.ai.documentintelligence import DocumentIntelligenceClient
from azure.ai.documentintelligence.models import AnalyzeDocumentRequest
from dotenv import load_dotenv

load_dotenv()

"""
Remember to remove the key from your code when you're done, and never post it publicly. For production, use
secure methods to store and access your credentials. For more information, see 
https://docs.microsoft.com/en-us/azure/cognitive-services/cognitive-services-security?tabs=command-line%2Ccsharp#environment-variables-and-application-configuration
"""
endpoint = os.getenv("ENDPOINT")
key = os.getenv("KEY")

if (endpoint is None or key is None):
    exit(1)


document_intelligence_client  = DocumentIntelligenceClient(
    endpoint=endpoint, credential=AzureKeyCredential(key)
)

def analyze_pdf(path_url):
    
    with open(path_url, "rb") as f:
    
        poller = document_intelligence_client.begin_analyze_document(
            "prebuilt-layout", body=f,
            output_content_format="markdown"
        )
        return poller.result().content


pdf_path = "/home/deepesh/Development/private/freelance/learnza/research/books/in-your-memories.pdf"

markdown_content = analyze_pdf(pdf_path)

md_file_path = pdf_path.replace(".pdf", ".md")

with open(md_file_path, "w", encoding="utf-8") as md_file:
    md_file.write(markdown_content)

print(f"Markdown saved to: {md_file_path}")


