#!/usr/bin/env bash

#######################################################################
#                       Nvidia GPU config                             #
#######################################################################
### Check nvidia gpu
# Some distro requires that the absolute path is given when invoking lspci
# e.g. /sbin/lspci if the user is not root.
# gpu=$(lspci | grep -i '.* vga .* nvidia .*')

# nocasematch: If set, Bash matches patterns in a case-insensitive fashion
# when performing matching while executing case or [[ conditional commands,
# when performing pattern substitution word expansions, or when filtering
# possible completions as part of programmable completion.
# shopt -s nocasematch

### CUDA PATH
# CUDA_PATH=/usr/local/cuda
# if [ -d "${CUDA_PATH}" ] && [[ $gpu == *' nvidia '* ]]; then
# 	# echo "You have nvgpu and cuda installed!"
# 	export PATH="${CUDA_PATH}/bin"${PATH:+:${PATH}}
# 	export LD_LIBRARY_PATH="${CUDA_PATH}/lib64"${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
# elif [ ! -d "${CUDA_PATH}" ] && [[ $gpu == *' nvidia '* ]]; then
# 	echo "You have nvgpu, but you don't have cuda installed!"
# elif ! [[ $gpu == *' nvidia '* ]]; then
# 	: # return nothing
# 	# echo "You don't have nvgpu or it's not loaded!"
# fi

#######################################################################
#                    gdrive download script                           #
#######################################################################
# download_from_gdrive <FILE_ID> <OUTPUT_FILENAME>
# download_from_gdrive() {
# 	file_id=$1
# 	file_name=$2

# 	# first stage to get the warning html
# 	curl -c /tmp/cookies \
# 		"https://drive.google.com/uc?export=download&id=$file_id" >/tmp/intermezzo.html

# 	# second stage to extract the download link from html above
# 	download_link=$(cat </tmp/intermezzo.html |
# 		grep -Po 'uc-download-link" [^>]* href="\K[^"]*' |
# 		sed 's/\&amp;/\&/g')
# 	curl -L -b /tmp/cookies \
# 		"https://drive.google.com$download_link" >"$file_name"
# }

#######################################################################
#                    ssh-keys loadin check                            #
#######################################################################
# Activate ssh key for github
# ssh-keygen -t ed25519-sk -C "your_email@example.com"
# ssh-add [your-git-key]
# https://stackoverflow.com/a/48509425/9268330
# if [ "$(ps ax | pgrep [s]sh-agent | wc -l)" -gt 0 ]; then
#     : # do nothing
#     # echo "ssh-agent is already running"
# else
#     eval "$(ssh-agent -s)"
#     echo "ssh-agent is now loaded, PID: $SSH_AGENT_PID"
#     if [ "$(ssh-add -l | wc -l)" == "The agent has no identities." ]; then
#         ssh-add ~/.ssh/id_rsa
#         echo "ssh-agent identities loaded."
#     fi

#     # Don't leave extra agents around: kill it on exit. You may not want this part.
#     trap "ssh-agent -k" exit
# fi

#######################################################################
#               fzf: Find Directory and Change                        #
#######################################################################
fzf_change_directory() {
	tmp_dir=$(
		fd --type d |
			fzf --query="$1" --no-multi --select-1 --exit-0 \
				--preview 'tree -C {} | head -100'
	)
	local directory="$tmp_dir"
	if [[ -n $directory ]]; then
		cd "$directory" || exit
	fi
}

alias fcd='fzf_change_directory'
