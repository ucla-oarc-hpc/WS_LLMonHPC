from faker import Faker
import random
import uuid

fake = Faker()
synthetic_data = []
diagnoses = ["Hypertension", "Diabetes", "Flu", "Healthy"]

for _ in range(100):
    record = {
        "patient_id": str(uuid.uuid4()),
        "name": fake.name(),
        "age": random.randint(20, 90),
        "gender": random.choice(["Male", "Female"]),
        "symptoms": fake.sentence(nb_words=6),
        "diagnosis": random.choice(diagnoses),
        "treatment": fake.sentence(nb_words=8)
    }
    synthetic_data.append(record)

from langchain_ollama import OllamaEmbeddings
from langchain_community.vectorstores import FAISS
from langchain.docstore.document import Document

# Convert synthetic records to Document objects.
documents = []
for record in synthetic_data:
    # You might want to format the record into a readable text.
    content = f"Patient ID: {record['patient_id']}\n" \
              f"Age: {record['age']}\n" \
              f"Gender: {record['gender']}\n" \
              f"Symptoms: {record['symptoms']}\n" \
              f"Diagnosis: {record['diagnosis']}\n" \
              f"Treatment: {record['treatment']}"
    documents.append(Document(page_content=content))

# Initialize embeddings and vector store.
embedding = OllamaEmbeddings(base_url="http://localhost:11434", model= "mxbai-embed-large")  # Ensure you have your API key set if using OpenAI.
vector_store = FAISS.from_documents(documents, embedding)



from langchain_ollama import OllamaLLM
from langchain.chains import RetrievalQA

# Create a retriever from the vector store.
retriever = vector_store.as_retriever()

# Set up your language model (adjust parameters as necessary).
llm = OllamaLLM(base_url="http://localhost:11434", model= "llama3.3", temperature=0)

# Create a RetrievalQA chain.
qa_chain = RetrievalQA.from_chain_type(
    llm=llm,
    chain_type="stuff",  # 'stuff' is one method of combining retrieved docs.
    retriever=retriever
)

# Example query: "What are the common symptoms reported by patients diagnosed with Diabetes?"
query = "What are the common symptoms reported by patients diagnosed with Diabetes?"
answer = qa_chain.invoke(query)
print(answer)