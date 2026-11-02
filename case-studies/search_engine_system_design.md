# Search Engine System Design

## 1. Overview

A search engine allows users to search for information across a large collection of web pages and documents.

Examples:
- Google Search
- Bing
- DuckDuckGo

## 2. Functional Requirements

1. Accept search queries.
2. Crawl web pages.
3. Index documents.
4. Retrieve relevant documents.
5. Rank search results.
6. Support autocomplete.
7. Correct spelling mistakes.
8. Support filters.
9. Display snippets.
10. Update indexes periodically.

## 3. Non-Functional Requirements

- Low query latency.
- High availability.
- Large-scale indexing.
- Horizontal scalability.
- Fault tolerance.
- Relevant search results.

## 4. High-Level Architecture

User
  |
Search API
  |
Query Processing
  |
------------------------------------------------
| Query Parser                                  |
| Spell Correction                              |
| Autocomplete                                  |
| Search Retrieval                              |
| Ranking Engine                                |
| Snippet Generator                             |
------------------------------------------------
  |
Distributed Search Index

Background Pipeline:

URL Frontier
    |
Web Crawlers
    |
HTML Parser
    |
Content Processing
    |
Indexer
    |
Distributed Index

## 5. Technology Stack

| Component | Technology |
|---|---|
| Backend | Java / Python |
| Search Index | Elasticsearch |
| Database | PostgreSQL |
| Cache | Redis |
| Message Queue | Kafka |
| Object Storage | S3 |
| Deployment | Kubernetes |
| Monitoring | Prometheus + Grafana |

## 6. Major Components

### Web Crawler
Fetches web pages from the internet.

### URL Frontier
Maintains URLs waiting to be crawled.

### Parser
Extracts text, links, titles, and metadata.

### Indexer
Creates searchable indexes.

### Query Processor
Analyzes user queries.

### Ranking Engine
Ranks documents based on relevance.

## 7. Crawling Flow

1. Load URLs from the frontier.
2. Check robots.txt and crawling policies.
3. Fetch pages.
4. Parse HTML.
5. Extract content and outgoing links.
6. Normalize URLs.
7. Add new URLs to the frontier.
8. Send extracted content to the indexing pipeline.

## 8. Indexing Architecture

An inverted index maps terms to documents containing those terms.

Example:

Term: Java
  -> Document 101
  -> Document 205
  -> Document 310

Term: Docker
  -> Document 205
  -> Document 450

This enables efficient retrieval without scanning every document.

## 9. Search Query Flow

1. User submits a query.
2. Query Processor normalizes the text.
3. Search Service retrieves candidate documents.
4. Ranking Engine calculates relevance.
5. Snippet Generator creates result previews.
6. Search API returns results.

## 10. Ranking Signals

Possible ranking signals:

- Term relevance.
- Document quality.
- Freshness.
- User location, when relevant.
- Link authority.
- Search intent.
- Page performance.

A production ranking system may use machine learning models.

## 11. Redis Usage

Redis can cache:

- Popular queries.
- Autocomplete suggestions.
- Frequently accessed metadata.
- Search result fragments.

## 12. Kafka Usage

Kafka can transport:

- Newly discovered URLs.
- Crawled page events.
- Parsed document events.
- Index update events.

## 13. Scaling Strategy

- Partition the inverted index.
- Replicate index shards.
- Distribute crawlers.
- Use asynchronous indexing.
- Cache popular queries.
- Apply query timeouts.
- Use incremental index updates.

## 14. Challenges

### Duplicate content
Use canonical URLs and content fingerprints.

### Stale information
Schedule recrawling and incremental indexing.

### Query spikes
Use caching and horizontally scalable query services.

### Large index size
Use distributed shards and storage tiers.

## 15. Important System Design Concepts

- Web crawling
- Inverted index
- Distributed indexing
- Search ranking
- Sharding
- Replication
- Caching
- Event-driven architecture

## 16. Conclusion

A search engine combines distributed crawling, large-scale indexing, query processing, and relevance ranking.

Its biggest challenges are maintaining fresh indexes, retrieving relevant results quickly, and scaling across enormous document collections.
