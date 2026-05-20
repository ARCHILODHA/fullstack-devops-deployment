# Cache TTL

TTL stands for Time To Live.

## Purpose

Defines how long cache data remains valid.

## Example

```redis
SET user:1 "Archi" EX 60
Data expires after 60 seconds.


---

## 5. `browser_caching.md`

```md
# Browser Caching

Browsers store static resources locally.

## Cached Resources

- CSS
- JavaScript
- Images

## Benefits

- Faster page loading
- Reduced bandwidth usage
