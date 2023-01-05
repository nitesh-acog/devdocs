---
title: "Python database exercises"
date: 2022-11-30T17:16:53-05:00
summary: Covers framework design and persistent Q
draft: false
---
Let us say that you want to design a system with producer and a consumer. Producer produces some entities independent of consumer. And, consumer consumes the entities producing new entities.

Here is the picture:

``` mermaid
stateDiagram-v2
    Producer1 --> Q : submit jobs
    Producer2 --> Q : submit jobs
    Q --> Consumer1 : process jobs
    Q --> Consumer2 : process jobs
    Q --> Manager : To resubmit
    Q --> Ops : Status Check
```

Here are the things to observe:

1. There can be many producer and consumers. All of them use a persistent queue -- that is a system that can be used by multiple apps and persistent after the app dies too.
2. What is a job? It can be anything! The convention is upto producer and consumer. The persistent Q does not care about it. However, it needs a way to identify the job. Assume that is is a string with maximum length of 2000 characters. 
3. Make sure that there is no abstraction leaks. That is, we do not want any other than the Q to know to implement. We will later work on refinement to make sure even the Q will rely on a strategy to delegate the implementation.

!!! info
    All your projects are prefixed with `atk-training-yourname-q-`. All your commands will be prefixed with `atk-yourname-q-`. We will specify only suffix in the exercises.  All the packages and commands must be checked into dev-pypi.



## Step 0.5: Setting up the project with documentation

Project name: basic. 

To do:

1. Set up the project with README.md. Hint: Create it using `atk-python-gen.sh`. 
2. README.md should contain the problem description and design. Show it is to be used in the system
3. Write a class called PersistentQInterface as an ABC. Wherever you can, use concrete methods. Where not, use abstract methods. 
4. Show how this class can be used by producer, consumer, and other two apps.
5. Use state diagram in mermaid to show how the task flow happens in the system. Consider the various states that the task flows through the system. 

We will evaluate on the following aspects:

1. How good the API is. It is needs to be complete. It needs to be consistent. And, it needs to be as small as possible. And, each function should do one thing really well. It should not require too many arguments.
2. How good the documentation is. It needs be clear, concise, and complete. Use diagrams where needed. All the documentation should be in readme.md which github renders well.
3. The front matter for the documentation should be clear and accurate.

## Step 0.75: Learning pm2 for managing applications

Pm2 is a light weight application manager. Check it out at: https://pm2.keymetrics.io/docs/usage/quick-start/

Do the following tasks, with any of your applications:

```
pm2 start python-app.py --watch foldername # Watches the files and restarts if the files change
pm2 status
```
Learn how to start, stop, delete apps. Since we are developing a system with multiple apps, we need this command to manage applications.

## Step 1: Create a concrete implementation

Use the same project name. Command name: basic

For this implementation, we are going to make the following choices:

1. Producer keeps generating strings, one every 5 seconds. Let that be the job. 
2. Consumer keeps consuming these strings, one every 7 - 15 seconds. Use random number to mimic this behavior. It merely prints the record with time. 
3. Create a class PersistentQSQLite that uses SQLite as a backend to implement the queue
4. Set up a pm2 based sysetem to manage the applications.

Here are some hints:

1. Design the datamodel that is generic enough to support all the operations and transactions.
2. Configure pm2 to start specific number of producers or consumers, while they watch for the code change. 

