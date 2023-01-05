---
title: "Databases"
summary: "This chapter focuses on using databases with python"
---

### Databases

# Working with databases

For a brief primer on databases, please consult your favorite book. Here are a few:

1. Very readable, easy to understand guide: https://philip.greenspun.com/sql/introduction.html
2. For database design, this is a good book: [Database design for mere mortals](https://usermanual.wiki/Document/Michael20J20Hernandez2020Database20Design20for20Mere20Mortals20A20HandsOn20Guide20to20Relational20Database20DesignAddisonWesley2.2035279976/help)
3. For SQL, pick any book like [SQL for dummies](https://datubaze.files.wordpress.com/2016/03/a_taylor_sql_for_dummies_2003.pdf)
4. For advanced books, check out [Joe Celko's books](https://www.amazon.com/stores/Joe-Celko/author/B000ARBFVQ?ref=ap_rdr&store_ref=ap_rdr&isDramIntegrated=true&shoppingPortalEnabled=true)

I am assuming that you understand the basics and know enough to reference the books when you need to. We are going to focus more on the practice of programming with databases.

Here is the choice of databases:

* If all you need is a lookup table, use (k,v) database like redis. It has simpler interface than any SQL can offer.
* If you need a database, use relational database. Here are the choices:
    * Use SQLite, if only your application needs the database. Usually, for all web apps where all the ops are run though the web, this is a good choice.
    * When you need to use different apps (like loading, CRUD ops, and reports), especially in a distributed setting, you should use Postgres

If you want to use anything other than these, please check with the office of CTO.

## Preparation of the system

We are going to use [SQLite](https://sqlite.org/index.html) for most of our exercises. First, the installation.
### Installation and testing
`brew install sqlite` installs the command line version. Since there is no server, every library that uses the SQLite DB, uses the C library that is built in. What we will be using is SQLite3. 

Now, test it as the following:
1. Open a database: `sqlite3 example.db`
2. Create a table: `CREATE TABLE COMPANIES (company_name varchar(20), id int);`
3. Add some random values: `INSERT INTO COMPANIES VALUES ("aganitha", 1);`
4. Now exit by issues `ctrl-D` or `.exit`

Now, you will find the database in the file example.db. Now do the following at shell `file example.db` -- you will see that it the sqlite3 database.

Now, copy the file to server. On Linux you can install sqlite using `apt install sqlite3`. 
Open the database using `sqlite3 example.db`. Execute `SELECT * from COMPANIES` and see the results.

The main points are these:
1. SQLite3 does not need a server.
2. Database is a single file that you can copy across machines.

Exercise:
1. Write a program generates 500 inserts into the table. And, execute that SQL program using the commandline. You will see later how you can do it from Python.

## Using sqlite3 with Python

Python has builtin library support for sqlite3. Using it, do the following:

1. Create the table if the table does not exist.
2. Add one milluon rows into the table.
3. Time the function that inserts the rows
4. Get the first 50 rows in the table and print them.


If you are done so far, you can do:

1. Use SQLite3 from command line
2. Use it from python for CRUD operations.

#### Optional

You can install DB Browser in pycharm. Similarly, VS Code also supports DB browser.