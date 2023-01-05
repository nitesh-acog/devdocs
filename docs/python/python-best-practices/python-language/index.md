---
title: "Python basic exercises"
date: 2022-11-30T17:16:53-05:00
summary: Basic Hello world
draft: false
---

## Using Python

Here are the features we want to exercise:

1. Writing your own module.
2. Using it write a script
3. Plugging that script into pyproject.toml

Best practices wise, we want to you to do:
1. Write modular code
2. Write readable code
3. Follow all the conventions

Here are the conventions to use:

1. Use 3.11 to code your system, unless you can't
2. Use type annotations, wherever it is technically possbile.
3. Ensure that python code has no visible errors in pycharm (that includes unused libs, variables, errors in types etc)
4. The code confirms to P

Here are the guidelines:

1. All your packages should be prefixed with: `atk-training-yourname`
2. Your code shall be in the system at the github URL: `https://github.com/aganitha/tech-coe/tree/main/learning`. Create your name under it and use it add code. We will give the name of the code for each problem
3. All your packages (libraries and commands) will be installed under the same name: `atk-training-yourname-<prj>`
4. All the code should confirm to PEP8: https://peps.python.org/pep-0008/ 

### Tools
The code shall use the following:

1. You generate your project using the command `atk-python-gen.sh`. If you have not yet, install the new atk-setup using the following command where you can access github's aganitha account: 
```
(cd /tmp;rm -rf atk-setup; 
git clone git@github.com:aganitha/atk-setup.git; 
bash atk-setup/bin/atk-install.sh; 
rm -rf atk-setup)
```
1. Use pyenv, pycharm and poetry for your coding. 
2. Test it locally. And, install the command on your person vm and test it there too.
3. The README.md is up to date. Edit all the generated contents and write appropriate comments.
### Basic hello world

Please provide a package called `atk-training-yourname-helloworld`. We are going to test on a new machine, which is set up to access dev-pypi. 
``` bash
# installs the package
pip install atk-training-yourname-helloworld
# Get the help text
atk-yourname-helloworld --help
# Says hello world
atk-yourname-helloworld
# Says hello world with your name
atk-yourname-helloworld --name yourname
```

Concepts to test:

1. Usage of basic tools and work usage
2. Usage of typer

If you are able to do this task, you are ready to do other tasks in basic python.

## Tasks

1. Solve the problem outlined in [data-driven](./data-driven/). 
2. Make sure that you follow all the best practices. 
