---
title: 'Campaigns .: Get Merchant ID'
navigation: 260
category: 'Campaigns'
action: 'Get Merchant ID'
---


Get merchant IDs for a campaign
---

The endpoint returns a paginated array of merchant IDs associated with the given campaign.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v14/campaigns/:id/merchants
</div>

### No Authentication Required

### Request Parameters

| Param       | Type    | Required | Description             |
|-------------|---------|----------|-------------------------|
| `id`        | Integer | Yes      | The ID of the campaign. |

### cURL Example
```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json https://api.thelevelup.com/v14/campaigns/3/merchants
```

### Example Response

```json
[1, 2742]
```

### Errors

`HTTP/1.1 204 No content`
