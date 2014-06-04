---
title: 'Payment Tokens .: Get'
navigation: 900
category: 'Payment Tokens'
action: 'Get'
---

Get the Current User's Payment Token
---

This endpoint allows you to retrieve a user's active payment token to display in customer-facing apps.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v14/payment_token
</div>

### Authentication Required -- User Token in Header

```
Authorization: token 123456-75489120749...
```

### cURL Example

```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json -H "Authorization:token 123456-75489120749..." https://api.thelevelup.com/v14/payment_token
```

### Example Response

`HTTP/1.1 200 OK`

```json
{
  "payment_token": {
    "id": 123,
    "data": "3c98b5ed8eeMaeda6964928e1a51f96774..."
  }
}
```

### Errors

#### User is ineligible to pay with LevelUp

`HTTP/1.1 404 Not Found`

```json
[{
  "error": {
    "object": "user",
    "code": "payment_ineligible",
    "message": "You don’t have any valid credit cards linked to your account. Please add..."
  }
}]
```
