# Job Portal System Design

## 1. Overview

A job portal connects job seekers with recruiters.

Users can create profiles, upload resumes, search jobs, apply for opportunities, and track applications.

Examples:
- Naukri
- Indeed
- LinkedIn Jobs

## 2. Functional Requirements

1. User registration and authentication.
2. Create job seeker profiles.
3. Upload and manage resumes.
4. Recruiters can create company profiles.
5. Recruiters can publish job openings.
6. Search and filter jobs.
7. Apply for jobs.
8. Track application status.
9. Receive job recommendations.
10. Send notifications.

## 3. Non-Functional Requirements

- High availability.
- Fast job search.
- Secure personal information.
- Scalable resume storage.
- Reliable application processing.
- Personalized recommendations.

## 4. High-Level Architecture

Users
  |
Load Balancer
  |
API Gateway
  |
------------------------------------------------
| Authentication Service                       |
| User Profile Service                         |
| Recruiter Service                            |
| Job Management Service                       |
| Search Service                               |
| Application Service                          |
| Recommendation Service                       |
| Notification Service                         |
------------------------------------------------
  |
PostgreSQL / Elasticsearch / Redis / S3 / Kafka

## 5. Technology Stack

| Component | Technology |
|---|---|
| Frontend | React |
| Backend | Spring Boot |
| Database | PostgreSQL |
| Search Engine | Elasticsearch |
| Cache | Redis |
| File Storage | AWS S3 |
| Message Queue | Kafka |
| Authentication | JWT / OAuth |
| Deployment | Docker + Kubernetes |

## 6. Database Design

### Users
- user_id (PK)
- name
- email
- role
- created_at

### JobSeekers
- seeker_id (PK)
- user_id (FK)
- skills
- experience
- location
- resume_url

### Companies
- company_id (PK)
- company_name
- description
- website

### Jobs
- job_id (PK)
- company_id (FK)
- title
- description
- location
- salary_min
- salary_max
- experience_required
- status

### Applications
- application_id (PK)
- job_id (FK)
- seeker_id (FK)
- resume_url
- application_status
- applied_at

## 7. Job Application Flow

1. Job seeker searches for a job.
2. Search Service queries Elasticsearch.
3. User opens a job description.
4. User clicks Apply.
5. Application Service validates the request.
6. Application is saved in PostgreSQL.
7. Kafka publishes ApplicationSubmitted.
8. Recruiter receives a notification.
9. User can track application status.

## 8. Search Architecture

Elasticsearch supports:

- Full-text search.
- Skill-based filtering.
- Location filtering.
- Salary range filtering.
- Experience filtering.
- Relevance ranking.

Job data is synchronized from PostgreSQL to Elasticsearch using asynchronous events.

## 9. Resume Upload Architecture

1. User uploads a PDF resume.
2. Backend generates a secure upload request.
3. Resume is stored in AWS S3.
4. Resume metadata is saved in PostgreSQL.
5. Resume processing service extracts text.
6. Extracted skills can be indexed for search.

## 10. Recommendation Engine

Recommendations can use:

- Skills similarity.
- Experience level.
- Location preferences.
- Job application history.
- User interests.

A recommendation service can rank jobs based on matching scores.

## 11. Scaling Strategy

- Elasticsearch for distributed job search.
- Redis for popular job caching.
- S3 for resume storage.
- Kafka for asynchronous processing.
- Database read replicas.
- CDN for static resources.

## 12. Security

- Hash passwords.
- Use JWT or OAuth authentication.
- Validate uploaded files.
- Apply role-based access control.
- Use HTTPS.
- Protect personal information.
- Use signed URLs for private resumes.

## 13. Important System Design Concepts

- Full-text search
- Microservices
- Object storage
- Event-driven architecture
- Recommendation systems
- Database indexing
- Caching

## 14. Conclusion

A job portal requires efficient search, reliable application processing, secure resume storage, and personalized job recommendations.

Elasticsearch and asynchronous processing are important components for handling large-scale job discovery.
