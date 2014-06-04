---
title: 'Users .: Get Details'
navigation: 1120
category: 'Users'
action: 'Get Details'
---

Get Details for a User
---

This endpoint returns details about a user account. It does not return a `merchant_id` key. Use
`merchant_id` from the endpoint described in the section "Grant an OAuth token”. Normal users,
including merchants, may only retrieve their own user details. Admins may retrieve any user. See
section “[Custom user attributes](#custom-user-attributes)” for more information on the
`custom_attributes` key.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v14/users/:id
</div>

### Authentication Required -- User Token in Header

```
Authorization: token 123456-75489120749...
```

### Request Parameters

| Param | Required | Description  |
|-------|----------|--------------|
| `id`  | Yes      | The user ID. |

### cURL Example

```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json -H Authorization:"token 123456-75489120749..." https://api.thelevelup.com/v14/users/123
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
