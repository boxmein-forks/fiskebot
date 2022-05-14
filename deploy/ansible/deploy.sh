#!/bin/bash
set -euo pipefail
ansible-playbook --ask-vault-password -i inventory ./site.yml