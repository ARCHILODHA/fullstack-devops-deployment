# Docker Ignore Documentation

## Purpose

The `.dockerignore` file prevents unnecessary files from being copied into Docker images.

## Recommended Entries

```
node_modules
.git
.gitignore
README.md
.env
coverage
dist
logs
*.log
```

## Benefits

- Smaller Docker image
- Faster build
- Improved security
- Better cache performance
