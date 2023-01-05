---
title:  "Python Best Practices"
date: 022-11-30T16:44:06-05:00
summary:  "This chapter focus on practicing writing Python code and guidelines"
---

# Chapter 2: Writing python code

The philosophy behind writing code is explained in this article: https://www.linkedin.com/pulse/writing-code-people-read-ramarao-kanneganti/
*To summarize*: Write code as if you want people to read it. And, use it. And, fix it. And, extend it. And, support it.

The best book, in my (Ramarao Kanneganti) opinion to understand about programming is [The pragmatic programmer](https://github.com/rajucs/Book-For-Programmers/blob/master/the-pragmatic-programmer.pdf). You cannot read it in one go. Keep revisiting it to gain new perspective about programming. If you want to see the tips from that book, without the details, check out https://pragprog.com/tips/ 

Programming, as an art and craft is mostly focuses on just those aspects. We will distill the rules here as follows:

#### Readability of code

1. Have meaningful names: Do not name entities arbitrarily. Don't call them "things" or do_test or do_verify. Be specific. A rule of thumb is functions that return something are nouns, functions that execute an action are verbs. Classes are nouns. Methods in the classes are verbs (or nouns, if they are returning values instead of changing the state -- also known as side-effect).
2. Never write a function larger than 20 lines. Originally, I kept it at screen height -- and now I stick to 20 lines, even when I shifted to a 4k monitor. I do not want to scan a lot of the code.
3. Comment only the parts that code does not say. Usually, the intent behind the code. If your code needs comments, that means it is convoluted. Rarely do you have to write such code for performance or API needs. Your code should read like comments!
4. Club the related code together. It could be like in files. Or in the same class. Or, in the same module. It depends on the language, of course. Yet, as a rule, do not make the reader hunt all over for related code.
5. Assume very little on the part of the reader of the code. Hide the details in separate functions. For instance, do not force the reader to learn about schema, when they are looking at the part that does not need the schema knowledge.
6. Use standard patterns to write code. Since readers are used to seeing these patterns, they understand the intent and purpose immediately. Since the patterns code is complex, it helps to know use standard idioms so that the readers are not confused.

Naming conventions from https://peps.python.org/pep-0008/

1. module names short, all-lowercase names. You can use underscores to separate words.
2. classnames in CapWords
3. function names in lowercase, with _ to improve readability
4. variable names, similar to function names
5. all CAPS for constants


#### Use of typing

Typing increases readability, catches errors early, and makes reuse easier.

Rules:

1. Use types for all your code. All the arguments, functions, variables. 
2. Ensure that pycharm does not show any errors. It catches all the type errors.

#### Logical way of writing code

1. Start with the task you need to do. Instead of writing it as a comment, give the task a good name and call that function.
2. Now, in the function, breakdown the task into subtasks. 
3. You combine the tasks as a sequence, if-then-else, or a loop. Hide the big ugly details in functions or tasks. 
4. Now, do the same recursively for subtasks, until each task is less than a dozen lines. If the names of your functions are explanatory enough, you do not need comments
5. When you are creating a function, make sure that it needs as few inputs as possible. Do not depend on global variables to pass on common values. If you must, use a singleton class to interact with global values.

## Python features to learn

Since you are going to be professional programmers, you will have to understand Python in-depth. Here are a few things to help you to develop code for others to use:

1. Learn introspection in python: how to get information about a function etc.
2. Learn to dynamically load a python file and execute a function in that.
3. Learn to use decorators

