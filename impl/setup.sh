#!/usr/bin/env sh

# Generic ansible-playbook wrapper implementing the `setup_*.sh` scripts.
#
# args:
#   additional `ansible-playbook` args

tail -F --pid=$$ --lines=0 ansible_apt.log 2> /dev/null &

ansible-playbook site.yml -i hosts --ask-sudo-pass --timeout=10 "$@"
