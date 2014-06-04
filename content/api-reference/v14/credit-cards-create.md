---
title: 'Credit Cards .: Create'
navigation: 300
category: 'Credit Cards'
action: 'Create'
---

Create a Credit Card
---

This endpoint associates a new, automatically-promoted credit card with the current user’s account.
The parameters with “encrypted” in their name must be encrypted using a Braintree public key.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">POST</span> /v14/credit_cards
</div>

### Authentication Required -- User Token in Header

```
Authorization: token 123456-75489120749...
```

### Request Body

```json
{
  "credit_card": {
    "encrypted_cvv": "encrypted_cvv_data_here",
    "encrypted_expiration_month": "encrypted_month_data_here",
    "encrypted_expiration_year": "encrypted_year_data_here",
    "encrypted_number": "encrypted_number_data_here",
    "postal_code": "12345"
  }
}
```

### Request Parameters

| Param                                     | Type           | Required | Description                                                                 |
|-------------------------------------------|----------------|----------|-----------------------------------------------------------------------------|
| `encrypted_cvv`                           | String         | Yes      | The card verification value, encrypted with a Braintree public key.         |
| `encryped_expiration_`<br>`month`               | String         | Yes      | The month in which the card expires, encrypted with a Braintree public key. |
| `encrypted_expiration_`<br>`year`               | String         | Yes      | The year in which the card expires, encrypted with a Braintree public key.  |
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
}' https://api.thelevelup.com/v14/credit_cards

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
