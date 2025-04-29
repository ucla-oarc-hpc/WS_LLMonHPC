# Hoffman2 Ollama Launcher

A script to automate deployment and management of Large Language Models (LLMs) on UCLA's Hoffman2 HPC cluster using [Ollama](https://ollama.ai/).

## Overview

This script (`h2-ollama-run.sh`) provides a streamlined way to:

- Launch Ollama on Hoffman2 compute nodes with GPU acceleration
- Automatically set up SSH tunneling for remote access
- Choose between different interfaces (CLI, WebUI, Jupyter)
- Pull and manage LLM models
- Generate text and interact with models
- Clean up resources when done

## Requirements

- Account on Hoffman2 HPC cluster at UCLA
- SSH access to Hoffman2
- `jq` installed on local machine (for better output formatting)
- A terminal that supports ANSI colors

## Basic Usage

```bash
./h2-ollama-run.sh -u your_username
```

## Command Line Options

### Required Options
- `-u [username]` - Your Hoffman2 username (mandatory)

### Resource Options
- `-m [MEMORY]` - Memory requirements in GB (default: 10 GB)
- `-t [TIME]` - Job runtime in HH:MM:SS format (default: 2:00:00)
- `-p` - Request high-priority queue (highp)
- `-g [GPUTYPE]` - Request specific GPU resources (V100, A100, A6000)
- `-n [CORES]` - Number of CPU cores to request (default: 2)

### Interface Options
- `-o [UI_TYPE]` - Interface type:
  - Default: Basic Ollama CLI
  - `webui`: Open WebUI graphical interface
  - `jupyter`: Jupyter Lab interface
- `-l [PORT]` - Custom port for Ollama API (default: 11434)
- `-w [PORT]` - Custom port for WebUI (default: 8081)
- `-j [PORT]` - Custom port for Jupyter (default: 8888)
- `-d [DIRECTORY]` - Custom directory for Ollama models (default: $SCRATCH/ollama_models)

### Help
- `-h` - Show usage message with all options

## Examples

### Basic Usage (CLI only)
```bash
./h2-ollama-run.sh -u your_username
```

### With GPU Acceleration
```bash
./h2-ollama-run.sh -u your_username -g A100
```

### With WebUI Interface
```bash
./h2-ollama-run.sh -u your_username -o webui
```

### With Jupyter Interface
```bash
./h2-ollama-run.sh -u your_username -o jupyter
```

### Custom Resource Allocation
```bash
./h2-ollama-run.sh -u your_username -m 20 -n 4 -t 8:00:00 -g A100
```

## Resource Guidelines

- **Memory (-m)**: Choose based on model size (For CPU-only runs)
  - 3B models: 8GB
  - 7B models: 16GB
  - 70B models: 40GB+
- **Cores (-n)**: More cores = faster processing with CPU models
- **GPU (-g)**: Dramatically improves inference speed 
- **Time (-t)**: Set based on your expected usage session

## Features

### Interfaces

1. **Basic CLI**
   - Command-line interface for model management
   - Text generation capabilities
   - Streamlined interaction with Ollama API

2. **WebUI**
   - Browser-based chat interface
   - Model management dashboard
   - Conversation history & export
   - Multi-model switching
   - File upload and analysis

3. **Jupyter Lab**
   - Integration with Python notebooks
   - Pre-configured for LLM work
   - Includes popular libraries: LangChain, LlamaIndex, etc.

## Connecting to Your Models Locally

One of the best features of this script is that it automatically sets up port forwarding. This means:

- Even though the models are running on Hoffman2's powerful hardware, you can access them from your local computer
- No need to be logged into Hoffman2 directly - everything is accessible through your web browser or terminal
- Local applications can connect to your Ollama models as if they were running on your own machine

## Connecting to Remote Services

The script automatically forwards these services to your local computer via SSH tunneling:

- **Ollama API**: Available at http://localhost:11434
    - Connect local applications that support Ollama
    - Integrate your code using the Ollama API
    - Customize port with `-l` option

- **WebUI**: Available at http://localhost:8081 (when using `-o webui`)
    - Access the chat interface through your browser
    - Customize port with `-w` option

- **Jupyter**: Available at http://localhost:8888 (when using `-o jupyter`)
    - Work with Python notebooks in your browser
    - Customize port with `-j` option

No additional configuration needed! The script will display the final port numbers in case they differ from defaults.

## Acknowledgements

Developed for use with UCLA's Hoffman2 HPC cluster.

