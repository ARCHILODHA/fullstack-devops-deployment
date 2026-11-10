
# Abstract Factory Pattern

## Overview
The Abstract Factory Pattern is a creational design pattern that provides an interface for creating families of related objects without specifying their concrete classes.

It is useful when multiple objects must work together as part of a consistent product family.

## How It Works

1. Define interfaces for related products.
2. Define an abstract factory interface.
3. Create concrete factories for each product family.
4. Each factory creates compatible products.
5. Client code works with abstract interfaces.

## Real-World Example
A user interface application may support Windows and macOS themes.

Each theme provides matching buttons and checkboxes.

## Components

- Abstract Factory: Declares product creation methods.
- Concrete Factory: Creates a specific product family.
- Abstract Product: Defines a product interface.
- Concrete Product: Implements a product.
- Client: Uses abstract factory and product interfaces.

## Example in Java

```java
interface Button {
    void render();
}

interface Checkbox {
    void render();
}

class WindowsButton implements Button {
    public void render() {
        System.out.println("Windows Button");
    }
}

class MacButton implements Button {
    public void render() {
        System.out.println("Mac Button");
    }
}

class WindowsCheckbox implements Checkbox {
    public void render() {
        System.out.println("Windows Checkbox");
    }
}

class MacCheckbox implements Checkbox {
    public void render() {
        System.out.println("Mac Checkbox");
    }
}

interface UIFactory {
    Button createButton();
    Checkbox createCheckbox();
}

class WindowsFactory implements UIFactory {
    public Button createButton() {
        return new WindowsButton();
    }

    public Checkbox createCheckbox() {
        return new WindowsCheckbox();
    }
}

class MacFactory implements UIFactory {
    public Button createButton() {
        return new MacButton();
    }

    public Checkbox createCheckbox() {
        return new MacCheckbox();
    }
}

public class Main {
    public static void main(String[] args) {
        UIFactory factory = new WindowsFactory();

        Button button = factory.createButton();
        Checkbox checkbox = factory.createCheckbox();

        button.render();
        checkbox.render();
    }
}
