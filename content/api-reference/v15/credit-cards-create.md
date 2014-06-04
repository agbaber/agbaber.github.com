---
title: 'Credit Cards .: Create'
navigation: 1
category: 'Credit Cards'
action: 'Create'
---

Create a Credit Card
---

This endpoint adds a new credit card for a user.

To add a credit card, you must have a token with the `create_first_credit_card` permission. This
permission only authorizes adding a single credit card for a user. After one credit card has been
added, further requests will result in an authorization error.

The parameters with “encrypted” in their name must be encrypted using a Braintree public key.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">POST</span>/v15/credit_cards
</div>

**NOTE: This is a v15 endpoint. Our stable API version is v14. v15 is our beta branch for exciting
new features.**

### Authentication Required -- User Token in Header

```
Authorization: token user="489882-2b5ecc5f80005f8f64bb354161275f6558f7cac45e4888ab"
```

### Request Body

```json
{
  "credit_card": {
    "encrypted_cvv": "$bt4|javascript_1_3_9$Zar7J1+0QNsrHtKFufeJ8UCpSd5RM1PwTjzNE1Dm1N0A969OuWfU03...",
    "encrypted_expiration_month": "$bt4|javascript_1_3_9$7ad9aydahduiw+89w7dHusaihdas...",
    "encrypted_expiration_year": "$bt4|javascript_1_3_9$9asdjaIjashuUHsj+saiUSj...",
    "encrypted_number": "$bt4|javascript_1_3_9$FyreT+o2W/9VHHjS43ZJJe2SmdvTBcve58...",
    "postal_code": "12345"
  }
}
```

### Request Parameters

| Param                                     | Type           | Required | Description                                                                 |
|-------------------------------------------|----------------|----------|-----------------------------------------------------------------------------|
| `encrypted_cvv`                           | String         | Yes      | The card verification value, encrypted with a Braintree public key.         |
| `encryped_expiration_`<br>`month`         | String         | Yes      | The month in which the card expires, encrypted with a Braintree public key. |
| `encrypted_expiration_`<br>`year`         | String         | Yes      | The year in which the card expires, encrypted with a Braintree public key.  |
| `encrypted_number`                        | String         | Yes      | The card number, encrypted with a Braintree public key.                     |
| `postal_code`                             | String         | Yes      | The postal code portion of the card’s billing address.                      |
### cURL Example

```bash
curl -X POST -H Accept:application/json -H Content-Type:application/json -H Authorization:"token 123456-75489120749..." -d '{
  "credit_card": {
    "encrypted_cvv": "$bt4|javascript_1_3_9$Zar7J1+0QNsrHtKFufeJ8UCpSd5RM1PwTjzNE1Dm1N0A969OuWfU03...",
    "encrypted_expiration_month": "$bt4|javascript_1_3_9$7ad9aydahduiw+89w7dHusaihdas...",
    "encrypted_expiration_year": "$bt4|javascript_1_3_9$9asdjaIjashuUHsj+saiUSj...",
    "encrypted_number": "$bt4|javascript_1_3_9$FyreT+o2W/9VHHjS43ZJJe2SmdvTBcve58...",
    "postal_code": "12345"
  }
}' https://api.thelevelup.com/v15/credit_cards

```

### Example Response

`HTTP/1.1 200 OK`

```json
{
  "credit_card": {
    "bin": "123456",
    "description": "JCB ending in 1234",
    "expiration_month": 7,
    "expiration_year": 2015,
    "id": 305999,
    "last_4": "1234",
    "promoted": false,
    "state": "active",
    "type": "JCB"
  }
}
```

### Response Parameters

| Key                | Type    | Description                                                                                                                  |
|--------------------|---------|------------------------------------------------------------------------------------------------------------------------------|
| `bin`              | String  | The first six digits of the card number.                                                                                     |
| `description`      | String  | A human-readable description of the credit card.                                                                             |
| `expiration_month` | Integer | The month in which the card expires.                                                                                         |
| `expiration_year`  | Integer | The year in which the card expires.                                                                                          |
| `id`               | Integer | The credit card’s ID.                                                                                                        |
| `last_4`           | String  | The last four characters of the card number.                                                                                 |
| `promoted`         | Boolean | Whether the card is the user’s promoted payment instrument.                                                                  |
| `state`            | String  | The card’s state. Possible values: "active" — the card is available to be charged, "inactive" — the card may not be charged. |
| `type`             | String  | The type of card, e.g. Visa, Mastercard                                                                                      |

### Errors

#### The credit card details were invalid

`HTTP/1.1 422 Unprocessable Entity`

```json
[{
  "error": {
    "object": "credit_card",
    "property": "expiration_year",
    "message": "Expiration year is invalid."
  }
}]
```

#### The credit card is already used by another LevelUp user

`HTTP/1.1 422 Unprocessable Entity`

```json
[{
  "error": {
    "object": "credit_card",
    "property": "number",
    "message": "This card has already been associated with another LevelUp account..."
  }
}]
```
