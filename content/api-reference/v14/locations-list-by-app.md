---
title: 'Locations .: List by App'
navigation: 620
category: 'Locations'
action: 'List by App'
---
List an app’s locations
---

This endpoint returns a list of locations for any display merchants associated with an app. If the
app is “global” (associated with all merchants), then this endpoint will return the same results as
`GET /locations`.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v14/apps/:id/locations
</div>

### No Authentication Required

### Request Parameters

| Param  | Type            | Required | Description                     |
|--------|-----------------|----------|---------------------------------|
| `page` | Integer or null | No       | The page of results to request. |

### cURL Example

```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json https://api.thelevelup.com/v14/apps/1/locations
```

### Example Response

`HTTP/1.1 200 OK`

`Link: <https://api.thelevelup.com/v14/apps/1/locations?page=2>; rel="next"`

```json
[{
  "location": {
    "categories": [1, 2, 3],
    "extended_address": "Suite 101",
    "facebook_url": "http://facebook.com/pizza",
    "hours": "...",
    "id": 123,
    "latitude": 46.08237,
    "locality": "Boston",
     "longitude": 18.23873,
    "menu_url": "http://pizza.com/menu",
    "merchant_description_html": "pizza, pizza, pizza!",
    "merchant_id": 456,
    "merchant_name": "LevelUp Cafe",
    "merchant_tip_preference": "expected",
    "newsletter_url": null,
    "opentable_url": "http://opentable.com/pizza",
    "postal_code": "02114",
    "region": "MA",
    "shown": true,
    "street_address": "1 Congress St",
    "twitter_url": "http://twitter.com/pizza",
    "updated_at": "2014-01-01T00:00:00-04:00",
    "yelp_url": null
  }
}, ...]
```

#### List more locations

To keep this example simple, assume that each page of results only includes 2 locations. Fields
other than `id` and `updated_at` are hidden. Response headers other than “Link” are also not shown.

For the very first page of results, the client simply requests `/v14/apps/:id/locations`.

Request: `https://api.thelevelup.com/v14/apps/:id/locations`

#### Response Headers

`Link: <https://api.thelevelup.com/v14/apps/:id/locations?since=2014-01-01T12:00:00-04:00&last_id=2>; rel="next"`

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

Request: `https://api.thelevelup.com/v14/apps/:id/locations?since=2014-01-01T12:00:00-04:00&last_id=2`

Response Headers:

`Link: <https://api.thelevelup.com/v14/apps/:id/locations?since=2014-01-02T00:00:00-04:00&last_id=4>; rel="next"`

Status Code: 200 OK

Body:

```json
[
  {"location": {"id": 3, "updated_at": "2014-01-01T12:00:00-04:00", ...}},
  {"location": {"id": 4, "updated_at": "2014-01-02T00:00:00-04:00", ...}}
]
```

Finally the next (and currently last) page of results:

Request: `https://api.thelevelup.com/v14/apps/:id/locations?since=2014-01-02T00:00:00-04:00&last_id=4`

Response Headers: (Does not include a Link header.)

Status Code: 204 No Content

Body:
(empty)

Since the client got a 204 response, it knows that it is done retrieving updates for now. If it
stores this most recent URL, then it can use this the next time it wants to start retrieving updates,
and if it gets back a 200 response, it can continue paginating until it gets back a 204 again.

