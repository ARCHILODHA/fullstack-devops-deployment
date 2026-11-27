

# CSRF Protection

## Introduction
Cross-Site Request Forgery (CSRF) is an attack that tricks an authenticated user's browser into performing an unwanted action.

## How CSRF Works

1. A user logs into a trusted website.
2. The browser stores authentication cookies.
3. The user visits a malicious website.
4. The malicious site triggers a request to the trusted website.
5. The browser may automatically send authentication cookies.

## Prevention Techniques

### CSRF Tokens
Generate unique, unpredictable tokens and validate them on state-changing requests.

### SameSite Cookies
Use appropriate SameSite cookie settings.

Example:
```http
Set-Cookie: session=abc; Secure; HttpOnly; SameSite=Lax
