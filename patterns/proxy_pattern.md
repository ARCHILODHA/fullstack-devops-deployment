
# Proxy Pattern

## Overview
The Proxy Pattern is a structural design pattern that provides a substitute object that controls access to another object.

The proxy acts as an intermediary between the client and the actual object.

## Why Proxy Pattern?

- Controls access to sensitive resources.
- Supports lazy initialization.
- Adds caching.
- Provides logging and monitoring.
- Helps manage expensive operations.

## Types of Proxy

### 1. Virtual Proxy
Creates expensive objects only when they are required.

### 2. Protection Proxy
Controls access based on permissions.

### 3. Remote Proxy
Represents an object located on another system.

### 4. Caching Proxy
Stores previously calculated or retrieved results.

### 5. Logging Proxy
Records method calls and related information.

## Components

- Subject: Common interface.
- Real Subject: Actual object.
- Proxy: Controls access to the real subject.
- Client: Interacts with the subject interface.

## Example in Java

```java
interface Document {
    void display();
}

class RealDocument implements Document {
    private final String filename;

    RealDocument(String filename) {
        this.filename = filename;
        loadFromDisk();
    }

    private void loadFromDisk() {
        System.out.println("Loading " + filename);
    }

    public void display() {
        System.out.println("Displaying " + filename);
    }
}

class DocumentProxy implements Document {
    private RealDocument document;
    private final String filename;
    private final boolean authorized;

    DocumentProxy(String filename, boolean authorized) {
        this.filename = filename;
        this.authorized = authorized;
    }

    public void display() {
        if (!authorized) {
            System.out.println("Access denied");
            return;
        }

        if (document == null) {
            document = new RealDocument(filename);
        }

        document.display();
    }
}

public class Main {
    public static void main(String[] args) {
        Document document =
            new DocumentProxy("report.pdf", true);

        document.display();
        document.display();
    }
}
