
# Cross-Site Scripting (XSS) Prevention

## Introduction
Cross-Site Scripting (XSS) occurs when malicious scripts are injected into webpages viewed by users.

## Types of XSS

### 1. Stored XSS
Malicious content is stored and later displayed to users.

### 2. Reflected XSS
Malicious input is reflected in a response.

### 3. DOM-Based XSS
Client-side JavaScript processes untrusted data unsafely.

## Example of Unsafe Code

```javascript
element.innerHTML = userInput;
