---
title: 'Campaigns .: Claim Legacy'
navigation: 240
category: 'Campaigns'
action: 'Claim Legacy'
---

Claim a legacy loyalty campaign
---

This endpoint claims a legacy loyalty campaign via ID.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">POST</span> /v14/loyalties/legacy/:campaign_id/claims
</div>

### Authentication Required - User Token in Header

```json
Authorization: token 123456-75489120749...
```

### Request Body

```json
{
  "legacy_loyalty": {
    "legacy_id": 12323,
  }
}
```

### Request Parameters
| Param       | Type    | Required | Description                         |
|-------------|---------|----------|-------------------------------------|
| `legacy_id` | Integer | Yes      | The ID of the legacy loyalty claim. |

### cURL Example

```bash
curl -X POST -H Accept:application/json -H Content-Type:application/json -H Authorization:"token 123456-75489120749..." -d '{ "legacy_loyalty": { "legacy_id": 12323, } }' https://api.thelevelup.com/v14/loyalties/legacy/1234567/claims
```

### Example Responses

`HTTP/1.1 200 OK`

```json
{
  "claim" : {
    "id" : 12323,
    "code": "legacy_loyalty_cohort"
    "value_amount" : 1000,
    "value_remaining_amount" : 1000,
  }
}
```

### Response Parameters
| Param                    | Type    | Required | Description                          |
|--------------------------|---------|----------|--------------------------------------|
| `id`                     | Integer | Yes      | The ID of the legacy loyalty claim.  |
| `code`                   | String  | Yes      | The legacy loyalty cohort code.      |
| `value_amount`           | Integer | Yes      | The value of the claim.              |
| `value_remaining_amount` | Integer | Yes      | The remaining value of the campaign. |


### Errors

`HTTP/1.1 404 Not found`
