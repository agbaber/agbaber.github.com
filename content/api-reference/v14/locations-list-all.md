---
title: 'Locations .: List'
navigation: 610
category: 'Locations'
action: 'List'
---


List All LevelUp Locations
---

This endpoint returns a list of all locations, including locations not marked as visible, updated since the specified
time. Clients are expected to cache this data indefinitely. The response is paginated, and the “Link”
header in the API response contains the URL for the next page of results. When a call returns a
`204 No Content` response, the client knows that they have reached the current end of results.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v14/locations
</div>

### No Authentication Required

### cURL Example
```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json https://api.thelevelup.com/v14/locations
```

### Example Response

```json
[{
  "location": {
    "categories": [1, 2, 3],
    "id": 123,
    "latitude": 46.08237,
    "longitude": 18.23873,
    "merchant_id": 123,
    "merchant_name": "LevelUp Cafe",
    "shown": true,
    "updated_at": "2014-01-01T00:00:00-04:00"
  }
}, {
  "location": {
    "id": 456,
    "shown": false,
    "updated_at": "2014-01-01T00:00:00-04:00"
  }
}, ...]
```

#### Response Headers

| Header | Description                                             |
|--------|---------------------------------------------------------|
| `Link` | The URL to use for requesting the next page of results. |

#### List more locations

To keep this example simple, assume that each page of results only includes 2 locations. Fields
other than `id` and `updated_at` are hidden. Response headers other than “Link” are also not shown.

For the very first page of results, the client simply requests `/locations`.

Request: `https://api.thelevelup.com/v14/locations`

Response Headers:

`Link: <https://api.thelevelup.com/v14/locations?since=2014-01-01T12:00:00-04:00&last_id=2>; rel="next"`

Status Code: 200 OK

Body:

```json
[
  {"location": {"id": 1, "updated_at": "2014-01-01T00:00:00-04:00", ...}},
  {"location": {"id": 2, "updated_at": "2014-01-01T12:00:00-04:00", ...}}
]
```

Note that the “Link” header contains the ID and timestamp of the last location in the list.

The client remembers the value of the “Link” header, and uses it to retrieve the next page of results:

Request: `https://api.thelevelup.com/v14/locations?since=2014-01-01T12:00:00-04:00&last_id=2`

Response Headers:

`Link: <https://api.thelevelup.com/v14/locations?since=2014-01-02T00:00:00-04:00&last_id=4>; rel="next"`

Status Code: 200 OK

Body:

```json
[
  {"location": {"id": 3, "updated_at": "2014-01-01T12:00:00-04:00", ...}},
  {"location": {"id": 4, "updated_at": "2014-01-02T00:00:00-04:00", ...}}
]
```

Finally the next (and currently last) page of results:

Request: `https://api.thelevelup.com/v14/locations?since=2014-01-02T00:00:00-04:00&last_id=4`

Response Headers: (Does not include a Link header.)

Status Code: 204 No Content

Body:
(empty)

Since the client got a 204 response, it knows that it is done retrieving updates for now. If it
stores this most recent URL, then it can use this the next time it wants to start retrieving updates,
and if it gets back a 200 response, it can continue paginating until it gets back a 204 again.

