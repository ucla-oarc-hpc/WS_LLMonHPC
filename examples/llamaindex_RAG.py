import logging
import sys
from llama_index.core import Settings, Document, VectorStoreIndex
from llama_index.embeddings.ollama import OllamaEmbedding
from llama_index.llms.ollama import Ollama
import os
os.environ["TIKTOKEN_CACHE_DIR"] = "$PWD/tiktoken_cache"

# --- Configuration ---
OLLAMA_BASE_URL = "http://localhost:11434"
EMBEDDING_MODEL_NAME = "mxbai-embed-large"
LLM_MODEL_NAME = "phi4:14b" 


print("--- Starting RAG Example ---")
print(f"Using Ollama endpoint: {OLLAMA_BASE_URL}")
print(f"Using Embedding Model: {EMBEDDING_MODEL_NAME}")
print(f"Using LLM: {LLM_MODEL_NAME}")

# sample documents about different fruits.
text_data = [
    "Apples are round fruits that grow on trees. They are typically red, green, or yellow.",
    "Bananas are long, curved fruits with yellow skin when ripe. They grow in clusters.",
    "Oranges are citrus fruits known for their orange color and high vitamin C content. They have a tough peel.",
    "Grapes grow in bunches on vines. They can be green, red, or purple and are often used to make wine.",
]

# Convert the raw text strings into LlamaIndex Document objects
documents = [Document(text=t) for t in text_data]
print(f"\n--- Created {len(documents)} Documents ---")
for i, doc in enumerate(documents):
    print(f"Doc {i+1}: {doc.text[:50]}...") # Print start of each doc

# Set up the embedding model using Ollama
print(f"\n--- Configuring Embedding Model ({EMBEDDING_MODEL_NAME}) ---")
embed_model = OllamaEmbedding(
    model_name=EMBEDDING_MODEL_NAME,
    base_url=OLLAMA_BASE_URL,
    ollama_additional_kwargs={"mirostat": 0}, # Example additional kwarg if needed
)

# Set up the language model (LLM) using Ollama
print(f"--- Configuring LLM ({LLM_MODEL_NAME}) ---")
llm = Ollama(
    model=LLM_MODEL_NAME,
    base_url=OLLAMA_BASE_URL
    # You can add other Ollama parameters here if needed, e.g.:
    # temperature=0.7,
    # additional_kwargs={"mirostat": 0}
)

# Apply the settings globally (or pass them explicitly during index/query)
Settings.llm = llm
Settings.embed_model = embed_model
print("--- LLM and Embedding Model Configured in Settings ---")

# This step involves embedding the documents and storing them in a vector store.
# Since we set Settings globally, VectorStoreIndex will use the configured models.
print("\n--- Creating Vector Store Index ---")
# This might take a moment as it embeds each document using the Ollama API.
try:
    index = VectorStoreIndex.from_documents(documents)
    print("--- Index Created Successfully ---")
except Exception as e:
    print(f"Error creating index: {e}")
    print("Please ensure the Ollama server is running, accessible,")
    print(f"and the embedding model '{EMBEDDING_MODEL_NAME}' is available.")
    sys.exit(1) # Exit if index creation fails

# --- 4. Create Query Engine ---
print("\n--- Creating Query Engine ---")
# The query engine combines retrieval (finding relevant docs) and synthesis (using LLM)
query_engine = index.as_query_engine(
    # You can customize retrieval/synthesis here if needed, e.g.:
    # similarity_top_k=3, # Retrieve top 3 relevant chunks
)
print("--- Query Engine Created ---")

# --- 5. Query the Data ---
query = "What fruit is known for vitamin C and has a peel?"
print(f"\n--- Querying: '{query}' ---")

try:
    response = query_engine.query(query)
    print("\n--- Response ---")
    print(response) # Print the LLM's generated answer

except Exception as e:
    print(f"Error during query: {e}")
    print("Please ensure the Ollama server is running, accessible,")
    print(f"and the LLM '{LLM_MODEL_NAME}' is available.")

print("\n--- RAG Example Finished ---")