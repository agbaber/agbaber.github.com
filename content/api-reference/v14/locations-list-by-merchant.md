---
title: 'Locations .: List by Merchant'
navigation: 630
category: 'Locations'
action: 'List by Merchant'
---

List a Merchant’s Locations
---

This endpoint returns a list of a merchant’s locations. It includes only the information needed by
POS partners. It is not paginated.

### Request

<div class="http-request">
  <span class="http-verb">GET</span> /v14/merchants/:id/locations
</div>

### Response

`HTTP/1.1 200 OK`

```json
[{
  "location": {
    "id": 123,
    "merchant_tip_preference": "expected",
    "name": "Congress Street LevelUp Cafe"
  }
}, ...]
```
