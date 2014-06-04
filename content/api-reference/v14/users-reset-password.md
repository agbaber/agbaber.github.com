---
title: 'Users .: Reset Password'
navigation: 1140
category: 'Users'
action: 'Reset Password'
---

Reset a User's Password
---

This endpoint emails a user instructions about how to recover their account in the event they
have forgotten their password.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">POST</span> /v14/passwords
</div>

### No Authentication Required

### Request Body

```json
{
	"email": "foo@example.com"
}
```

### Request Parameters

| Param   | Type   | Required | Description               |
|---------|--------|----------|---------------------------|
| `email` | String | Yes      | The user's email address. |


### cURL Example

```bash
curl -X POST -H Accept:application/json -H Content-Type:application/json -d '{"email": "foo@example.com"}' https://api.thelevelup.com/v14/passwords
```

### Example Response

#### If the email address belongs to an existing user and they have been emailed instructions about how to reset their password; or if `email` is a valid email address but does not belong to an existing user

`HTTP/1.1 204 No Content`

(No response body.)

### Errors

#### If `email` is blank or otherwise invalid

`HTTP/1.1 422 Unprocessable Entity`

```json
[{
  "error": {
    "object": "base",
    "property": "email",
    "message": "Email is invalid"
  }
}]
```
