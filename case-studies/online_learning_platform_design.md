# Online Learning Platform System Design

## 1. Overview

An online learning platform allows students to discover courses, enroll, watch video lessons, complete assignments, and track their learning progress.

Examples:
- Coursera
- Udemy
- edX

## 2. Functional Requirements

1. User registration and login.
2. Instructor registration.
3. Course creation and publishing.
4. Course browsing and searching.
5. Student enrollment.
6. Video streaming.
7. Quizzes and assignments.
8. Track course progress.
9. Generate certificates.
10. Course ratings and reviews.

## 3. Non-Functional Requirements

- High availability.
- Low video startup time.
- Scalable video delivery.
- Secure payment processing.
- Reliable progress tracking.
- Global content delivery.

## 4. High-Level Architecture

Users
  |
CDN
  |
Load Balancer
  |
API Gateway
  |
------------------------------------------------
| Authentication Service                       |
| User Service                                 |
| Course Service                               |
| Enrollment Service                           |
| Video Service                                |
| Progress Service                             |
| Assessment Service                           |
| Payment Service                              |
| Certificate Service                          |
------------------------------------------------
  |
PostgreSQL / Redis / S3 / CDN / Kafka

## 5. Technology Stack

| Component | Technology |
|---|---|
| Frontend | React |
| Backend | Spring Boot |
| Database | PostgreSQL |
| Cache | Redis |
| Video Storage | AWS S3 |
| Video Delivery | CloudFront CDN |
| Message Queue | Kafka |
| Search | Elasticsearch |
| Deployment | Kubernetes |

## 6. Database Design

### Users
- user_id (PK)
- name
- email
- role

### Courses
- course_id (PK)
- instructor_id (FK)
- title
- description
- price
- status

### Lessons
- lesson_id (PK)
- course_id (FK)
- title
- video_url
- duration

### Enrollments
- enrollment_id (PK)
- user_id (FK)
- course_id (FK)
- enrolled_at
- status

### Progress
- progress_id (PK)
- user_id (FK)
- lesson_id (FK)
- completed
- last_position
- updated_at

### Certificates
- certificate_id (PK)
- user_id (FK)
- course_id (FK)
- issued_at
- certificate_url

## 7. Video Upload Flow

1. Instructor uploads a video.
2. Video is stored in object storage.
3. Video Processing Service receives an event.
4. Video is transcoded into multiple resolutions.
5. HLS or DASH streaming formats are generated.
6. Processed videos are stored in object storage.
7. CDN distributes video content globally.

## 8. Video Streaming Flow

1. Student opens a lesson.
2. Backend checks enrollment permissions.
3. Video Service generates a secure playback URL.
4. Client requests video segments through CDN.
5. CDN serves cached segments.
6. Video player adapts quality according to network speed.

## 9. Progress Tracking

Progress Service stores:

- Completed lessons.
- Last watched position.
- Quiz scores.
- Course completion percentage.

Progress updates can be batched to reduce database writes.

## 10. Redis Usage

Redis can cache:

- Course details.
- Popular courses.
- User sessions.
- Frequently accessed lesson metadata.

## 11. Kafka Usage

Events:

- CoursePublished
- StudentEnrolled
- VideoProcessed
- LessonCompleted
- CourseCompleted
- CertificateGenerated

## 12. Scaling Strategy

- Use CDN for video delivery.
- Store videos in object storage.
- Transcode videos asynchronously.
- Cache course metadata.
- Partition progress data if required.
- Use database read replicas.

## 13. Failure Handling

### Video processing fails
Retry processing from the original uploaded video.

### Progress update fails
Retry using durable events or local buffering.

### CDN cache miss
Fetch content from origin storage.

### Payment succeeds but enrollment fails
Use idempotent enrollment processing and payment reconciliation.

## 14. Important System Design Concepts

- CDN
- Object storage
- Video transcoding
- HLS and DASH
- Event-driven architecture
- Caching
- Asynchronous processing

## 15. Conclusion

An online learning platform needs scalable video delivery, reliable progress tracking, and efficient course discovery.

CDNs and object storage are essential for delivering educational content to users across different regions.
