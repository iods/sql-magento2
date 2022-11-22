Style Guide: SQL
================

Consistency through standards, harmony through self-actualization.

One [SQL] document at a time.


Introduction
------------

Pick a style and stick to it. This is an opinionated style guide.

This is a succinct, opinionated guide whereas you may be looking for discussion
behind everything and why it was done that way.


### Terminology Notes

### Guide Notes


Basics
-----------

### Do

 * Use consistent and descriptive names and identifiers.
 * Use white space wisely for sake of code readibility.
 * Use [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) compliant times when storing time and date information.
 * Use only standard SQL functions vs. vendor-specific functions making it easier
   for reading and portability.
 * Use comments where possible. Use the `/* C Style where you can */` and always 
   finish with a new line.
 * Be smart.
 
 ```
SELECT data_store
  FROM data_storage
 WHERE data_type = 'something.webp';
 ```

### Avoid

 * Using CamelCase because it is hard to read fast, scan.
 * Using prefixed tables or Hungarian notation.
 * Using plurals. It just works better.
 * Using quoted identifiers because it makes it tough for portability.
 * Using Object Oriented Design Principles anywhere here.
 * Being stupid.


Style Rules
-----------

### Commenting

### Formatting

### Naming

### General

### Tables

### Columns

### Aliasing or correlations

### Stored Procedures

### Uniform Suffixes



Language Rules
--------------

### Create

### Query


Appendix
--------

Parting Words
-------------
