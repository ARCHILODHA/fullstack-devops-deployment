
# Chain of Responsibility Pattern

## Overview
The Chain of Responsibility Pattern is a behavioral design pattern that passes a request through a sequence of handlers.

Each handler decides whether to process the request or pass it to the next handler.

## How It Works

1. Define a common handler interface.
2. Create concrete handlers.
3. Link handlers into a chain.
4. Send a request to the first handler.
5. Each handler processes or forwards the request.

## Real-World Example
An employee expense request may pass through multiple approval levels:

- Team Lead.
- Department Manager.
- Finance Manager.

Each level handles requests within its approval limit and forwards larger requests.

## Components

- Handler: Defines the processing interface.
- Concrete Handler: Processes or forwards requests.
- Successor: Reference to the next handler.
- Client: Sends a request into the chain.

## Example in Java

```java
abstract class Approver {
    protected Approver nextApprover;

    void setNext(Approver nextApprover) {
        this.nextApprover = nextApprover;
    }

    abstract void approve(double amount);
}

class TeamLead extends Approver {
    void approve(double amount) {
        if (amount <= 1000) {
            System.out.println("Approved by Team Lead");
        } else if (nextApprover != null) {
            nextApprover.approve(amount);
        }
    }
}

class Manager extends Approver {
    void approve(double amount) {
        if (amount <= 5000) {
            System.out.println("Approved by Manager");
        } else if (nextApprover != null) {
            nextApprover.approve(amount);
        }
    }
}

class Director extends Approver {
    void approve(double amount) {
        if (amount <= 20000) {
            System.out.println("Approved by Director");
        } else {
            System.out.println("Request exceeds approval limit");
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Approver teamLead = new TeamLead();
        Approver manager = new Manager();
        Approver director = new Director();

        teamLead.setNext(manager);
        manager.setNext(director);

        teamLead.approve(800);
        teamLead.approve(4000);
        teamLead.approve(15000);
    }
}
