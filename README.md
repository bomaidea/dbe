# dbe

In this repository they are some ways to do audit (LOG) of a database

- v1: one by one
- v2: all in one

### v1 (one by one)

This is a way to do audit of a database, that execute the audit of the table in a separate table for each table of our database, so you will have the double of the tables. 

### v2 (all in one)

This is a way to do audit of a database, that takes all executed queries and store them with the author of the query and the execution time in a single big table.

