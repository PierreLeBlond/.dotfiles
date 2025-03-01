## offset pagination

`GET /resources?offset=20&limit=30`

Cons:
- Bad performance for large db and high values
## page-based pagination

`GET /resources?page=2&limit=30`

Pros:
- Links to previous, next, first & last

Cons:
- Repeat itself if data changes between two navigation
- Same as offset pagination

## keyset pagination

`GET /resources?since_id=24&limit=30`

The resources should be orderable, e.g. by date.

Pros:
- Don't care if db is large or if it updates frequently

Cons:
- Navigation is bad
