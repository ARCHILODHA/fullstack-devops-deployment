# Adapter Pattern

## Overview
The Adapter Pattern is a structural design pattern that allows two incompatible interfaces to work together.

It acts as a bridge between an existing class and a client that expects a different interface.

## How It Works

1. The client expects a specific interface.
2. An existing class provides a different interface.
3. An adapter implements the expected interface.
4. The adapter converts client requests into calls understood by the existing class.

## Real-World Example
A power adapter allows a device with one plug type to connect to a different electrical socket.

## Components

- Target Interface: Interface expected by the client.
- Adaptee: Existing class with an incompatible interface.
- Adapter: Converts the target interface into the adaptee's interface.
- Client: Uses the target interface.

## Example in Java

```java
interface PaymentProcessor {
    void pay(double amount);
}

class LegacyPaymentSystem {
    void makePayment(double value) {
        System.out.println("Payment processed: " + value);
    }
}

class PaymentAdapter implements PaymentProcessor {
    private final LegacyPaymentSystem legacySystem;

    PaymentAdapter(LegacyPaymentSystem legacySystem) {
        this.legacySystem = legacySystem;
    }

    @Override
    public void pay(double amount) {
        legacySystem.makePayment(amount);
    }
}

public class Main {
    public static void main(String[] args) {
        LegacyPaymentSystem legacy = new LegacyPaymentSystem();

        PaymentProcessor processor = new PaymentAdapter(legacy);
        processor.pay(500);
    }
}
