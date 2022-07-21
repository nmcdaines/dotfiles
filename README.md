# dotfiles

## Generate SSH Key
```
ssh-keygen -t ed25519 -C "your_email@example.com"
```

## Install brew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Install Ansible
```
brew install ansible
```

cd ~/ansible && ansible-playbook local.yml -K
