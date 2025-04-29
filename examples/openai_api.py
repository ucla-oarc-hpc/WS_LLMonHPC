from openai import OpenAI

client = OpenAI(
    base_url="http://localhost:11434/v1", 
    api_key="ollama" 
)

response = client.chat.completions.create(
    model="llama3.2:3b",
    messages=[
        {"role": "user", "content": "Tell me a math joke, but as a pirate"}
    ],
    stream=True,
)

for chunk in response:
    print(chunk.choices[0].delta.content or "", end="", flush=True)