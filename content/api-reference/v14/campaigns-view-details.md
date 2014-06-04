---
title: 'Campaigns .: Get Details'
navigation: 200
category: 'Campaigns'
action: 'Get Details'
---

Get Campaign Details
---

This endpoint retrieves details about a campaign.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v14/campaigns/:id
</div>

### No Authentication Required

### Request Parameters

| Parameters  | Type    | Description             |
|-------------|---------|-------------------------|
|  `id`       | Integer | The LevelUp Campaign ID |

### cURL Example

```bash
curl https://api.thelevelup.com/v14/campaigns/2
```

### Example Response Body
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

| Parameters                   | Type       | Description                                              |
|------------------------------|------------|----------------------------------------------------------|
|  `applies_to_all_merchants`  | Boolean    | Defines if the campaign is global or fixed to a merchant |
|  `confirmation_html`         | String     | Text that is displayed when campaign is claimed.         |
|  `id`                        | Integer    | LevelUp ID of the campaign.                              |
|  `message_for_email_body`    | String     | Email body text.                                         |
|  `message_for_email_subject` | String     | Email subject text.                                      |
|  `message_for_facebook`      | String     | Facebook text.                                           |
|  `message_for_twitter`       | String     | Twitter text.                                            |
|  `name`                      | String     | Campaign name.                                           |
|  `offer_html`                | String     | Campaign offer information.                              |
|  `type`                      | String     | Campaign type.                                           |
|  `share_url_email`           | String     | URL to share campaign by email.                          |
|  `share_url_facebook`        | String     | URL to share campaign on Facebook.                       |
|  `share_url_twitter`         | String     | URL to share campaign on Twitter.                        |
|  `sponsor`                   | String     | Campaign sponsor.                                        |
|  `shareable`                 | Boolean    | Defines if the campaign is shareable or not.             |
|  `value_amount`              | Integer    | Value of the campaign claim.                             |


### Errors

`HTTP/1.1 404 Not Found` - The campaign does not exist

(No response body.)