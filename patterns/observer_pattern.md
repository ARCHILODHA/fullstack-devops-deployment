
# Observer Pattern

## Overview
The Observer Pattern is a behavioral design pattern that establishes a one-to-many relationship between objects.

When one object changes its state, all registered observers are notified automatically.

## How It Works

1. A subject maintains a list of observers.
2. Observers register with the subject.
3. The subject changes its state.
4. The subject notifies all registered observers.
5. Observers respond to the update.

## Real-World Example
A user subscribes to a YouTube channel. Whenever the channel publishes a new video, subscribers receive notifications.

## Components

- Subject: Maintains observer registrations.
- Observer: Defines the notification interface.
- Concrete Subject: Stores state and sends updates.
- Concrete Observer: Responds to notifications.

## Example in Java

```java
import java.util.ArrayList;
import java.util.List;

interface Observer {
    void update(String message);
}

class Subscriber implements Observer {
    private final String name;

    Subscriber(String name) {
        this.name = name;
    }

    public void update(String message) {
        System.out.println(name + " received: " + message);
    }
}

class Channel {
    private final List<Observer> subscribers = new ArrayList<>();

    void subscribe(Observer observer) {
        subscribers.add(observer);
    }

    void unsubscribe(Observer observer) {
        subscribers.remove(observer);
    }

    void uploadVideo(String title) {
        notifySubscribers("New video: " + title);
    }

    private void notifySubscribers(String message) {
        for (Observer observer : subscribers) {
            observer.update(message);
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Channel channel = new Channel();

        Observer user1 = new Subscriber("Archi");
        Observer user2 = new Subscriber("Rahul");

        channel.subscribe(user1);
        channel.subscribe(user2);

        channel.uploadVideo("Design Patterns Explained");
    }
}
