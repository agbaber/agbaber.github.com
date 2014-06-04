---
title: 'Loyalty .: Get'
navigation: 700
category: 'Loyalty'
action: 'Get'
---

Get Loyalty Details
---

This endpoint returns details about a loyalty—the relationship between a user and a merchant. If a
user has no existing loyalty with the merchant, an “empty” loyalty is returned.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v14/merchants/:id/loyalty
</div>

### Authentication Required -- User Token in Header

```
Authorization: token 123456-75489120749...
```

### cURL Example

```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json -H Authorization:"token 123456-75489120749..." https://api.thelevelup.com/v14/merchants/3225/loyalty
```

### Example Response

`HTTP/1.1 200 OK`

```json
{
  "loyalty": {
    "merchant_earn_amount": 500,
    "merchant_id": 456,
    "merchant_loyalty_enabled": true,
    "merchant_spend_amount": 5000,
    "orders_count": 77,
    "potential_credit_amount": 7350,
    "progress_percentage": 42.0,
    "savings_amount": 835,
    "spend_remaining_amount": 427,
    "total_volume_amount": 6317,
    "user_id": 789
  }
}
```

### Response Parameters

| Key                        | Type                 | Description                                                                                                                                                                                                                    |
|----------------------------|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `merchant_earn_amount`     | Integer (Money)      | The merchant's loyalty reward.                                                                                                                                                                                                 |
| `merchant_id`              | Integer              | The ID of the merchant.                                                                                                                                                                                                        |
| `merchant_loyalty_enabled` | Boolean              | Whether the merchant is running a loyalty program.                                                                                                                                                                             |
| `merchant_spend_amount`    | Integer (Money)      | The merchant's loyalty reward goal.                                                                                                                                                                                            |
| `orders_count`             | Integer              | The total number of orders ever placed by the user at the merchant.                                                                                                                                                            |
| `potential_credit_amount`  | Integer (Money)      | The amount of outstanding credit the user could have at this merchant. This value includes credit already gained by claiming campaigns, and potential credit from campaigns the user is eligible for, but has not yet claimed. |
| `progress_percentage`      | Decimal (Percentage) | The user's progress toward the merchant's loyalty reward goal.                                                                                                                                                                 |
| `savings_amount`           | Integer (Money)      | The total amount of credit ever applied at this merchant on the user's behalf.                                                                                                                                                 |
| `spend_remaining_amount`   | Integer (Money)      | The amount of money the user needs to spend in order to reach the merchant's loyalty reward goal.                                                                                                                              |
| `total_volume_amount`      | Integer (Money)      | The total amount of money the user has ever spent at this merchant. This value includes tips.                                                                                                                                  |
| `user_id`                  | Integer              | The ID of the user.                                                                                                                                                                                                            |
