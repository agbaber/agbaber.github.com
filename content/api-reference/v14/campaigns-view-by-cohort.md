---
title: 'Campaigns .: Get by Cohort'
navigation: 220
category: 'Campaigns'
action: 'Get by Cohort'
---

Get Campaign Details by Cohort Code
---

This endpoint retrieves details about a campaign from a cohort code.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v14/codes/:code/campaign
</div>

### No Authentication Required

### cURL Example
```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json https://api.thelevelup.com/v14/codes/R14K6U/campaign
```

### Example Response

`HTTP/1.1 200 OK`

```json
{
    "campaign": {
        "applies_to_all_merchants": true,
        "confirmation_html": "You just unlocked $2 by scanning a LevelUp Code on a LevelUp business card!",
        "id": 2,
        "message_for_email_body": "I just grabbed $2.00 to spend on LevelUp. Grab yours too by clicking here https://www.thelevelup.com/c/EM-UPZVX0",
        "message_for_email_subject": "Grab $2.00 on LevelUp",
        "message_for_facebook": "I claimed $2.00 to spend on LevelUp. Jealous? Click here, claim yours.",
        "message_for_twitter": "I just grabbed $2.00 to spend on LevelUp. Grab yours too by clicking here",
        "name": "LevelUp Business Card",
        "offer_html": "Grab $2 by scanning a LevelUp Code on a LevelUp business card!",
        "type": "custom",
        "share_url_email": "https://www.thelevelup.com/c/EM-UPZVX0",
        "share_url_facebook": "https://www.thelevelup.com/c/FB-UOABTI",
        "share_url_twitter": "https://www.thelevelup.com/c/TW-4937B0",
        "sponsor": "LevelUp",
        "shareable": true,
        "value_amount": 200
    }
}
```

### Response Parameters

| Parameters                   | Type    | Description                                                  |
|------------------------------|---------|--------------------------------------------------------------|
|  `applies_to_all_merchants`  | Boolean | Determines if the campaign credit can apply to all merchants |
|  `confirmation_html`         | String  | The text displayed after campaign is claimed                 |
|  `id`                        | Integer | The LevelUp Campaign ID                                      |
|  `message_for_email_body`    | String  | The share-by-email body text                                 |
|  `message_for_email_subject` | String  | The share-by-email subject text                              |
|  `message_for_facebook`      | String  | The share-by-facebook body text                              |
|  `message_for_twitter`       | String  | The share-by-twitter body text                               |
|  `name`                      | String  | The LevelUp Campaign name                                    |
|  `offer_html`                | String  | The text displayed before claiming campaign                  |
|  `type`                      | String  | The LevelUp Campaign type                                    |
|  `share_url_email`           | String  | The share-by-email URL                                       |
|  `share_url_facebook`        | String  | The share-by-facebook URL                                    |
|  `share_url_twitter`         | String  | The share-by-twitter URL                                     |
|  `sponsor`                   | String  | The LevelUp Campaign sponsor                                 |
|  `shareable`                 | Boolean | Determines if a campaign can be shared                       |
|  `value_amount`              | Integer | The LevelUp Campaign claim value                             |


#### The campaign does not exist

`HTTP/1.1 404 Not Found`

(No response body.)