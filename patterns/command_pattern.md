
# Command Pattern

## Overview
The Command Pattern is a behavioral design pattern that turns a request into a standalone object.

It encapsulates the action and its required information, allowing requests to be stored, queued, logged, or executed later.

## How It Works

1. Define a command interface.
2. Create concrete command classes.
3. Associate each command with a receiver.
4. Create an invoker that executes commands.
5. The client configures and triggers commands.

## Real-World Example
A remote control can execute different actions such as turning a television on or off.

Each button represents a command.

## Components

- Command: Declares an execution method.
- Concrete Command: Implements a specific request.
- Receiver: Performs the actual operation.
- Invoker: Triggers the command.
- Client: Creates and configures commands.

## Example in Java

```java
interface Command {
    void execute();
}

class Light {
    void turnOn() {
        System.out.println("Light is ON");
    }

    void turnOff() {
        System.out.println("Light is OFF");
    }
}

class LightOnCommand implements Command {
    private final Light light;

    LightOnCommand(Light light) {
        this.light = light;
    }

    public void execute() {
        light.turnOn();
    }
}

class LightOffCommand implements Command {
    private final Light light;

    LightOffCommand(Light light) {
        this.light = light;
    }

    public void execute() {
        light.turnOff();
    }
}

class RemoteControl {
    private Command command;

    void setCommand(Command command) {
        this.command = command;
    }

    void pressButton() {
        command.execute();
    }
}

public class Main {
    public static void main(String[] args) {
        Light light = new Light();
        RemoteControl remote = new RemoteControl();

        remote.setCommand(new LightOnCommand(light));
        remote.pressButton();

        remote.setCommand(new LightOffCommand(light));
        remote.pressButton();
    }
}
