---
title: 'Credit Cards .: Delete'
navigation: 330
category: 'Credit Cards'
action: 'Delete'
---

Delete a Credit Card
---

This endpoint deletes a user’s credit card.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">DELETE</span> /v14/credit_cards/:id
</div>

### Authentication Required -- User Token in Header

```
Authorization: token 123456-75489120749...
```

### cURL Example

```bash
curl -X DELETE -H Accept:application/json -H Content-Type:application/json -H Authorization:"token 123456-75489120749..." https://api.thelevelup.com/v14/credit_cards/123141
```

#### Example Response

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
    "promoted": true,
    "state": "inactive",
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

#### A credit card with the given ID was not found for the logged in user

`HTTP/1.1 404 Not Found`

```json
[{
  "error": {
    "object": "credit_card",
    "property": "id",
    "code": "not_found",
    "message": "Credit card not found."
  }
}]
```