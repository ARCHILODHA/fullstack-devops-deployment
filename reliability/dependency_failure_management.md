
# Dependency Failure Management

## Overview
Modern applications depend on databases, APIs, message brokers, caches, and external services.

Dependency failure management focuses on preventing failures in one component from causing widespread application outages.

## Common Dependency Failures

- Database unavailability.
- Third-party API timeouts.
- Message broker failures.
- Cache outages.
- DNS resolution problems.
- Network interruptions.

## Failure Management Techniques

### 1. Timeout
Set a maximum waiting period for dependency calls.

### 2. Retry
Repeat temporary failures using bounded retry policies.

### 3. Circuit Breaker
Temporarily stop calls to a failing dependency.

### 4. Fallback
Provide an alternative response when a dependency is unavailable.

### 5. Bulkhead
Isolate resources used by different dependencies.

### 6. Queue-Based Processing
Move suitable operations to asynchronous processing.

## Example: Dependency Timeout in Java

```java
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;

public class DependencyClient {
    public static void main(String[] args) throws Exception {

        HttpClient client = HttpClient.newBuilder()
            .connectTimeout(Duration.ofSeconds(3))
            .build();

        HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create("https://example.com"))
            .timeout(Duration.ofSeconds(5))
            .GET()
            .build();

        HttpResponse<String> response = client.send(
            request,
            HttpResponse.BodyHandlers.ofString()
        );

        System.out.println(response.statusCode());
    }
}
