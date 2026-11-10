
# Template Method Pattern

## Overview
The Template Method Pattern is a behavioral design pattern that defines the skeleton of an algorithm in a base class while allowing subclasses to implement or override specific steps.

The overall algorithm structure remains consistent.

## How It Works

1. Define a base class containing the algorithm.
2. Divide the algorithm into individual steps.
3. Implement common steps in the base class.
4. Allow subclasses to customize selected steps.
5. Execute the complete algorithm through the template method.

## Real-World Example
A data processing application may follow these steps:

1. Read input data.
2. Process data.
3. Validate results.
4. Save output.

Different file formats may implement reading and processing differently while following the same overall workflow.

## Components

- Abstract Class: Defines the template method.
- Concrete Class: Implements specific algorithm steps.
- Template Method: Controls the execution sequence.
- Hook Method: Provides an optional customization point.

## Example in Java

```java
abstract class DataProcessor {

    public final void process() {
        readData();
        transformData();
        saveData();
    }

    abstract void readData();

    abstract void transformData();

    void saveData() {
        System.out.println("Saving processed data");
    }
}

class CSVProcessor extends DataProcessor {
    void readData() {
        System.out.println("Reading CSV file");
    }

    void transformData() {
        System.out.println("Processing CSV data");
    }
}

class JSONProcessor extends DataProcessor {
    void readData() {
        System.out.println("Reading JSON file");
    }

    void transformData() {
        System.out.println("Processing JSON data");
    }
}

public class Main {
    public static void main(String[] args) {
        DataProcessor processor = new CSVProcessor();
        processor.process();

        processor = new JSONProcessor();
        processor.process();
    }
}
