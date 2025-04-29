#!/bin/bash

print_banner() {
  clear
  
  # Get terminal width for centering
  TERM_WIDTH=$(tput cols)
  
  # Center text function
  center_text() {
    local text="$1"
    local padding=$(( (TERM_WIDTH - ${#text}) / 2 ))
    printf "%${padding}s%s%${padding}s\n" "" "$text" ""
  }
CYAN=$'\e[1;36m'
BLUE=$'\e[1;34m'
GREEN=$'\e[1;32m'
YELLOW=$'\e[1;33m'
WHITE=$'\e[1;37m'
PURPLE=$'\e[1;35m'
RESET=$'\e[0m'

  echo ""
  for i in {1..3}; do
    clear
    echo ""
    echo -e "${BLUE}    ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️    ${RESET}"
    echo -e "${YELLOW}    🔆 🔆 🔆 🔆 🔆 🔆 🔆 🔆 🔆 🔆 🔆 🔆 🔆 🔆 🔆    ${RESET}"
    sleep 0.1
    clear
    echo ""
    echo -e "${YELLOW}    🔆 🔆 🔆 🔆 🔆 🔆 🔆 🔆 🔆 🔆 🔆 🔆 🔆 🔆 🔆    ${RESET}"
    echo -e "${BLUE}    ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️ ⚡️    ${RESET}"
    sleep 0.1
  done
  
  clear
  echo ""
  echo -e "${BLUE}╔═══════════════════════════════════════════════════════════════════════════╗${RESET}"
  echo -e "${BLUE}║                                                                           ║${RESET}"
  echo -e "${BLUE}║  ${YELLOW}██╗  ██╗ ██████╗ ███████╗███████╗███╗   ███╗ █████╗ ███╗  ██╗██████╗     ${BLUE}║${RESET}" 
  echo -e "${BLUE}║  ${YELLOW}██║  ██║██╔═══██╗██╔════╝██╔════╝████╗ ████║██╔══██╗████╗ ██║╚════██╗    ${BLUE}║${RESET}"
  echo -e "${BLUE}║  ${YELLOW}███████║██║   ██║█████╗  █████╗  ██╔████╔██║███████║██╔██╗██║ █████╔╝    ${BLUE}║${RESET}"
  echo -e "${BLUE}║  ${YELLOW}██╔══██║██║   ██║██╔══╝  ██╔══╝  ██║╚██╔╝██║██╔══██║██║╚████║██╔═══╝     ${BLUE}║${RESET}"
  echo -e "${BLUE}║  ${YELLOW}██║  ██║╚██████╔╝██║     ██║     ██║ ╚═╝ ██║██║  ██║██║ ╚███║███████╗    ${BLUE}║${RESET}"
  echo -e "${BLUE}║  ${YELLOW}╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝     ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚══╝╚══════╝    ${BLUE}║${RESET}"
  echo -e "${BLUE}║                                                                           ║${RESET}"
  echo -e "${BLUE}║                   ${CYAN}L L M   O L L A M A   L A U N C H E R${RESET}                   ${BLUE}║${RESET}"
  echo -e "${BLUE}║                                                                           ║${RESET}"
  echo -e "${BLUE}╚═══════════════════════════════════════════════════════════════════════════╝${RESET}"
  echo ""
    echo -e " ${YELLOW}🚀 ${WHITE}INTERFACES:${RESET} ${GREEN}CLI, WebUI, Jupyter${RESET}"
    echo -e " ${YELLOW}🔥 ${WHITE}GPU ACCESS:${RESET} ${GREEN}CUDA-enabled NVIDIA GPUs${RESET}"
  echo -e ""
  echo -e " ${BLUE}ⓘ ${YELLOW}Press Ctrl+C to exit at any time${RESET}"
  echo -e " ${BLUE}ⓘ ${YELLOW}Run with ${WHITE}-h${YELLOW} flag for detailed usage information${RESET}"
  echo ""
}

# Call the banner function
print_banner
tput sgr0

## USAGE ##
usage ()
{
  clear
  echo ""
  echo -e "${BLUE}╔═══════════════════════════════════════════════════════════════════════════╗${RESET}"
  echo -e "${BLUE}║                                                                           ║${RESET}"
  echo -e "${BLUE}║                    ${YELLOW}HOFFMAN2 LLM ${CYAN}USAGE GUIDE${RESET}                            ${BLUE}║${RESET}"
  echo -e "${BLUE}║                                                                           ║${RESET}"
  echo -e "${BLUE}╚═══════════════════════════════════════════════════════════════════════════╝${RESET}"
  
  echo -e "\n${GREEN}Launch GPU-accelerated Large Language Models on UCLA's Hoffman2 HPC cluster${RESET}\n"

  echo -e "${YELLOW}┌─ REQUIRED OPTIONS ${WHITE}───────────────────────────────────────────────────┐${RESET}"
  echo -e "${YELLOW}│${RESET}"
  echo -e "${YELLOW}│  ${WHITE}-u${RESET} [username]    Your Hoffman2 username (mandatory)${RESET}"
  echo -e "${YELLOW}│${RESET}"
  echo -e "${YELLOW}└───────────────────────────────────────────────────────────────────────┘${RESET}\n"

  echo -e "${CYAN}┌─ RESOURCE OPTIONS ${WHITE}───────────────────────────────────────────────────┐${RESET}"
  echo -e "${CYAN}│${RESET}"
  echo -e "${CYAN}│  ${WHITE}-m${RESET} [MEMORY]     Memory requirements in GB ${GREEN}(default: 10 GB)${RESET}"
  echo -e "${CYAN}│  ${WHITE}-t${RESET} [TIME]       Time of job in HH:MM:SS ${GREEN}(default: 2:00:00)${RESET}"
  echo -e "${CYAN}│  ${WHITE}-p${RESET}              Request high-priority queue (highp)"
  echo -e "${CYAN}│  ${WHITE}-g${RESET} [GPUTYPE]    Request GPU resources (V100, A100, A6000)"
  echo -e "${CYAN}│  ${WHITE}-n${RESET} [CORES]      Number of cores to request ${GREEN}(default: 2)${RESET}"
  echo -e "${CYAN}│${RESET}"
  echo -e "${CYAN}└───────────────────────────────────────────────────────────────────────┘${RESET}\n"

  echo -e "${PURPLE}┌─ INTERFACE OPTIONS ${WHITE}──────────────────────────────────────────────────┐${RESET}"
  echo -e "${PURPLE}│${RESET}" 
  echo -e "${PURPLE}│  ${WHITE}-o${RESET} [UI_TYPE]    UI type ${YELLOW}(webui, jupyter)${RESET}. Default: basic ollama"
  echo -e "${PURPLE}│  ${WHITE}-l${RESET} [PORT]       Custom port for Ollama API ${GREEN}(default: 11434)${RESET}"
  echo -e "${PURPLE}│  ${WHITE}-w${RESET} [PORT]       Custom port for WebUI ${GREEN}(default: 8081)${RESET}"
  echo -e "${PURPLE}│  ${WHITE}-j${RESET} [PORT]       Custom port for Jupyter ${GREEN}(default: 8888)${RESET}"
  echo -e "${PURPLE}│  ${WHITE}-d${RESET} [DIRECTORY]  Custom directory for Ollama models"
  echo -e "${PURPLE}│                  ${GREEN}(default: \$SCRATCH/ollama_models)${RESET}"
  echo -e "${PURPLE}│${RESET}"
  echo -e "${PURPLE}└───────────────────────────────────────────────────────────────────────┘${RESET}\n"

  echo -e "${GREEN}┌─ HELP ${WHITE}──────────────────────────────────────────────────────────────┐${RESET}"
  echo -e "${GREEN}│${RESET}"
  echo -e "${GREEN}│  ${WHITE}-h${RESET}              Show this usage message"
  echo -e "${GREEN}│${RESET}"
  echo -e "${GREEN}└───────────────────────────────────────────────────────────────────────┘${RESET}\n"

  echo -e "${BLUE}Example:${RESET} ./h2-ollama-run.sh -u username -m 20 -g A100 -o webui\n"
  
  exit
}

## CLEANING UP ##
function cleaning()
{
    # Prevent multiple executions of cleaning function
    if ([[ "$CLEANING_IN_PROGRESS" == "true" ]]); then
        return
    fi
    CLEANING_IN_PROGRESS=true
    
    # Temporarily disable trap to prevent re-entry
    trap '' INT
    
    echo -e "\n${BLUE}┌─────────────────────────────────────────┐${RESET}"
    echo -e "${BLUE}│${RESET}       ${YELLOW}CLEANING UP RESOURCES${RESET}             ${BLUE}│${RESET}"
    echo -e "${BLUE}└─────────────────────────────────────────┘${RESET}\n"
    
    # Function to show spinner for operations
    show_spinner() {
        local message="$1"
        local pid=$!
        local spin=0
        local spinner=("⋊>" "⋉>" "<⋊" "<⋉")
        
        echo -n -e "${CYAN}$message${RESET} "
        while kill -0 $pid 2>/dev/null; do
            echo -n -e "\b${spinner[$((spin % 4))]}"
            spin=$((spin + 1))
            sleep 0.2
        done
        echo -e "\b${GREEN}   ✓✓✓${RESET}"
    }
    
    # Terminate Hoffman2 job if JOBID is set
    if [[ -n "$JOBID" ]]; then
        echo -en "${CYAN}Terminating job ${WHITE}$JOBID${CYAN} on Hoffman2...${RESET} "
        ssh ${H2USERNAME}@hoffman2.idre.ucla.edu "qdel $JOBID" >/dev/null 2>&1 &
        show_spinner
    fi
    
    # Stop Apptainer instance if out_host is set
    if [[ -n "$out_host" ]]; then
        echo -en "${CYAN}Stopping Apptainer instance on ${WHITE}$out_host${CYAN}... (This may take a few extra seconds)${RESET} "
        ssh ${H2USERNAME}@hoffman2.idre.ucla.edu "ssh $out_host 'source /u/local/Modules/default/init/modules.sh ; module purge ; module load apptainer ; apptainer instance stop myollama'" >/dev/null 2>&1 &
        show_spinner
    fi
    
    # Kill SSH port forwarding
    if ([[ -n "$SSH_PORT_FWD_PID" ]]); then
        echo -en "${CYAN}Closing network tunnels...${RESET} "
        kill $SSH_PORT_FWD_PID >/dev/null 2>&1 &
        show_spinner
    fi
    
    # Kill QRSH process
    if ([[ -n "$QRSH_PID" ]]); then
        echo -en "${CYAN}Closing remote session...${RESET} "
        kill $QRSH_PID >/dev/null 2>&1 &
        show_spinner
    fi

    echo -en "${CYAN}Cleaning up temporary files...${RESET} "   

    if ([[ -n "$temp_dir" ]]); then
        rm -rf ${temp_dir}
        echo -e "${GREEN}✓${RESET}"
        if ssh -o BatchMode=yes -o ConnectTimeout=5 ${H2USERNAME}@hoffman2.idre.ucla.edu exit >/dev/null 2>&1; then
          ssh ${H2USERNAME}@hoffman2.idre.ucla.edu "sed -i '/${temp_comment}/d' ~/.ssh/authorized_keys"
        fi
    fi

    if [ -n "${SSH_AGENT_PID}" ]; then
        ssh-agent -k >/dev/null 2>&1 
    fi
    if [ -f llmtmp ]; then 
        rm llmtmp >/dev/null 2>&1
    fi

    # Close SSH multiplexing connections
    if [[ -n "$SSH_MASTER_PID" ]]; then
        echo -en "${CYAN}Closing SSH master connection (PID: ${SSH_MASTER_PID})...${RESET} "
        
        # First try graceful exit
        ssh -o ControlPath=~/.ssh/controlmasters/%r@%h:%p -O exit ${H2USERNAME}@hoffman2.idre.ucla.edu 2>/dev/null
        
        # Then kill the process directly if it still exists
        if kill -0 $SSH_MASTER_PID 2>/dev/null; then
            kill $SSH_MASTER_PID 2>/dev/null
            
            # Wait a moment and force kill if still running
            sleep 0.5
            if kill -0 $SSH_MASTER_PID 2>/dev/null; then
                kill -9 $SSH_MASTER_PID 2>/dev/null
            fi
        fi
        
        # Clean up socket files
        rm -rf ~/.ssh/controlmasters 2>/dev/null
        
        echo -e "${GREEN}✓${RESET}"
    fi

    # Cute goodbye animation
    echo -e "\n${BLUE}╔═════════════════════════════════════════╗${RESET}"
    echo -e "${BLUE}║                                         ║${RESET}"
    echo -e "${BLUE}║${RESET}    ${YELLOW}Thanks for using Hoffman2 OLLAMA!${RESET}    ${BLUE}║${RESET}"
    echo -e "${BLUE}║${RESET}                                         ${BLUE}║${RESET}"
    echo -e "${BLUE}║${RESET}    ${PURPLE}See you next time! 👋${RESET}                ${BLUE}║${RESET}"
    echo -e "${BLUE}║                                         ║${RESET}"
    echo -e "${BLUE}╚═════════════════════════════════════════╝${RESET}"
    echo ""
    
    # Small animation
    message=" Powering down AI..."
    msg_length=${#message}
    spinner=("🧠" "⚡" "💫" "✨")

    for i in $(seq 0 $msg_length); do
      clear_line="\r\033[K"
      spin_idx=$((i % 4))
      printf "${clear_line}${CYAN}%s%s${RESET}" "${spinner[$spin_idx]}" "${message:0:$i}"
      sleep 0.1
    done

    # Add final flourish
    printf "\r\033[K${CYAN}%s %s${RESET}" "🧠" "${message}"
    sleep 0.7
    echo -e "\n\n${GREEN}Goodbye! 🚀${RESET}\n"
    
    exit 0
}

# Check if a port is available
check_port_available() {
  local port=$1

  # Prefer lsof if available
  if command -v lsof >/dev/null 2>&1; then
    if lsof -iTCP:"$port" -sTCP:LISTEN -t >/dev/null 2>&1; then
      return 1  # Port is actively in use (LISTENING)
    fi

  # Fallback to netstat
  elif command -v netstat >/dev/null 2>&1; then
    if netstat -an | grep -E "LISTEN" | grep -q ":$port\b"; then
      return 1  # Port is actively in use
    fi

  # Optional: Add `ss` support if available
  elif command -v ss >/dev/null 2>&1; then
    if ss -ltn | awk '{print $4}' | grep -q ":$port$"; then
      return 1
    fi

  else
    echo "Warning: Cannot check port availability, missing tools."
    return 0  # Assume it's available to avoid false negatives
  fi

  return 0  # Port is available
}

## ADD jq command check
check_jq_installed() {
  if ! command -v jq &> /dev/null; then
    echo -e "${RED}Error: jq is not installed.${RESET}"
    echo -e "${YELLOW}jq is required for this script to function properly.${RESET}"
    echo -e "${YELLOW}Installation instructions:${RESET}"
    echo -e "  ${WHITE}macOS:${RESET} brew install jq"
    echo -e "  ${WHITE}Ubuntu/Debian:${RESET} sudo apt-get install jq"
    echo -e "  ${WHITE}CentOS/RHEL:${RESET} sudo yum install jq"
    echo ""
    echo -e "${YELLOW}Please install jq and try again.${RESET}"
    exit 1
  fi
  return 0
}

# Check if jq is installed early in script
check_jq_installed

# Set traps for different signals to ensure cleanup happens
trap cleaning EXIT INT TERM HUP

## GETTING COMMAND LINE OPTIONS ###
while getopts ":u:t:m:e:v:g:o:n:d:l:w:j:ph" options ; do
  case $options in
    h ) usage; exit ;;               # Show usage guide
    u ) H2USERNAME=$OPTARG  ;;        # Hoffman2 username
    t ) JOBTIME=$OPTARG ;;            # Job time
    m ) JOBMEM=$OPTARG ;;             # Job memory
    v ) RSTUDIO_VERSION=$OPTARG ;;    # RStudio version
    p ) HIGHP="TRUE" ;;               # Set high priority (HIGHP) to TRUE
    g ) GPUTYPE=$OPTARG ;;            # Set GPU type to the specified value
    o ) UI_TYPE=$OPTARG ;;            # Set UI type (webui, jupyter, etc.)
    n ) NUMCORES=$OPTARG ;;           # Set number of cores
    d ) OLLAMA_MODELS_DIR=$OPTARG ;;  # Custom directory for Ollama models
    l ) OLLAMA_PORT=$OPTARG ;;        # Custom Ollama port
    w ) WEBUI_PORT=$OPTARG ;;         # Custom WebUI port
    j ) JUPYTER_PORT=$OPTARG ;;       # Custom Jupyter port
    : ) echo "-$OPTARG requires an argument"; usage; exit ;;  # Missing argument case
    ? ) echo "-$OPTARG is not an option"; usage ; exit ;;     # Unknown option case
  esac
done


## CHECK USERNAME ##
if [ -z ${H2USERNAME} ] ; then
        echo "MUST ENTER Hoffman2 USER NAME"
        usage
fi

## CHECK MEM ##
if [ -z ${JOBMEM} ] ; then JOBMEM=10 ; fi

## CHECK RUN TIME ##
if [ -z ${JOBTIME} ] ; then JOBTIME="2:00:00" ; fi
WALLTIME=`echo "$JOBTIME" | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'`


## CHECK EXTRA ARGS ##
EXTRA_ARG=""
# Add "highp" if HIGHP is true
if ([[ "$HIGHP" == "TRUE" ]]); then
  EXTRA_ARG+="highp,"
fi
# Add GPU type if GPUTYPE exists
if ([[ -n "$GPUTYPE" ]]); then
  EXTRA_ARG+="${GPUTYPE},gpu,cuda=1,"
fi

# Check NUMCORES
if ([[ -z "$NUMCORES" ]]); then
  NUMCORES=2
fi

if ([[ "$NUMCORES" -le 1 ]]); then
  echo -e "\e[31mYou must request at least 2 cores\e[0m"
  exit 1
fi

# Set Ollama models directory (with default to $SCRATCH/ollama_models)
if ([[ -z "$OLLAMA_MODELS_DIR" ]]); then
  OLLAMA_MODELS_DIR="\$SCRATCH/ollama_models"
else
  # If user provided a custom directory, make sure it exists
  echo "Using custom Ollama models directory: ${OLLAMA_MODELS_DIR}"
fi

## STARING Ollama JOB ##
sleep 2
trap cleaning EXIT

# Determine the UI parameter for apptainer based on UI_TYPE
if ([[ "$UI_TYPE" == "webui" ]]); then
  UI_PARAM="openwebui"
  webui_port=8081
elif ([[ "$UI_TYPE" == "jupyter" ]]); then
  UI_PARAM="jupyter"
  jupyter_port=8888
else
  UI_PARAM=""
fi

# Setup SSH multiplexing to reduce connection count
setup_ssh_connections() {
  echo -e "${CYAN}Setting up SSH connection multiplexing...${RESET}"
  
  # Create control directory if it doesn't exist
  mkdir -p ~/.ssh/controlmasters

  # Create a persistent master connection to login node
  ssh -o ControlMaster=auto \
      -o ControlPath=~/.ssh/controlmasters/%r@%h:%p \
      -o ControlPersist=10m \
      -fNM ${H2USERNAME}@hoffman2.idre.ucla.edu &
  SSH_MASTER_PID=$!
  echo -e "${GREEN}SSH multiplexing enabled for login node${RESET}"
}


# Set port values (use custom if provided, otherwise defaults)
ollama_port=${OLLAMA_PORT:-11434}
webui_port=${WEBUI_PORT:-8081}
jupyter_port=${JUPYTER_PORT:-8888}

# Check if ollama port is available
if ! check_port_available "$ollama_port"; then
  echo -e "${RED}Error: Port $ollama_port (Ollama API) is already in use.${RESET}"
  echo -e "${YELLOW}Use -l option to specify a different port.${RESET}"
  exit 1
fi

# Check UI-specific ports based on UI_TYPE
if ([[ "$UI_TYPE" == "webui" ]]); then
  if ! check_port_available "$webui_port"; then
    echo -e "${RED}Error: Port $webui_port (WebUI) is already in use.${RESET}"
    echo -e "${YELLOW}Use -w option to specify a different port.${RESET}"
    exit 1
  fi
elif ([[ "$UI_TYPE" == "jupyter" ]]); then
  if ! check_port_available "$jupyter_port"; then
    echo -e "${RED}Error: Port $jupyter_port (Jupyter) is already in use.${RESET}"
    echo -e "${YELLOW}Use -j option to specify a different port.${RESET}"
    exit 1
  fi
fi

REMOTE_HOST="hoffman2.idre.ucla.edu"
REMOTE_USER=${H2USERNAME:-your_username_here}
# Function to test for passwordless SSH by attempting a simple SSH connection
function test_ssh_key() {
    ssh -o BatchMode=yes -o ConnectTimeout=5 ${REMOTE_USER}@${REMOTE_HOST} exit
}

echo "Checking Hoffman2 Password..."

if test_ssh_key >/dev/null 2>&1; then
    eval "$(ssh-agent -s)"  >/dev/null
       ssh-add >/dev/null 2>&1

       setup_ssh_connections
else
    # No passwordless login; generate a temporary key and try installing it.
    temp_dir=$(mktemp -d -t tempssh-XXXXXXXX)
    
    # Generate a temporary key pair with a unique comment (using a timestamp).
    temp_comment="temporary-key-for-hpc-session-$(date +%s)"
    ssh-keygen -q -t ed25519 -f "${temp_dir}/temp_key" -N "" -C "${temp_comment}" >/dev/null 2>&1

    # Start a temporary ssh-agent.
    eval "$(ssh-agent -s)" >/dev/null

    # Add the temporary key.
    ssh-add "${temp_dir}/temp_key" >/dev/null 2>&1

    success=0
    if ssh-copy-id -i "${temp_dir}/temp_key.pub" ${REMOTE_USER}@${REMOTE_HOST} >/dev/null 2>&1; then
        success=1
    fi

    if [ $success -ne 1 ]; then
        echo "Password incorrect Exiting..."
        exit 1
        else
          setup_ssh_connections
    fi
fi

ssh -o ControlPath=~/.ssh/controlmasters/%r@%h:%p ${H2USERNAME}@hoffman2.idre.ucla.edu "echo starting ; rm -rf ~/.apptainer/instances/logs" > llmtmp
ssh -o ControlPath=~/.ssh/controlmasters/%r@%h:%p ${H2USERNAME}@hoffman2.idre.ucla.edu "qrsh -N MYOLLAMA -l ${EXTRA_ARG}h_data=${JOBMEM}G,h_rt=${JOBTIME} -pe shared ${NUMCORES} 'source /u/local/Modules/default/init/modules.sh ; module purge ; module load apptainer ; module list ; echo HOSTNAME ; echo \$HOSTNAME ; export ollama_port=$ollama_port ; export webui_port=$webui_port ; export jupyter_port=$jupyter_port ; export OLLAMA_MODELS=${OLLAMA_MODELS_DIR} ; apptainer instance run --nv \$H2_CONTAINER_LOC/h2-ollama-mod-webui-0.6.2.sif myollama ${UI_PARAM} ; echo ollama_start ; sleep infinity'" >> llmtmp 2>/dev/null &
QRSH_PID=$!

## CHECK if SSH WORKED ##
start_bool=`cat llmtmp | grep starting | wc -l`
while [[ ${start_bool} -eq 0 ]]; do
  sleep 1
  start_bool=`cat llmtmp | grep starting | wc -l`
done 

## WAITING FOR JOB TO START ##
# Retrieve the job ID from Hoffman2 with retries
jobid_spinner=("🔍" "🔎" "🔍" "🔎")
jobid_attempts=0
max_jobid_attempts=60

echo -e "${CYAN}Retrieving job ID...${RESET}"

while [[ jobid_attempts -lt max_jobid_attempts ]]; do
  JOBID=$(ssh -o ControlPath=~/.ssh/controlmasters/%r@%h:%p ${H2USERNAME}@hoffman2.idre.ucla.edu "qstat | grep MYOLLAMA | grep ${H2USERNAME} | awk '{print \$1}'")
  
  if ([[ -n "$JOBID" ]]); then
    echo -e "\r${GREEN}Job ID: ${JOBID}${RESET}"
    break
  else
    jobid_attempts=$((jobid_attempts + 1))
    emoji=${jobid_spinner[$((jobid_attempts % 4))]}
    printf "\r%s Waiting for job ID (attempt %d/%d)..." "$emoji" "$jobid_attempts" "$max_jobid_attempts"
    sleep 1
  fi
done

if ([[ -z "$JOBID" ]]); then
  echo -e "\n${YELLOW}Warning: Could not retrieve job ID after $max_jobid_attempts attempts.${RESET}"
  echo -e "${YELLOW}The job may still be running. Continuing...${RESET}"
fi

spinner=("🔄" "🚀" "🌟" "🔥" "✨" "🌀" "💫")
printf "Waiting for ollama to start..."
out_tmp=0
while ([[ ${out_tmp} -ne 1 ]])
do
  for emoji in "${spinner[@]}"; do
    printf "\r%s Waiting for ollama job to start on Hoffman2..." "$emoji" 
    out_tmp=`cat llmtmp | grep "ollama_start" | wc -l`
    sleep 0.3
  done
done
echo -e "\n🚀 Ollama is now ready!"


### OPEN UP PORT
out_host=$(tr -d '\r' < llmtmp | awk '/^HOSTNAME$/ {getline; print $1; exit}' | tr -d '\n')
  # Construct path to log file
LOG_PATH="~/.apptainer/instances/logs/${out_host}/${H2USERNAME}/myollama"

echo ""
echo "Hoffman2 compute node is ${out_host}"


## Checking ports
new_ollama_port=""
while ([[ -z "$new_ollama_port" ]]); do
  new_ollama_port=$(ssh -o ControlPath=~/.ssh/controlmasters/%r@%h:%p ${H2USERNAME}@hoffman2.idre.ucla.edu "ssh ${out_host} 'grep -o \"OLLAMA Running on .* with port [0-9]*\" ${LOG_PATH}.out | tail -1 | grep -o \"[0-9]*$\"'")
  sleep 1
done
ollama_port=$new_ollama_port
out2="${ollama_port}:${out_host}:${ollama_port}"
echo "ollama is running on port is ${ollama_port}"

# Setup additional port forwarding based on UI type
if ([[ "$UI_TYPE" == "webui" ]]); then
  new_webui_port=""
  while ([[ -z "$new_webui_port" ]]); do
  new_webui_port=$(ssh -o ControlPath=~/.ssh/controlmasters/%r@%h:%p ${H2USERNAME}@hoffman2.idre.ucla.edu "ssh ${out_host} 'grep -o \"Running Open WebUI with port [0-9]*\" ${LOG_PATH}.out | tail -1 | grep -o \"[0-9]*\"'")
    sleep 1
  done
  webui_port=$new_webui_port
  echo "webui_port is ${webui_port}"
  webui_mapping="${webui_port}:${out_host}:${webui_port}"
  
  # Port forwarding for both Ollama and WebUI
ssh -o ControlPath=~/.ssh/controlmasters/%r@%h:%p \
    -o StrictHostKeyChecking=no -N \
    -L ${ollama_port}:localhost:${ollama_port} \
    -L ${webui_port}:localhost:${webui_port} \
    -J ${H2USERNAME}@hoffman2.idre.ucla.edu ${H2USERNAME}@${out_host} 2>/dev/null &
SSH_PORT_FWD_PID=$!

elif ([[ "$UI_TYPE" == "jupyter" ]]); then
  new_jupyter_port=""
  while ([[ -z "$new_jupyter_port" ]]); do
    new_jupyter_port=$(ssh -o ControlPath=~/.ssh/controlmasters/%r@%h:%p ${H2USERNAME}@hoffman2.idre.ucla.edu "ssh ${out_host} 'grep -o \"Starting Jupyter Lab on port [0-9]*\" ${LOG_PATH}.out | tail -1 | grep -o \"[0-9]*\"'")
     sleep 1
  done
  jupyter_port=$new_jupyter_port
  echo "jupyter_port is ${jupyter_port}"
  jupyter_mapping="${jupyter_port}:${out_host}:${jupyter_port}"
  
  # Port forwarding for both Ollama and Jupyter
ssh -o ControlPath=~/.ssh/controlmasters/%r@%h:%p \
    -o StrictHostKeyChecking=no -N \
    -L ${ollama_port}:localhost:${ollama_port} \
    -L ${jupyter_port}:localhost:${jupyter_port} \
    -J ${H2USERNAME}@hoffman2.idre.ucla.edu ${H2USERNAME}@${out_host} 2>/dev/null &
SSH_PORT_FWD_PID=$!

else
  # Original port forwarding for Ollama only
ssh -o ControlPath=~/.ssh/controlmasters/%r@%h:%p \
    -o StrictHostKeyChecking=no -N \
    -L ${ollama_port}:localhost:${ollama_port} \
    -J ${H2USERNAME}@hoffman2.idre.ucla.edu ${H2USERNAME}@${out_host} 2>/dev/null &
SSH_PORT_FWD_PID=$!
fi

# Wait for Ollama API and models to be available
echo -e "\n${CYAN}Waiting for Ollama API to initialize...${RESET}"
spinner=("🧠" "⚙️" "🔄" "📊" "🔍" "📡" "🌐")
model_count=0
max_attempts=60  # Avoid infinite loops

# Loop until models are available
attempts=0
while ([[ $model_count -eq 0 && $attempts -lt $max_attempts ]]); do
  attempts=$((attempts + 1))
  
  for emoji in "${spinner[@]}"; do
    printf "\r%s Connecting to Ollama API..." "$emoji"
    
    # Check if Ollama API is responding
    if curl -s "http://localhost:${ollama_port}/api/tags" &>/dev/null; then
      # If we have jq, use it to count models
      if command -v jq &> /dev/null; then
        model_list=$(curl -s "http://localhost:${ollama_port}/api/tags" 2>/dev/null)
        model_count=$(echo "$model_list" | jq -r '.models | length')
        
        # If we found models, break out of the spinner loop
        if ([[ $model_count -gt 0 ]]); then
          break 2  # Break out of both loops
        fi
      else
        # Without jq, check if we get a non-empty response containing "models"
        if curl -s "http://localhost:${ollama_port}/api/tags" | grep -q '"models"'; then
          model_count=1  # Assume models exist if key is found
          break 2  # Break out of both loops
        fi
      fi
    fi
    
    sleep 0.5
  done
  
  # If we've tried many times and still no models, just continue
  if ([[ $attempts -ge $max_attempts ]]); then
    echo -e "\n${YELLOW}Ollama API seems to be running, but no models were detected.${RESET}"
    break
  fi
done

echo -e "\n🚀 Ollama API is ready at ${GREEN}http://localhost:${ollama_port}${RESET}"

# Display available models
if ! command -v jq &> /dev/null; then
  echo -e "${YELLOW}Note: jq is not installed. Model details will be limited.${RESET}"
  # Simple fallback if jq is not available
  echo -e "${CYAN}Available models:${RESET}"
  curl -s "http://localhost:${ollama_port}/api/tags" | grep -o '"name":"[^"]*"' | cut -d'"' -f4
else
  if ([[ $model_count -gt 0 ]]); then
    echo -e "\n${CYAN}Available models:${RESET}"
    echo -e "${WHITE}MODEL NAME       PARAMETERS  QUANT      FAMILY     SIZE      MODIFIED${RESET}"
    echo "$model_list" | jq -r '.models[] | 
      [.name,
       .details.parameter_size,
       .details.quantization_level,
       .details.family,
       (.size / 1024 / 1024 / 1024),
       .modified_at] |
      @tsv' | awk -F'\t' '{printf "%-15s %-11s %-10s %-10s %.2f GB  %s\n", $1, $2, $3, $4, $5, $6}'
  else
    echo -e "${YELLOW}No models found. You may need to pull a model first.${RESET}"
    echo -e "Example: ${WHITE}curl -X POST http://localhost:${ollama_port}/api/pull -d '{\"model\":\"llama3:latest\"}'${RESET}"
  fi
fi

## OPENING UP BROWSER ##
spinner=("🌍" "🌎" "🌏" "🌕" "🌖" "🌗" "🌘")

if ([[ "$UI_TYPE" == "webui" ]]); then
  # Wait for WebUI to be ready
  while ! curl -s -o /dev/null -w "%{http_code}" http://localhost:${webui_port} | grep -qE "200|302|403"
  do
    for emoji in "${spinner[@]}"; do
      printf "\r%s Waiting for WebUI job to start on Hoffman2..." "$emoji"
      sleep 0.3
    done
  done
  echo -e "\n🚀 WebUI is now ready at ${GREEN}http://localhost:${webui_port}${RESET}!"
  
  # Auto-open browser for WebUI
  if command -v xdg-open &> /dev/null; then 
    xdg-open http://localhost:${webui_port}
  elif command -v open &> /dev/null; then 
    open http://localhost:${webui_port}
  fi

elif ([[ "$UI_TYPE" == "jupyter" ]]); then
  # Wait for Jupyter to be ready
  while ! curl -s -o /dev/null -w "%{http_code}" http://localhost:${jupyter_port} | grep -qE "200|302|403"
  do
    for emoji in "${spinner[@]}"; do
      printf "\r%s Waiting for Jupyter job to start on Hoffman2..." "$emoji"
      sleep 0.3
    done
  done
  
  
  # Extract token from logs
  jupyter_token=$(ssh -o ControlPath=~/.ssh/controlmasters/%r@%h:%p ${H2USERNAME}@hoffman2.idre.ucla.edu "ssh ${out_host} 'grep -o \"token=[a-zA-Z0-9]*\" ${LOG_PATH}.err | tail -1 | cut -d= -f2'")  
  if ([[ -n "$jupyter_token" ]]); then
    # Token found, construct the full URL
    jupyter_url="http://localhost:${jupyter_port}/lab?token=${jupyter_token}"
    echo -e "\n🚀 Jupyter is now ready at ${GREEN}${jupyter_url}${RESET}!"
    
    # Auto-open browser with token
    if command -v xdg-open &> /dev/null; then 
      xdg-open "${jupyter_url}"
    elif command -v open &> /dev/null; then 
      open "${jupyter_url}"
    fi
  else
    echo -e "\n🚀 Jupyter is ready at ${GREEN}http://localhost:${jupyter_port}${RESET}"    
    # Open browser without token
    if command -v xdg-open &> /dev/null; then 
      xdg-open "http://localhost:${jupyter_port}"
    elif command -v open &> /dev/null; then 
      open "http://localhost:${jupyter_port}"
    fi
  fi
fi

### INTERACTIVE OLLAMA COMMANDS ###
function ollama_cli() {
  local choice
  
  # Function to list models with nicer formatting
  list_models() {
    echo -e "\n${CYAN}Fetching available models...${RESET}"
    
    if ! command -v jq &> /dev/null; then
      # Simple output without jq
      echo -e "${YELLOW}Note: Install jq for better formatting${RESET}"
      curl -s "http://localhost:${ollama_port}/api/tags" | grep -o '"name":"[^"]*"' | cut -d'"' -f4
      return
    fi
    
    # Get model list with jq
    local model_data=$(curl -s "http://localhost:${ollama_port}/api/tags" 2>/dev/null)
    local model_count=$(echo "$model_data" | jq -r '.models | length')
    
    if ([[ $model_count -eq 0 ]]); then
      echo -e "${YELLOW}No models currently available.${RESET}"
      return
    fi
    
    echo -e "${WHITE}MODEL NAME       PARAMETERS  QUANT      FAMILY     SIZE      MODIFIED${RESET}"
    echo "$model_data" | jq -r '.models[] | 
      [.name,
       .details.parameter_size,
       .details.quantization_level,
       .details.family,
       (.size / 1024 / 1024 / 1024),
       .modified_at] |
      @tsv' | awk -F'\t' '{printf "%-15s %-11s %-10s %-10s %.2f GB  %s\n", $1, $2, $3, $4, $5, $6}'
  }
  
  # Function to pull a new model
  pull_model() {
    echo -e "\n${CYAN}Available popular models:${RESET}"
    echo -e " ${WHITE}1${RESET}: llama3         - Meta's Llama 3 (8B)"
    echo -e " ${WHITE}2${RESET}: llama3:instruct - Instruction-tuned version"
    echo -e " ${WHITE}3${RESET}: phi3           - Microsoft Phi-3 (mini)"
    echo -e " ${WHITE}4${RESET}: phi3:medium    - Larger Phi-3 model"
    echo -e " ${WHITE}5${RESET}: mistral        - Mistral 7B base model"
    echo -e " ${WHITE}6${RESET}: neural-chat    - Neural Chat (openchat)"
    echo -e " ${WHITE}7${RESET}: llava          - Multimodal model (vision)"
    echo -e " ${WHITE}8${RESET}: ${YELLOW}custom${RESET}        - Enter custom model name"
    
    read -p "$(echo -e "${CYAN}Enter choice [1-8]:${RESET} ")" model_choice
    
    local model_name=""
    case $model_choice in
      1) model_name="llama3" ;;
      2) model_name="llama3:instruct" ;;
      3) model_name="phi3" ;;
      4) model_name="phi3:medium" ;;
      5) model_name="mistral" ;;
      6) model_name="neural-chat" ;;
      7) model_name="llava" ;;
      8) 
        read -p "$(echo -e "${CYAN}Enter model name (e.g. llama3:8b):${RESET} ")" model_name
        ;;
      *) 
        echo -e "${YELLOW}Invalid choice, returning to menu${RESET}"
        return
        ;;
    esac
    
    if ([[ -n "$model_name" ]]); then
      echo -e "${CYAN}Pulling model ${WHITE}$model_name${CYAN} (this may take a while)...${RESET}"
      
      # Start the curl command in background
      curl -s -X POST "http://localhost:${ollama_port}/api/pull" -d "{\"model\":\"$model_name\"}" > /dev/null 2>&1 &
      curl_pid=$!
      
      local spin=0
      local spinner=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
      
      # Show spinner while download is in progress
      while kill -0 $curl_pid 2>/dev/null; do
        printf "\r${CYAN}%s Downloading model...${RESET}" "${spinner[$((spin % 10))]}"
        spin=$((spin + 1))
        sleep 0.2
      done
      
      echo -e "\r${GREEN}✓ Model $model_name has been downloaded!${RESET}"
    fi
  }
  
  # Function to remove a model
  remove_model() {
    echo -e "\n${CYAN}Fetching models...${RESET}"
    
    # Get list of models for selection
    local model_data=$(curl -s "http://localhost:${ollama_port}/api/tags" 2>/dev/null)
    
    if ! command -v jq &> /dev/null; then
      echo -e "${YELLOW}jq not found. Using basic interface.${RESET}"
      echo "Available models:"
      local models=$(curl -s "http://localhost:${ollama_port}/api/tags" | grep -o '"name":"[^"]*"' | cut -d'"' -f4)
      
      if ([[ -z "$models" ]]); then
        echo -e "${YELLOW}No models available to remove.${RESET}"
        return
      fi
      
      echo "$models" | nl
      read -p "$(echo -e "${CYAN}Enter the number of the model to remove:${RESET} ")" model_num
      
      model_name=$(echo "$models" | sed -n "${model_num}p")
    else
      # Better interface with jq
      local model_count=$(echo "$model_data" | jq -r '.models | length')
      
      if ([[ $model_count -eq 0 ]]); then
        echo -e "${YELLOW}No models available to remove.${RESET}"
        return
      fi
      
      echo -e "${WHITE}NUM  MODEL NAME${RESET}"
      echo "$model_data" | jq -r '.models[] | .name' | nl
      
      read -p "$(echo -e "${CYAN}Enter the number of the model to remove:${RESET} ")" model_num
      
      model_name=$(echo "$model_data" | jq -r ".models[$(($model_num-1))].name" 2>/dev/null)
    fi
    
    if ([[ -n "$model_name" ]]); then
      read -p "$(echo -e "${YELLOW}Confirm deletion of model '$model_name'? (y/n):${RESET} ")" confirm
      
      if ([[ "$confirm" == "y" || "$confirm" == "Y" ]]); then
        echo -e "${CYAN}Removing model ${WHITE}$model_name${CYAN}...${RESET}"
        curl -X DELETE "http://localhost:${ollama_port}/api/delete" -d "{\"name\":\"$model_name\"}"
        echo -e "${GREEN}✓ Model $model_name has been removed!${RESET}"
      else
        echo -e "${YELLOW}Deletion canceled.${RESET}"
      fi
    else
      echo -e "${RED}Invalid model number.${RESET}"
    fi
  }
  
  # Function to generate text with a selected model
generate_text() {
  echo -e "\n${CYAN}Fetching available models...${RESET}"
  
  # Get list of models for selection
  local model_data=$(curl -s "http://localhost:${ollama_port}/api/tags" 2>/dev/null)
  
  if ! command -v jq &> /dev/null; then
    echo -e "${RED}jq is required for proper text formatting. Please install jq.${RESET}"
    return
  fi
  
  # Better interface with jq
  local model_count=$(echo "$model_data" | jq -r '.models | length')
  
  if [[ $model_count -eq 0 ]]; then
    echo -e "${YELLOW}No models available. Please pull a model first.${RESET}"
    return
  fi
  
  echo -e "${WHITE}NUM  MODEL NAME${RESET}"
  echo "$model_data" | jq -r '.models[] | .name' | nl
  
  read -p "$(echo -e "${CYAN}Enter the number of the model to use:${RESET} ")" model_num
  
  model_name=$(echo "$model_data" | jq -r ".models[$(($model_num-1))].name" 2>/dev/null)
  
  if [[ -n "$model_name" ]]; then
    echo -e "${GREEN}Using model: ${WHITE}$model_name${RESET}"
    echo -e "${YELLOW}Enter your prompt below (type on multiple lines if needed)${RESET}"
    echo -e "${YELLOW}When finished, press Ctrl+D on a new line:${RESET}"
    
    # Read multi-line input until EOF (Ctrl+D)
    prompt=$(cat)
    
    if [[ -n "$prompt" ]]; then
      # Create spinner animation
      local spin=0
      local spinner=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
      
      # Create temporary file for response
      temp_response=$(mktemp)
      
      # Create JSON request - use the generate API instead of chat
      local data=$(jq -n --arg model "$model_name" --arg prompt "$prompt" \
                 '{"model": $model, "prompt": $prompt, "stream": false}')
      
      # Start the API request in background
      (curl -s -X POST "http://localhost:${ollama_port}/api/generate" \
           -H "Content-Type: application/json" \
           -d "$data" > "$temp_response") &
      
      curl_pid=$!
      
      # Show spinner while waiting for response
      while kill -0 $curl_pid 2>/dev/null; do
        printf "\r${CYAN}%s Generating response...${RESET}" "${spinner[$((spin % 10))]}"
        spin=$((spin + 1))
        sleep 0.1
      done
      
      echo -e "\r${CYAN}✓ Generating response... complete${RESET}\n"
      
      # Check if response contains an error
      if grep -q "error" "$temp_response"; then
        echo -e "${RED}Error occurred: $(grep -o '"error":"[^"]*"' "$temp_response" | cut -d'"' -f4)${RESET}"
        rm "$temp_response"
        return
      fi
      
      # Extract the response text directly using jq
      response_text=$(jq -r '.response' "$temp_response" 2>/dev/null)
      
      # Display the box header
      echo -e "${BLUE}╔══════════════════════════════════════════════════════════════════════╗${RESET}"
      
      # Split the response text by newlines and format each line
      echo "$response_text" | while IFS= read -r line || [[ -n "$line" ]]; do
        if [[ -z "$line" ]]; then
          # Empty line
          printf "${BLUE}║${RESET}%70s${BLUE}║${RESET}\n" " "
        else
          # Wrap text at 68 characters
          while [[ ${#line} -gt 68 ]]; do
            printf "${BLUE}║${RESET} %-68s ${BLUE}║${RESET}\n" "${line:0:68}"
            line="${line:68}"
          done
          printf "${BLUE}║${RESET} %-68s ${BLUE}║${RESET}\n" "$line"
        fi
      done
      
      echo -e "${BLUE}╚══════════════════════════════════════════════════════════════════════╝${RESET}"
      
      # Clean up temporary file
      rm "$temp_response"
      
      echo -e "\n${GREEN}✓ Generation complete${RESET}"
    else
      echo -e "${YELLOW}Empty prompt. Cancelled.${RESET}"
    fi
  else
    echo -e "${RED}Invalid model number.${RESET}"
  fi
}
  
  # Display the main menu
  while true; do
    echo -e "\n${BLUE}╔═══════════════════════════════════════════════╗${RESET}"
    echo -e "${BLUE}║${RESET}         ${YELLOW}OLLAMA COMMAND INTERFACE${RESET}           ${BLUE}║${RESET}"
    echo -e "${BLUE}╚═══════════════════════════════════════════════╝${RESET}"
    
    echo -e "\n${WHITE}Available commands:${RESET}"
    echo -e " ${CYAN}[${WHITE}1${CYAN}]${RESET} List available models"
    echo -e " ${CYAN}[${WHITE}2${CYAN}]${RESET} Pull new model"
    echo -e " ${CYAN}[${WHITE}3${CYAN}]${RESET} Remove model"
    echo -e " ${CYAN}[${WHITE}4${CYAN}]${RESET} Generate text with a model"
    echo -e " ${CYAN}[${WHITE}e${CYAN}]${RESET} Exit (or press Ctrl+C)"
    
    read -p "$(echo -e "${YELLOW}Enter choice:${RESET} ")" choice
    
    case $choice in
      1) list_models ;;
      2) pull_model ;;
      3) remove_model ;;
      4) generate_text ;;
      e|E|exit|quit) break ;;
      *) echo -e "${RED}Invalid option. Please try again.${RESET}" ;;
    esac
  done
}

### WAITING UNTIL WALLTIME ##
echo -e "\n ${YELLOW}Ollama setup complete!${RESET}"
echo -e "${CYAN}Would you like to start the Ollama command interface?${RESET}"
echo -e " ${CYAN}[${WHITE}y${CYAN}]${RESET} Yes, start the CLI"
echo -e " ${CYAN}[${WHITE}n${CYAN}]${RESET} No, just keep the session active"
echo -e "${CYAN}(You can press ${WHITE}Ctrl+C${CYAN} at any time to exit completely)${RESET}"

read -p "$(echo -e "${YELLOW}Enter choice [y/n]:${RESET} ")" cli_choice

case $cli_choice in
  y|Y|yes|YES|Yes)
    echo -e "\n ${YELLOW}Starting Ollama command interface...${RESET}"
    echo -e "${CYAN}Press ${WHITE}e${CYAN} or ${WHITE}Ctrl+C${CYAN} to exit the CLI at any time.${RESET}"
    ollama_cli
    echo -e "\n ${YELLOW}Exiting command interface. Session remains active until timeout.${RESET}"
    echo -e "${YELLOW}Press ${RED}Ctrl+C${YELLOW} to exit the script completely.${RESET}"
    ;;
  *)
    echo -e "\n ${YELLOW}CLI not started. Session remains active.${RESET}"
    echo -e "${YELLOW}Press ${RED}Ctrl+C${YELLOW} to exit the script completely.${RESET}"
    ;;
esac

sleep $WALLTIME
