---
title: 'Support Tickets .: Create'
navigation: 1000
category: 'Support Tickets'
action: 'Create'
---

Create a Support Ticket
---

This endpoint allows you to create support tickets.

### Request

<div class="http-request">
  <span class="http-verb">POST</span> /v14/tickets
</div>

### Request Body

```json
{
  "ticket": {
    "body": "Lorem ipsum"
  }
}
```

### Request Parameters

| Parameters     | Type       | Required | Description                |
|----------------|------------|----------|----------------------------|
|  `body`        | String     | Yes      | Support ticket body text   |

### cURL Example
```bash
curl -X POST -H Accept:application/json -H Content-Type:application/json -H Authorization:"token 123456-75489120749..." -d '{"ticket": {"body": "Lorem ipsum",}}' https://api.thelevelup.com/v14/tickets
```

### Example Response

`HTTP/1.1 200 OK`

```json
{
  "ticket": {
    "body": "Lorem ipsum"
  }
}
```

### Errors

#### If body is missing

`HTTP/1.1 422 Unprocessable Entity`

```json
[{
  "error": {
    "object": "ticket",
    "property": "body",
    "message": "Body can't be blank."
  }
}]
```
