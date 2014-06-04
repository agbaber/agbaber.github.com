---
title: 'Users .: Get Details'
navigation: 1
category: 'Users'
action: 'Get'
---

Get User Details
---

This endpoint returns details about the user account associated with the access token.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v15/users
</div>

** NOTE: This is a v15 endpoint. Our stable API version is v14. v15 is our beta branch for exciting new features. **

The authorization header should include a user token with the `read_user_basic_info` permission, and
look like the following:

### Authentication Required -- User Token in Header

```
Authorization: token user="123456-75489120749..."
```

### cURL Example

```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json -H 'Authorization:token 123456-75489120749...' https://api.thelevelup.com/v15/users
```

### Example Response

`HTTP/1.1 200 OK`

```json
{
  "user": {
    "born_at": null,
    "cause_id": 123,
    "connected_to_facebook": true,
    "custom_attributes": { "foo": "bar" },
    "email": "ryanp@thelevelup.com",
    "first_name": "Ryan",
    "gender": null,
    "global_credit_amount": 0,
    "id": 123,
    "last_name": "Punxsutawney",
    "merchants_visited_count": 0,
    "orders_count": 0,
    "terms_accepted_at": null,
    "total_savings_amount": 0
  }
}
```
