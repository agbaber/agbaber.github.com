---
title: 'Users .: Create'
navigation: 1
category: 'Users'
action: 'Create'
---

Create a User
---

This endpoint creates a user and returns an access token with the requested permissions.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">POST</span>/v15/apps/users
</div>

** NOTE: This is a v15 endpoint.  Our stable API version is v14.  v15 is our beta branch for exciting new features.**

### Authentication Required -- App Token in Header

```
Authorization: token 123456-75489120749...
```

### Request Body

```json
{
  "user": {
    "email": "ryanp@thelevelup.com",
    "first_name": "Ryan",
    "last_name": "Punxsutawney"
  },
  "permission_keynames": [
    "create_first_credit_card",
    "create_orders"
  ]
}
```

### Request Parameters

| Param                   | Required | Description                     |
|-------------------------|----------|---------------------------------|
| `email`                 | Yes      | The new user's email address.   |
| `first_name`            | Yes      | The new user's first name.      |
| `last_name`             | Yes      | The new user's last name.       |
| `permission_keynames`   | Yes      | Array of [permissions](/getting-started/permissions-list/)        |

### cURL Example

```bash
curl -X POST -H Authorization:token 123456-75489120749... -H Accept:application/json -H Content-Type:application/json -d '{"user": {"email": "ryanp@thelevelup.com","first_name": "Ryan","last_name": "Punxsutawney"}, "permission_keynames": ["create_first_credit_card", "create_orders"]}' https://api.thelevelup.com/v15/apps/users
```

### Example Response

`HTTP/1.1 200 OK`

```json
{
  "user": {
    "email": "ryanp@thelevelup.com",
    "first_name": "Ryan",
    "last_name": "Punxsutawney"
  },
  "access_token": {
      "token": "939171-08f16..."
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

`HTTP/1.1 422 Unprocessable Entity`

```
[
    {
        "error": {
            "message": "Permissions missing or keynames invalid",
            "object": "user",
            "property": "base"
        }
    }
]
