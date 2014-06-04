---
title: 'Interstitials .: Get'
navigation: 500
category: 'Interstitials'
action: 'Get'
---

Get an Order’s Interstitial
---

This endpoint retrieves information about interstitials for orders.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v14/orders/:uuid/interstitial
</div>

### Authentication Required -- User Token in Header

```
Authorization: token 123456-75489120749...
```

### cURL Example
```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json -H Authorization:"token 123456-75489120749..." https://api.thelevelup.com/v14/orders/123b0160bcef0131e9134aa51fe8ef2d/interstitial
```

### Example Response

#### Success

`HTTP/1.1 200 OK`

```json
{
  "interstitial": {
    "action" : {
      # See possible actions below
    },
    "callout_text" : "text",
    "description_html" : "Lorem ipsum minorus dinosaurus.",
    "image_url" : "url_to_image", (client attaches query params)
    "title" : "title",
    "type" : "type" (one of: "claim", "feedback", "share", "url", "no_action")
  }
}
```

NOTE: New types can be added at any time, so make sure to ignore any types that your
app does not recognize.

### Response Parameters

| Param              | Type   | Description                                                                   |
|--------------------|--------|-------------------------------------------------------------------------------|
| `action`           | Object | Type-specific action parameters for the interstitial. See below for details.  |
| `callout_text`     | String | Short text that asks the user to take the relevant action.                    |
| `description_html` | String | A description for the content of the interstitial that may contain HTML tags. |
| `image_url`        | String | The URL for the image associated with the interstitial.                       |
| `title`            | String | The title for the interstitial.                                               |
| `type`             | String | The type of the interstitial.                                                 |

#### Actions
Depending on the interstitial type, the action object might look like any one of these:

**claim**

```json
"action": {
  "code": "ABC123"
}
```

**feedback**

```json
"action": {
  "question_text": "How was your experience?"
}
```

**share**

```json
"action": {
  "message_for_email_subject": "...",
  "message_for_email_body": "...",
  "message_for_twitter": "...",
  "share_url_facebook": "...",
  "share_url_twitter": "...",
  "share_url_email": "...",
}
```

**url**

```json
"action": {
  "url": "http://example.com"
}
```

**no_action**

```json
"action": null
```

### Errors

#### If no interstitial is available for the order

`HTTP/1.1 404 Not Found`

```json
[{
  "error": {
    "code": "not_found",
    "message": "Interstitial not found.",
    "object": "interstitial",
    "property": "id",
  }
}]
```
