#!/bin/zsh
mkdir -p logs
LOG_FILE_PATH=logs/$0_$(date '+%Y%m%d%H%M%S').log

echo "### start brew bundle"
brew bundle -v | tee -a ${LOG_FILE_PATH}

echo "\n### start brew bundle cleanup"
OUTPUT=$(brew bundle cleanup)
echo "${OUTPUT}\n"
if [[ ${OUTPUT} =~ "Would uninstall casks" ]]; then
    read yn\?'cleanup execute? (y/n): '
    case "${yn}" in
    [yY]*)
        brew bundle cleanup -v -f | tee -a ${LOG_FILE_PATH}
        ;;
    *)
        echo "abort."
        exit 128
        ;;
    esac
else
    echo "no cleanup target."
fi

echo "\n### start ansible-playbook"
ansible-playbook -i "localhost," mac.yaml --diff | tee -a ${LOG_FILE_PATH}
