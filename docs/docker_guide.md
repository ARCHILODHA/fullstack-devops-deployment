# Docker Guide

## Build Image

```bash
docker build -t my-app .
```

## Run Container

```bash
docker run -d -p 8080:8080 my-app
```

## List Containers

```bash
docker ps
```

## Stop Container

```bash
docker stop <container-id>
```

## Remove Container

```bash
docker rm <container-id>
```
