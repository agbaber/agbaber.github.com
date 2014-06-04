---
title: 'Orders .: Get User Details'
navigation: 850
category: 'Orders'
action: 'Get User Details'
---

Get User-Oriented Order Details
---

This endpoint returns user-oriented, as opposed to merchant-oriented, data about a specific order. Users may only retrieve details about their own orders.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v14/orders/:uuid
</div>


### Authentication Required -- User Token in Header

```
Authorization: token 123456-75489120749...
```

### Request Parameters

| Param   | Presence | Description                                   |
|---------|----------|-----------------------------------------------|
| `uuid`  | Required | The UUID of the order.                        |

### cURL Example

```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json -H Authorization:"token 123456-75489120749..." https://api.thelevelup.com/v14/orders/123b75b0806011e29e960800200c9a66
```

### Example Response

`HTTP/1.1 200 OK`

```json
{
  "order": {
    "balance_amount": 0,
    "bundle_closed_at": null,
    "bundle_descriptor": "LevelUp*LevelUpCafe868",
    "contribution_amount": 100,
    "contribution_target_name": "LevelUp Charity",
    "created_at": "2014-01-01T00:00:00-04:00",
    "credit_applied_amount": 200,
    "credit_earned_amount": 0,
    "location_extended_address": null,
    "location_id": 123,
    "location_locality": "Boston",
    "location_postal_code": "02114",
    "location_region": "MA",
    "location_street_address": "1 Congress St",
    "merchant_id": 1,
    "merchant_name": "LevelUp Cafe",
    "spend_amount": 5,
    "refunded_at": "2014-01-01T00:00:00-04:00",
    "tip_amount": 0,
    "total_amount": 700,
    "transacted_at": "2014-01-01T00:00:00-04:00",
    "uuid": "123b75b0806011e29e960800200c9a66"
  }
}
```

### Response Parameters

| Param                     | Type                      | Description                                                                                                            |
|---------------------------|---------------------------|------------------------------------------------------------------------------------------------------------------------|
| `balance_amount`            | Integer (Money)         | The amount charged to the user's credit card.                                                                          |
| `bundle_closed_at`          | String (Date) or null   | The time the bundle containing this order closed (or null if it's still open).                                         |
| `bundle_descriptor`         | String                  | The the descriptor (or the best guess at) that this order will show up as on the user's payment statement.             |
| `contribution_amount`       | Integer (Money) or null | The amount contributed to the user's chosen contribution target.                                                       |
| `contribution_target_name`  | String or null          | The name of the user's chosen contribution target.                                                                     |
| `created_at`                | String (Date)           | The date and time the order was created in the database. See transacted_at for the date and time the order was placed. |
| `credit_applied_amount`     | Integer (Money)         | The sum of all credit used to fund the order.                                                                          |
| `credit_earned_amount`      | Integer (Money)         | The sum of all credit earned from the order.                                                                           |
| `location_extended_address` | String or null          | The extended street address (suite or unit number, etc.) of the location at which the order was placed.                |
| `location_id`               | Integer                 | The ID of the location at which the order was placed.                                                                  |
| `location_locality`         | String                  | The locality (i.e. city) of the location at which the order was placed.                                                |
| `location_postal_code`      | String                  | The postal code of the location at which the order was placed.                                                         |
| `location_region`           | String                  | The region (i.e. state) of the location at which the order was placed.                                                 |
| `location_street_address`   | String                  | The street address of the location at which the order was placed.                                                      |
| `merchant_id`               | Integer                 | The ID of the merchant at which the order was placed.                                                                  |
| `merchant_name`             | String                  | The name of the merchant at which the order was placed.                                                                |
| `refunded_at`               | String (Date) or null   | The date and time the order was refunded.                                                                              |
| `spend_amount`              | Integer (Money)         | The amount spent by the user, excluding tip and credit applied.                                                        |
| `tip_amount`                | Integer (Money)         | The amount tipped by the user.                                                                                         |
| `total_amount`              | Integer (Money)         | The amount spent by the user, including tip, but excluding credit applied.                                             |
| `transacted_at`             | String                  | The date and time the user placed the order.                                                                           |
| `uuid`                      | String (UUID)           | The order's unique identifier.                                                                                         |

### Errors

#### The order was not found or does not belong to the logged in user

`HTTP/1.1 404 Not Found`
