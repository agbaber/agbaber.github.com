---
title: 'Merchant-Funded Credit .: Give'
navigation: 1
category: 'Merchant-Funded Credit'
action: 'Give'
---

Give Merchant-Funded Credit to a User
---

This endpoint allows you to give a user credit on behalf of a merchant.  To give out credit on behalf of a merchant, you must have a merchant access token with the `give_merchant_funded_credit` permission. This access token can be retrieved via the standard [permissions request](/api-reference/v15/permissions-create/) flow.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">POST</span> /v15/merchant_funded_credits
</div>

**NOTE: This is a v15 endpoint. Our stable API version is v14. v15 is our beta branch for exciting new features.**

Authentication Required -- Merchant Token in Header

```
Authorization: token merchant="489882-2b5ecc5f80005f8f64bb354161275f6558f7cac45e4888ab"
```

### Request Body

```json
{
  "merchant_funded_credit": {
    "email": "user@example.com",
    "value_amount": 100
  }
}
```

### Request Parameters

| Parameters       | Type       | Required | Description                                             |
|------------------|------------|----------|---------------------------------------------------------|
|  `email`         | String     | Yes      | The email of the recipient of the credit.               |
|  `value_amount`  | Integer    | Yes      | Total amount of the credit (in cents).                  |


### cURL Example
```bash
curl -X POST -H Accept:application/json -H Content-Type:application/json -H Authorization:token merchant="123456-75489120749..." -d '{"merchant_funded_credit": {"email": "user@example.com","value_amount": 100}}' https://api.thelevelup.com/v15/merchant_funded_credits
```

### Example Response

`HTTP/1.1 204 No Content`