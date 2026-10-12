# Webhooks

## Overview

A webhook is an HTTP callback that allows one system to notify another system when an event occurs.

Instead of continuously polling an API, the receiving application provides a URL that the sending system calls when something changes.

## Flow

```text
Event Occurs
     |
     v
Provider
     |
     | HTTP POST
     v
Webhook Endpoint
     |
     v
Application
     |
     v
Process Event


