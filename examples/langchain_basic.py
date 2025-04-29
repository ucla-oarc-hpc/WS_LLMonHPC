from langchain_openai import ChatOpenAI  # ← updated import!
from langchain_core.prompts import PromptTemplate
from langchain_core.runnables import RunnableSequence

# Set up Ollama-compatible model
llm = ChatOpenAI(
    base_url="http://localhost:11434/v1",
    api_key="ollama",  # still required, even though it's a dummy value
    model="llama3.2:3B"
)

# Define the prompt template
prompt = PromptTemplate(
    input_variables=["topic"],
    template="Explain the topic of '{topic}' in simple terms"
)

# Build the chain using LangChain's modern `RunnableSequence` API
chain = prompt | llm

# Run the chain with an input
response = chain.invoke({"topic": "computational chemistry"})

# Print the final response
print(response.content)