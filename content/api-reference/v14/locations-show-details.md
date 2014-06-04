---
title: 'Locations .: Get Details'
navigation: 650
category: 'Locations'
action: 'Get Details'
---

Get Location Details
---

This endpoint returns details about a visible location. Requesting an invisible location will return
HTTP 404.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v14/locations/:id
</div>

### No Authentication Required

### cURL Example

```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json https://api.thelevelup.com/v14/locations/123
```

### Example Response

`HTTP/1.1 200 OK`

```json
{
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
}
```
### Errors

#### No live location matches the given ID.

`HTTP/1.1 404 Not Found`

(No response body.)