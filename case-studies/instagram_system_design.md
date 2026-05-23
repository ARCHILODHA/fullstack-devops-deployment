# Instagram System Design

Instagram is a photo and video sharing platform.

## Requirements

- Upload photos/videos
- News feed generation
- Likes and comments
- Real-time notifications

## Components

- API Gateway
- Media Storage
- Feed Service
- Notification Service
- CDN

## Scalability

- Use Redis for caching
- Store media in object storage
- Use Kafka for event streaming
