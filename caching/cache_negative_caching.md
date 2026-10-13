Negative Caching

Negative caching stores the result of an unsuccessful lookup so that repeated requests for the same missing resource do not repeatedly access the underlying system.

It is useful for handling requests for nonexistent users, products, database records, or DNS entries.

How It Works
Request for Resource
         |
         v
    Check Cache
         |
    +----+----+
    |         |
   Found    Not Found
    |         |
 Return     Check Source
 Value         |
               v
       Resource Missing
               |
               v
       Cache Negative Result

Instead of repeatedly querying the database, the application temporarily remembers that the resource was not found.

Example

Suppose an application repeatedly receives requests for a nonexistent user with ID 999.

Without negative caching:

Request
   |
   v
Database Query
   |
   v
User Not Found

This process repeats for every request.

With negative caching, the application can temporarily store the negative result.

A conceptual cache entry might be:

Key: user:999
Value: NOT_FOUND
TTL: 30 seconds

The application should distinguish this marker from a legitimate user value.

Benefits
Reduces unnecessary database queries.
Helps protect services from repeated requests for missing resources.
Improves response times for repeated unsuccessful lookups.
Reduces load during certain types of traffic spikes.
Risks

Negative caching can temporarily hide newly created resources if a previous missing result remains cached.

Use an appropriate TTL and invalidate the negative entry when the resource is created.

Do not cache every error as a missing resource. A timeout or database failure does not necessarily mean that the requested resource does not exist.

Best Practices
Use short TTLs for negative entries.
Distinguish missing resources from infrastructure errors.
Invalidate entries when resources are created.
Monitor negative cache hit rates.
Apply appropriate limits to cache memory usage.
Conclusion

Negative caching improves efficiency by remembering unsuccessful lookups for a limited period.
