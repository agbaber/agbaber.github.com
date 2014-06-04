---
title: 'App Access Tokens .: Create'
navigation: 1
category: 'App Access Tokens'
action: 'Create'
---

Create an App Access Token for Permissions Request Creation
---

Given valid credentials, this endpoint returns an access token which may be used to authenticate
permissions requests.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">POST</span> /v15/access_tokens
</div>

** NOTE: This is a v15 endpoint.  Our stable API version is v14.  v15 is our beta branch for exciting new features.**

### No Authentication Header Required

### SECURITY WARNING
NOTE: Make sure you *never, ever* (not even once) include your App Secret Key in client-side or decompilable code!

### Request Body

```json
{
  "api_key":"abc123...",
  "client_secret":"xyz987..."
}
```

### Request Parameters

| Parameter               | Type   | Required | Description                                       |
|-------------------------|--------|----------|---------------------------------------------------|
|  `api_key`              | String | Yes      | Your [API Key](/getting-started/sign-up/).        |
|  `client_secret`        | String | Yes      | Your [App Secret Key](/getting-started/sign-up/). |

### cURL Example

```bash
curl -iH 'Content-Type: application/json' --request POST -d '{"access_token": {"api_key": "abc123...","client_secret": "xyz987..."}}' https://api.thelevelup.com/v15/access_tokens
```

### Example Response Body

```json
{
    "access_token": {
        "app_id": 1234,
        "merchant_id": null,
        "token": "123456-d1af6099abe44f01f14690bfa423468f189a78326f1a8b45cdad817367f1f3c8",
        "user_id": null
    }
}
```

### Response Parameters

| Parameters              | Type    | Description                                             |
|-------------------------|---------|---------------------------------------------------------|
| `app_id`                | Integer | The LevelUp App ID                                      |
| `merchant_id`           | Integer | Null                                                    |
| `token`                 | String  | Access token for the associated app (100 bytes maximum) |
| `user_id`               | Integer | Null                                                    |


You will want to store the `app_id` and `token` as they will be used in subsequent calls to LevelUp.

The app access token will remain valid indefinitely.

### Errors

`HTTP/1.1 404 Not Found` - API Key not found

```json
[{
    "error": {
      "message": "API Key is invalid.",
      "object": "access_token",
      "property": "api_key"
    }
}]
```
