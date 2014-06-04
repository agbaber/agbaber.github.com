
---
title: 'Visit Based Campaigns State .: Get'
navigation: 1
category: 'Visit Based Campaigns State'
action: 'Get'
---

Get a visit-based loyalty campaign's state
---

This endpoint returns the state of the current user within the visit-based loyalty structure.  The detail level of the response can be adjusted by using either 'application/json' (full detail) or 'text/plain' as the 'Accept' header.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v15/campaigns/:id/user_state
</div>

** NOTE: This is a v15 endpoint.  Our stable API version is v14.  v15 is our beta branch for exciting new features.**

### Authentication Required -- User Token in Header

```
Authorization: token 123456-75489120749...
```

### cURL Example

```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json -H 'Authorization:token 1123456-75489120749...' https://api.thelevelup.com/v15/campaigns/1234/user_state
```

### Example Responses

`HTTP/1.1 200 OK`

##### Accept: 'application/json'

```json
{
  "user_state": {
    "current_cycle_percent_complete": 0.2,
    "current_cycle_visit_number": 1,
    "num_qualified_visits": 6,
    "num_visits_from_next_reward": 2,
    "visit_number_of_next_reward": 3
  }
}
```

##### Accept: 'text/plain'

A general description of where the user is within the current visit cycle:

```text
Just 2 more qualified visits and you'll get free food!
```

### Errors

`HTTP/1.1 404 Not Found` - The campaign does not exist

