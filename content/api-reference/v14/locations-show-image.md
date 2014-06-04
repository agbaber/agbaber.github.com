---
title: 'Locations .: Get Image'
navigation: 640
category: 'Locations'
action: 'Get Image'
---

Get a Location’s Image
---

This endpoint redirects to the URI of the image described by the query parameters.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v14/locations/:id/image
</div>

### No Authentication Required

### Request Parameters

| Param     | Type    | Description                                                                                                                                     |
|-----------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| `density` | Decimal | The effective pixel density of the desired image, corresponding to the widespread "@1x", "@1.5x", "@2x" convention. Accepted values: 1, 1.5, 2. |
| `height`  | Integer | The height of the desired image in pixels.                                                                                                      |
| `width`   | Integer | The width of the desired image in pixels.                                                                                                       |

The available image dimensions are: 280x128, 290x335, 320x212, 400x235, and 460x180.

### cURL Example

```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json https://api.thelevelup.com/v14/locations/3796/image?density=1&height=212&width=320
```

### Example Response

`HTTP/1.1 302 Found`

Headers:

Location: https://s3.amazonaws.com/levelup/c9e16d4c66c49fa15a8b26d5eef5fb855377d178.jpg

(No response body.)


### Errors

#### No location matches the given ID, or no image matches the given dimensions and density

`HTTP/1.1 404 Not Found`

(No response body.)

