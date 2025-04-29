import requests
import json
import argparse

# Ollama settings
OLLAMA_URL = "http://localhost:11434/api/chat"
DEFAULT_MODEL = "llama3.2:3B"
DEFAULT_SYSTEM_PROMPT = "You are a helpful assistant."

def chat(model, system_prompt):
    print(f"🤖 Chat with {model} (type 'exit' to quit)\n")

    messages = [
        {"role": "system", "content": system_prompt}
    ]

    while True:
        user_input = input("You: ")
        if user_input.strip().lower() in ["exit", "quit"]:
            print("👋 Bye!")
            break

        messages.append({"role": "user", "content": user_input})

        payload = {
            "model": model,
            "messages": messages,
            "stream": True
        }

        print("AI: ", end="", flush=True)
        try:
            response = requests.post(OLLAMA_URL, json=payload, stream=True)

            assistant_message = ""
            for line in response.iter_lines():
                if line:
                    data = json.loads(line)
                    delta = data.get("message", {}).get("content", "")
                    print(delta, end="", flush=True)
                    assistant_message += delta
            print("\n")

            messages.append({"role": "assistant", "content": assistant_message})

        except Exception as e:
            print(f"\n[Error] {e}\n")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Chat with an Ollama model")
    parser.add_argument("-m", "--model", type=str, default=DEFAULT_MODEL, help="Model name to use")
    parser.add_argument("-p", "--prompt", type=str, default=DEFAULT_SYSTEM_PROMPT, help="System prompt for the assistant")

    args = parser.parse_args()

    chat(args.model, args.prompt)