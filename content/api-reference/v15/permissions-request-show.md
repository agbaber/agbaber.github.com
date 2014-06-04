---
title: 'Permissions .: Show'
navigation: 2
category: 'Permissions'
action: 'Show'
---

Show a Permissions Request
---

This endpoint returns details about an existing permissions request, including whether it has been
accepted or rejected, and the associated token if applicable. Only the app which created the
permissions request is authorized to call this endpoint.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v15/apps/permissions_requests/:id
</div>

**NOTE: This is a v15 endpoint. Our stable API version is v14. v15 is our beta branch for exciting
new features.**

### Authentication Required -- App Token in Header

```
Authorization: token 123456-75489120749...
```

### cURL Example

```bash
curl -X GET -iH 'Accept: application/json' -H 'Authorization: token 123456-75489120749...' https://api.thelevelup.com/v15/apps/permissions_requests/123
```

### Example Response

`HTTP/1.1 200 OK`

```json
   {
  "permissions_request": {
    "app_id": 45,
    "email": "guy@example.com",
    "id": 205,
    "permission_keynames": ["create_orders"],
    "state": "accepted",
    "token": "123456-75489120749..."
  }
}
```

### Response Parameters

| Param                   | Type    | Description                                                               |
|-------------------------|---------|---------------------------------------------------------------------------|
| `app_id`                | Integer | The LevelUp App ID                                                        |
| `email`                 | String  | The email address of the user who was sent the permissions request        |
| `id`                    | Integer | The LevelUp permission request ID                                         |
| `permission_keynames`   | Array   | Types of permissions requested                                            |
| `state`                 | String  | State of request  (Will be pending until the user approves the request)   |
| `token`                 | String  | The access token granted by the permissions request (If accepted)         |


### Errors

`HTTP/1.1 404 Not Found` - The permissions request does not exist, or belongs to a different app
