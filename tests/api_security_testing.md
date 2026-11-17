
# API Security Testing

## 1. Introduction

API Security Testing identifies vulnerabilities in application programming interfaces.

APIs often expose sensitive business data and application functionality, making security testing essential.

## 2. What Is API Security Testing?

API security testing evaluates whether an API protects its resources against unauthorized access, misuse, and malicious requests.

It examines:

- Authentication
- Authorization
- Input validation
- Data exposure
- Rate limiting
- Session management
- Transport security

## 3. Common API Vulnerabilities

### Broken Authentication

Weak authentication mechanisms allow unauthorized users to access APIs.

### Broken Object Level Authorization

Users can access resources belonging to other users.

### Excessive Data Exposure

APIs return more information than clients require.

### Injection Attacks

Malicious input manipulates database queries or application behavior.

### Unrestricted Resource Consumption

Attackers send excessive requests to exhaust application resources.

## 4. Example API Security Test

Using JavaScript and Jest:

```javascript
describe("API Security Tests", () => {

  test("should reject unauthenticated requests", async () => {

    const response = await fetch(
      "http://localhost:3000/api/profile"
    );

    expect(response.status).toBe(401);

  });

});
