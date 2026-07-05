# Amazon System Design

## Overview
Amazon is a large-scale e-commerce platform supporting millions of users.

## Functional Requirements
- User registration/login
- Product search
- Shopping cart
- Orders
- Payments
- Reviews

## Non Functional Requirements
- High availability
- Fault tolerance
- Low latency
- Scalability

## Architecture

Client
 ↓
Load Balancer
 ↓
API Gateway
 ↓
User Service
Product Service
Cart Service
Order Service
Payment Service

↓

MySQL
Redis
Kafka
ElasticSearch
S3

## Database

Users
Products
Orders
Payments
Reviews

## Technologies
- Java Spring Boot
- MySQL
- Redis
- Kafka
- Elasticsearch
- Docker
- Kubernetes

## Challenges
- Inventory synchronization
- Payment reliability
- Recommendation engine
