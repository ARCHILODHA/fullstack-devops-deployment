
# Decorator Pattern

## Overview
The Decorator Pattern is a structural design pattern that adds new behavior to an object dynamically without modifying its original class.

It provides a flexible alternative to creating multiple subclasses.

## How It Works

1. Define a common interface.
2. Create a concrete component.
3. Create a decorator implementing the same interface.
4. Wrap the original object inside the decorator.
5. Add additional behavior before or after delegating to the original object.

## Real-World Example
A coffee can have additional features such as milk, sugar, or chocolate. Each addition decorates the original coffee without changing its basic implementation.

## Components

- Component: Common interface.
- Concrete Component: Original object.
- Decorator: Maintains a reference to another component.
- Concrete Decorator: Adds specific behavior.

## Example in Java

```java
interface Coffee {
    double cost();
    String description();
}

class BasicCoffee implements Coffee {
    public double cost() {
        return 50;
    }

    public String description() {
        return "Basic Coffee";
    }
}

abstract class CoffeeDecorator implements Coffee {
    protected final Coffee coffee;

    CoffeeDecorator(Coffee coffee) {
        this.coffee = coffee;
    }
}

class MilkDecorator extends CoffeeDecorator {
    MilkDecorator(Coffee coffee) {
        super(coffee);
    }

    public double cost() {
        return coffee.cost() + 15;
    }

    public String description() {
        return coffee.description() + ", Milk";
    }
}

public class Main {
    public static void main(String[] args) {
        Coffee coffee = new MilkDecorator(new BasicCoffee());

        System.out.println(coffee.description());
        System.out.println(coffee.cost());
    }
}
