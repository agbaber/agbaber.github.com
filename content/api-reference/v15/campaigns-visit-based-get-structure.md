
---
title: 'Visit Based Campaigns .: Get'
navigation: 1
category: 'Visit Based Campaigns'
action: 'Get'
---

Get a visit-based loyalty campaign's structure
---

This endpoint returns the structure of a visit-based loyalty campaign.  The detail level of the response can be adjusted by using either 'application/json' (full detail) or 'text/plain' as the 'Accept' header.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v15/campaigns/:id
</div>

** NOTE: This is a v15 endpoint.  Our stable API version is v14.  v15 is our beta branch for exciting new features.**

### Authentication Required -- User Token in Header

```
Authorization: token 123456-75489120749...
```

### cURL Example

```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json -H 'Authorization:token 1123456-75489120749...' https://api.thelevelup.com/v15/campaigns/1234
```

### Example Responses

`HTTP/1.1 200 OK`

##### Accept: 'application/json'

```json
{
  "campaign": {
    "applies_to_all_merchants": false,
    "campaign_type": "visit_based_loyalty",
    "confirmation_html": "confirmation",
    "email_share_url": "email_share",
    "facebook_share_url": "facebook_share",
    "id": 123456,
    "loyalty_program_description": "Here's how this loyalty program works...",
    "message_for_email_body": "body",
    "message_for_email_subject": "subject",
    "message_for_facebook": "message",
    "message_for_twitter": "message",
    "name": "Acme Loyalty Program",
    "offer_html": "offer",
    "sponsor": "Acme Inc.",
    "twitter_share_url": "twitter_share",
    "value_amount": 123.45,
    "steps": [
      {
        "visit_number": 3,
        "reward_amount": 2.5,
        "reward_description": "On your third visit you get yummy foo",
        "reward_title": "Free foo"
      },
      {
        "visit_number": 5,
        "reward_amount": 1.5,
        "reward_description": "On your fifth visit you get yummy bar",
        "reward_title": "Free bar"
      }
    ]
  }
}
```

##### Accept:  'text/plain'

A general description of the campaign and how it works:

```text
Here's how this loyalty program works...
```

### Errors

`HTTP/1.1 404 Not Found` - The campaign does not exist

