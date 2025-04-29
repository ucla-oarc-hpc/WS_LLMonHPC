import requests
import json

url = "http://localhost:11434/api/generate"

payload = {
    "model": "llama3.2:3B",
    "prompt": "Tell me a math joke, but as a pirate",
}

response = requests.post(url, data=json.dumps(payload))

for chunk in response.iter_lines():
    if chunk:
        print(json.loads(chunk)["response"], end="", flush=True)