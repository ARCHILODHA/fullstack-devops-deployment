

# SQL Injection Prevention

## Introduction
SQL injection occurs when attackers manipulate SQL queries through untrusted input.

It can lead to unauthorized data access, data modification or database compromise.

## Vulnerable Example

```java
String query = "SELECT * FROM users WHERE username = '" + username + "'";
