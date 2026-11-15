
# Vault Namespaces

## 1. Introduction

Vault Namespaces provide a way to isolate teams, applications, and environments within a single Vault Enterprise deployment.

They help organizations manage multiple independent Vault environments without requiring completely separate infrastructure.

## 2. What Are Namespaces?

A namespace is an isolated environment inside Vault.

Each namespace can have its own:

- Authentication methods
- Policies
- Secrets engines
- Tokens
- Identity groups
- Configuration

Namespaces are a Vault Enterprise feature.

## 3. Namespace Architecture

Example organizational structure:

```text
Vault
|
|-- development
|   |-- database
|   |-- application
|
|-- production
|   |-- database
|   |-- application
|
|-- testing
    |-- database
    |-- application
