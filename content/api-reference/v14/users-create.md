---
title: 'Users .: Create'
navigation: 1100
category: 'Users'
action: 'Create'
---

Create a User
---

This endpoint registers and returns a newly-created user.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">POST</span> /v14/users
</div>

### Authentication Required -- App API Key in Body

### Request Body

```json
{
  "user": {
    "email": "ryanp@thelevelup.com",
    "first_name": "Ryan",
    "last_name": "Punxsutawney",
    "password": "s3cr3t"
  },
  "api_key": "abc123..."
}
```

### Request Parameters

| Param                   | Required | Description                     |
|-------------------------|----------|---------------------------------|
| `email`                 | Yes      | The new user's email address.   |
| `first_name`            | Yes      | The new user's first name.      |
| `last_name`             | Yes      | The new user's last name.       |
| `password`              | Yes      | The new user's password.        |
| `api_key`               | Yes      | The app's api key.              |

### cURL Example
```bash
curl -X POST -H Accept:application/json -H Content-Type:application/json -d '{"user": {"email": "ryanp@thelevelup.com","first_name": "Ryan","last_name": "Punxsutawney","password": "s3cr3t"},"api_key": "123456abcdefg..."}' https://api.thelevelup.com/v14/users
```

### Example Response

`HTTP/1.1 200 OK`

```json
{
  "user": {
    "born_at": null,
    "cause_id": 123,
    "connected_to_facebook": true,
    "custom_attributes": {},
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

### Errors

`HTTP/1.1 422 Unprocessable Entity`

```json
[{
    "error": {
        "message": "Email is already associated with another app powered by LevelUp. If this is your account, you can go back to the login screen and log in using that email address and password.",
        "object": "user",
        "property": "email"
    }
}]
```