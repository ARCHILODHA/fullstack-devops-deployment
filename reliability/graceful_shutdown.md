
# Graceful Shutdown

## Overview
Graceful shutdown is the process of stopping an application or service without interrupting ongoing requests or leaving resources in an inconsistent state.

Instead of terminating immediately, the application receives a shutdown signal and completes important cleanup operations.

## Why Graceful Shutdown?

- Prevents unnecessary request failures.
- Allows active operations to finish.
- Releases resources safely.
- Supports rolling deployments.
- Reduces data corruption risks.

## Shutdown Workflow

1. Receive a termination signal.
2. Stop accepting new requests.
3. Mark the instance as unavailable.
4. Allow active requests to complete.
5. Close database connections.
6. Stop background workers.
7. Exit the application.

## Example: Node.js

```javascript
const http = require("http");

const server = http.createServer((req, res) => {
    res.end("Application is running");
});

server.listen(3000, () => {
    console.log("Server started on port 3000");
});

function shutdown(signal) {
    console.log(`${signal} received. Starting shutdown.`);

    server.close(async (error) => {
        if (error) {
            console.error("Shutdown error:", error);
            process.exitCode = 1;
        } else {
            console.log("Server stopped accepting connections");
        }

        process.exit();
    });
}

process.on("SIGTERM", () => shutdown("SIGTERM"));
process.on("SIGINT", () => shutdown("SIGINT"));
