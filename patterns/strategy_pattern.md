
# Strategy Pattern

## Overview
The Strategy Pattern is a behavioral design pattern that defines a family of interchangeable algorithms and makes them independently selectable.

It allows an application to change its behavior without modifying the code that uses the algorithm.

## How It Works

1. Define a common strategy interface.
2. Implement different algorithms using that interface.
3. Create a context class that uses a strategy.
4. Select the required strategy at runtime.

## Real-World Example
An e-commerce application can support multiple payment methods such as UPI, credit cards, and digital wallets.

Each payment method follows the same interface but implements a different payment process.

## Components

- Strategy Interface: Defines the common algorithm contract.
- Concrete Strategies: Implement different algorithms.
- Context: Uses the selected strategy.
- Client: Selects the appropriate strategy.

## Example in Java

```java
interface PaymentStrategy {
    void pay(double amount);
}

class UpiPayment implements PaymentStrategy {
    public void pay(double amount) {
        System.out.println("Paid using UPI: " + amount);
    }
}

class CardPayment implements PaymentStrategy {
    public void pay(double amount) {
        System.out.println("Paid using Card: " + amount);
    }
}

class PaymentContext {
    private PaymentStrategy strategy;

    PaymentContext(PaymentStrategy strategy) {
        this.strategy = strategy;
    }

    void setStrategy(PaymentStrategy strategy) {
        this.strategy = strategy;
    }

    void executePayment(double amount) {
        strategy.pay(amount);
    }
}

public class Main {
    public static void main(String[] args) {
        PaymentContext context =
            new PaymentContext(new UpiPayment());

        context.executePayment(1000);

        context.setStrategy(new CardPayment());
        context.executePayment(2000);
    }
}
