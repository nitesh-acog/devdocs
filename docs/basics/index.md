---
title: Basic machine setup
---

## Basic Machine setup by Admin

The admin should setup the following:

```markmap
# Basic tools
- ohmyzsh
    - Check for no warnings
- Setting up PKI \
    to login with keys
    - myvm (ssh config)
- Setting up \
    github account
    - adding to interns group
    - adding to "all" group
    - Check for git clone atk-setup
    - Check for git clone tech-coe
    - Do with ssh keys
- XCode tools 
    - `xcode-select --install`
- Chrome
    - permissions to share screen
- vscode
    - Install shell command
    - Install plugins
        - Markdown All in One
        - Remote SSH
        - Remote Explorer
        - Makefile Tools
        - Liveshare
    - Test
        - Users can edit files on myvm
        - Users can invode code in iterm
- Pycharm
    - Install charm command
    - Update to the latest
```

These activities may require admin previleges, and hence should be done admin.

## Machine setup by User
These are the things the user needs to setup:

### Installing homebrew

Install homebrew in userspace, which lets a lot of Unix tools be installed in homebrew.
``` bash
cd ~
mkdir homebrew
curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
export PATH=$HOME/homebrew/bin:$PATH # Add this to ~/.zshrc
brew update
```

### Installing tools with homebrew
Now you have brew setup. Now, do the following:
```
brew install pandoc bat wget hugo envsubst 
brew install pyenv pyenv-virtualenv
```

### Using pyenv
To activate pyenv, add the following to .zshrc. You may need to relogin for these to take effect.

```bash
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)" # Adds the path
    eval "$(pyenv init -)" # Sets up the pyenv shims
    eval "$(pyenv virtualenv-init -)" # Sets up virtualenvs
fi
```
Check if you can install 3.11.0 with `pyenv install 3.11.0`. Check if you can set it as global by `pyenv global 3.11.0`. The rest is covered in python tools.

### Installing node

We are going to install nvm for nodejs: Install nvm and friends. Make sure that you restart the terminal each time so that the changes to zshrc are processed. 
``` bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install –-lts
nvm use node
```
Now type `node -p process.arch` and see if your process architecture `arm64` or `i386` etc shows up. `node -v && npm -v` shows the version numbers. 

Now install the following two commands that you might use often:
``` bash
npm install -g pm2
npm install -g live-server
```
These commands are available for your usage.

### Installing aganitha tool kit
The new aganitha toolkit, which has lot of useful commands and is continually updated 
can be installed as follows:
```
(cd /tmp;rm -rf atk-setup; 
git clone git@github.com:aganitha/atk-setup.git; 
bash atk-setup/bin/atk-install.sh; 
rm -rf atk-setup)
```

You can list all the commands with: `atk-list-commands.sh`. By convention, all the commands start with `atk`. 

### Local customizations
Here are the customizations you can do:

1. Setup your ssh config appropriately. Make sure you have proper configs to login to myvm, own2, own3, and hpc4. 
2. Create folder called `work` in your home folder. That is where you checkin and checkout code. You may rsync this folder between machines so that we only have to rsync this folder between machines.
3. Add `alias less=bat` for nicer less. When you need standard less, you can do `\less`. 

