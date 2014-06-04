---
title: 'Users .: List Addresses'
navigation: 1110
category: 'Users'
action: 'List Addresses'
---

List User Addresses
---

This endpoint returns a list of a user’s associated street addresses.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v14/user_addresses
</div>

### Authentication Required -- User Token in Header

```
Authorization: token 123456-75489120749...
```

### cURL Example

```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json -H Authorization:"token 123456-75489120749..." https://api.thelevelup.com/v14/user_addresses
```

### Example Response

`HTTP/1.1 200 OK`

```json
[{
  "user_address": {
    "address_type": "payment",
    "extended_address": "",
    "id": 149,
    "locality": "Boston",
    "postal_code": "01801",
    "region": "MA",
    "street_address": "123 Fake St"
  }
}, ...]
```

