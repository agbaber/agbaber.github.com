---
title: 'Credit Cards .: List'
navigation: 310
category: 'Credit Cards'
action: 'List'
---

List a User’s Credit Cards
---

This endpoint returns a list of the current user’s active credit cards. Inactive cards include
deleted cards and duplicate cards. These records will not appear in the list.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v14/credit_cards
</div>

### Authentication Required -- User Token in Header

```
Authorization: token 123456-75489120749...
```

### cURL Example

```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json -H Authorization:"token 123456-75489120749..." https://api.thelevelup.com/v14/credit_cards
```

### Example Response

`HTTP/1.1 200 OK`

```json
[{
  "credit_card": {
    "bin": "123456",
    "id": 305999,
    "promoted": true,
    "description": "JCB ending in 6789",
    "expiration_month": 9,
    "expiration_year": 2015,
    "first_4": "1234",
    "last_4": "6789",
    "type": "JCB",
    "state": "active"
  }
}, ...]
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
