---
title: 'Access Tokens .: Create'
navigation: 100
category: 'Access Tokens'
action: 'Create'
---

Create an Access Token
---

Given valid credentials, this endpoint returns an access token which may be used to authenticate
subsequent requests.


### Request Endpoint

<div class="http-request">
  <span class="http-verb">POST</span> /v14/access_tokens
</div>

### No Authentication Required

### Request Body

```json
{
  "access_token": {
    "api_key": "6108ab198c116d351019d7b8b4a6b076f3...",
    "username": "foo@example.com",
    "password": "s3cur3"
  }
}
```
### Request Parameters

| Param                   | Type   | Required | Description                           |
|-------------------------|--------|----------|---------------------------------------|
| `api_key`               | String | Yes      | The app's API Key.                    |
| `username`              | String | Yes      | The user’s email address.             |
| `password`              | String | Yes      | The user’s password.                  |

### cURL Example
```bash
curl -X POST -H Content-Type:application/json -H Accept:application/json -d '{"api_key": "6108ab198c116d351019d7b8b4a6b076f3...","username": "foo@example.com","password": "s3cur3"}' https://api.thelevelup.com/v14/access_tokens
```

### Example Response Body

`HTTP/1.1 200 OK`

```json
{
  "access_token": {
    "merchant_id": 1,
    "token": "462246-1ce73f2183c98b5ed8eeMaeda69649...",
    "user_id": 66242
  }
}
```

### Response Parameters

| Parameters      | Type       | Description                                                        |
|-----------------|------------|--------------------------------------------------------------------|
|  `merchant_id`  | Integer    | LevelUp ID of the associated merchant (if present)                 | 
|  `token`        | String     | Access token for the associated merchant (100 bytes maximum)       |
|  `user_id`      | Integer    | LevelUp User ID of the authenticated user                          |

### Errors

`HTTP/1.1 422 Unprocessable Entity` - The specified api_key was not found

```json
[{
    "error": {
        "message": "Api key is invalid.",
        "object": "access_token",
        "property": "api_key"
    }
}]
```

`HTTP/1.1 422 Unprocessable Entity` - The email address or password is incorrect

```json
[{
  "error": {
    "message":"The email address or password you provided is incorrect.",
    "object":"access_token",
    "property":"base"
  }
}]
```
