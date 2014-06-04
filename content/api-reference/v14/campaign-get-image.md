---
title: 'Campaigns .: Get Image'
navigation: 270
category: 'Campaigns'
action: 'Get Image'
---
Get a campaign's image
---

This endpoint redirects to the URI of the campaign image described by the query parameters.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v14/campaigns/:id/image
</div>

### No Authentication Required

### Request Parameters

| Param     | Type    | Required | Description                                                                                                                                     |
|-----------|---------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| `density` | Decimal | Yes      | The effective pixel density of the desired image, corresponding to the widespread "@1x", "@1.5x", "@2x" convention. Accepted values: 1, 1.5, 2. |
| `height`  | Integer | Yes      | The height of the desired image in pixels.                                                                                                      |
| `width`   | Integer | Yes      | The width of the desired image in pixels.                                                                                                       |

Currently, the only available image dimension is 320x212.

### cURL Example
```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json https://api.thelevelup.com/v14/campaigns/2/image?density=1&height=212&width=320
```

### Example Response

`HTTP/1.1 302 Found`
Headers:
Location: https://s3.amazonaws.com/levelup/c9e16d4c66c49fa15a8b26d5eef5fb855377d178.jpg


### Errors

#### No campaign matches the given ID, or no image matches the given dimensions and density

`HTTP/1.1 404 Not Found`

(No response body.)
