
# Factory Method Pattern

## Overview
The Factory Method Pattern is a creational design pattern that defines an interface for creating objects while allowing subclasses to decide which concrete object should be created.

It separates object creation from the code that uses the object.

## Why Factory Method?

- Reduces direct object creation using `new`.
- Hides concrete implementation details.
- Supports extensibility.
- Makes object creation easier to maintain.

## Components

- Product: Common interface for created objects.
- Concrete Product: Specific product implementation.
- Creator: Declares the factory method.
- Concrete Creator: Implements the factory method.

## Real-World Example
A notification system may create email, SMS, or push notification objects depending on the selected notification type.

## Example in Java

```java
interface Notification {
    void send(String message);
}

class EmailNotification implements Notification {
    public void send(String message) {
        System.out.println("Email: " + message);
    }
}

class SmsNotification implements Notification {
    public void send(String message) {
        System.out.println("SMS: " + message);
    }
}

abstract class NotificationFactory {
    abstract Notification createNotification();

    void notifyUser(String message) {
        Notification notification = createNotification();
        notification.send(message);
    }
}

class EmailFactory extends NotificationFactory {
    Notification createNotification() {
        return new EmailNotification();
    }
}

class SmsFactory extends NotificationFactory {
    Notification createNotification() {
        return new SmsNotification();
    }
}

public class Main {
    public static void main(String[] args) {
        NotificationFactory factory = new EmailFactory();
        factory.notifyUser("Welcome!");

        factory = new SmsFactory();
        factory.notifyUser("Your OTP is 1234");
    }
}
