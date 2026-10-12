
# Long Polling

## Overview

Long Polling is a communication technique where a client sends a request to a server and the server keeps the connection open until new data becomes available or a timeout occurs.

## Traditional Polling

```text
Client -> Request
Server -> No new data
Client -> Request
Server -> No new data
Client -> Request
Server -> New data
