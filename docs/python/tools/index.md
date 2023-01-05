---
title: "Tools"
date: 2022-11-30T16:42:58-05:00
summary: "This chapter focuses on python tools: pyenv, virtualenv, pycharm, poetry, pypi "
---

This dev guide walks you through the basics of setup, develop, test, debug, and deploy python code.

#### Basics

We expect that your laptop has the following tools: `pyenv` and `brew` in userspace. Armed with those, test that you can do the following:

Here are the commands that let you install `pyenv` on MacOS, after installing brew in your home directory. For full details consult [aganitha computing environment](https://docs.google.com/document/d/1wst5xNK5D7wo0tRAiV7FDHaThdW9djggf55LmSaBRAc/edit?usp=sharing)

``` bash linenums="1"
# Installs homebrew
cd ~
mkdir homebrew
curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
export PATH=$HOME/homebrew/bin:$PATH # Add this to ~/.zshrc or ~/.bashrct
brew update

# Optional: Do it, if your system does not have python
brew install python
cd $HOME/brew/bin
ln python3 python

# Now install pyenv
brew install pyenv && brew install pyenv-virtualenv
```


* Updating Pyenv itself: `brew update; brew upgrade pyenv`. This updates brings in the ability install new versions of python.
* Checking to see what versions of Python you can install: `pyenv install --list`
* Installing a python environment: `pyenv install 3.11.0`. 
* Using an environment by default: `pyenv global 3.11.0`. After this command, `3.11.0` will be the default python.
* Using an environment specific in a folder: `pyenv local 3.10.8` -- in that folder, and subfolders, `3.10.8` is the default python. In fact, the shell prompt will show that it using that particular version.
* Uninstalling an environment: `pyenv uninstall 3.11.0`

You do not need to install `virtualenvwrappers` at all. Instead, you can use the following to create virtualenvironments.

* Installing a virtual environment called myproject: `pyenv virtualenv myproject` (creates under the current python environment).
* Using a virtual environment: `pyenv global myproject`
* Using an environment specific in a folder: `pyenv local myproject`
* Checking all the existing versions: `pyenv versions`
* Deleting a virtual environment: `pyenv virtualenv-delete myproject`

When you install a virtualenv, it uses the current active python environment to inherit from.

#### File management

In addition to the Unix file commands, the following command is critical to learn:

`rsync -avz source dest`. For instance:

To copy files from localfolder `work/abc` to a remote machine `myvm` which is configured in .ssh/config as:
```
Host myvm
    HostName vm30201.hpc3.aganitha.ai
    User acog
    Port 30201
```
you can do the following:

1. `rsync -avz work/abc myvm:~/work/` That will copy the entire folder `work/abc` into the location `~/work` on the Host `vm30201.hpc3.aganitha.ai`
2. `rsync -avz work/abc/ myvm:~/work/def` That will copy all the *contents* of the folder abc (skipping the toplevel) into the folder `~/work/def` in the remote host. If the folder does not exist, it will create it.

How do you use rsync? Usually, you set it up such a way to sync files from local editing environment onto a server. When you test the application locally, you can sync the files in remote machine and test it there.

### Testing your setup

1. Can you set up your python to be of a specific version? Set it to be 3.11.0 for global.
2. Can you set up a local virtual environment for a specific project? Create a project in a folder. Create a virtual environment with 3.10.7 as the base for local use in that folder.

In the later sections, you will see how you do not have to deal with virtual environments for development purposes. You can all what you want from pycharm itself. 
