---
title: 'Campaigns .: Claim'
navigation: 210
category: 'Campaigns'
action: 'Claim'
---

Claim a Campaign
---

This endpoint claims a campaign via a cohort code.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">POST</span> /v14/codes/:code/claims
</div>

### Authentication Required -- User Token in Header

```
Authorization: token 123456-75489120749...
```

### cURL Example
```bash
curl -X POST https://api.thelevelup.com/v14/codes/1234/claims
```

### Responses

#### Success

`HTTP/1.1 200 OK`

```json
{
  "claim": {
    "id": 123,
    "code": "code_you_claimed",
    "value_amount": 1000,
    "value_remaining_amount": 1000
  }
}
```

#### The campaign does not exist

`HTTP/1.1 404 Not Found`

```json
[{
  "error": {
    "object": "claim",
    "property": "base",
    "message": "This doesn't appear to be a LevelUp Code."
  }
}]
```

#### If the campaign is not claimable for any reason

`HTTP/1.1 422 Unprocessable Entity`

```json
[{
  "error": {
    "object": "claim",
    "property": "base",
    "message": "Sorry, you cannot claim this promotion at this time."
  }
}]
```