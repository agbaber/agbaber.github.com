---
title: 'User Orders .: List'
navigation: 1
category: 'Orders'
action: 'List'
---

List a user's orders
---

This endpoint allows you to get the order history for a user.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v15/users/orders
</div>

**NOTE: This is a v15 endpoint. Our stable API version is v14. v15 is our beta branch for exciting new features.**

To see a user's orders, you must have a user access token with the `read_user_orders` permission.  The response is paginated, and the “Link” header in the API response contains the URL for the next page of results. When a call returns a 204 No Content response, the client knows that they have reached the current end of results.

### Authentication Required -- User Token in Header

```
Authorization: token user="123456-75489120749..."
```

### cURL Example

```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json -H Authorization:token user="123456-75489120749..." https://api.thelevelup.com/v15/users/orders
```

### Example Response

```json

[{
    "order": {
        "bundle_closed_at": null,
        "bundle_descriptor": "LevelUp*123456",
        "contribution_target_name": null,
        "created_at": "2014-05-29T13:28:34-04:00",
        "location_id": 1234,
        "location_extended_address": "Ste 123",
        "location_locality": "Boston",
        "location_postal_code": "02110",
        "location_region": "MA",
        "location_street_address": "1234 Test St",
        "merchant_id": 1234,
        "merchant_name": "Jay's Sandwich Shop",
        "refunded_at": null,
        "transacted_at": "2014-05-29T13:28:34-04:00",
        "uuid": "123ab456c98401318af7769f0ea9c6a4",
        "balance_amount": 0,
        "contribution_amount": 0,
        "credit_applied_amount": 22,
        "credit_earned_amount": 0,
        "spend_amount": 10,
        "tip_amount": 12,
        "total_amount": 22,
        "items": [{
            "item": {
                "description": "12oz Can of Coca-Cola",
                "name": "Can Coke",
                "sku": "291soo01"
            }
        }, {
            "item": {
                "description": "Three buttermilk biscuits with sausage gravy",
                "name": "Biscuits and Gravy",
                "sku": "01abc192"
            }
        }]
    }
}, {
      "order": {...
          }
}]
```

### Response Parameters

| Param                       | Type                      | Description                                                                                                            |
|-----------------------------|---------------------------|------------------------------------------------------------------------------------------------------------------------|
| `bundle_closed_at`          | String (Date) or null     | The time the bundle containing this order closed (or null if it's still open).                                         |
| `bundle_descriptor`         | String                    | The the descriptor (or the best guess at) that this order will show up as on the user's payment statement.             |
| `contribution_target_name`  | String or null            | The name of the user's chosen contribution target.                                                                     |
| `created_at`                | String (Date)             | The date and time the order was created in the database. See transacted_at for the date and time the order was placed. |
| `location_id`               | Integer                   | The ID of the location at which the order was placed.                                                                  |
| `location_extended_address` | String or null            | The extended street address (suite or unit number, etc.) of the location at which the order was placed.                |
| `location_locality`         | String                    | The locality (i.e. city) of the location at which the order was placed.                                                |
| `location_postal_code`      | String                    | The postal code of the location at which the order was placed.                                                         |
| `location_region`           | String                    | The region (i.e. state) of the location at which the order was placed.                                                 |
| `location_street_address`   | String                    | The street address of the location at which the order was placed.                                                      |
| `merchant_id`               | Integer                   | The ID of the merchant at which the order was placed.                                                                  |
| `merchant_name`             | String                    | The name of the merchant at which the order was placed.                                                                |
| `refunded_at`               | String (Date) or null     | The date and time the order was refunded.                                                                              |
| `transacted_at`             | String                    | The date and time the user placed the order.                                                                           |
| `uuid`                      | String (UUID)             | The order's unique identifier.                                                                                         |
| `balance_amount`            | Integer (Money)           | The amount charged to the user's credit card.                                                                          |
| `contribution_amount`       | Integer (Money) or null   | The amount contributed to the user's chosen contribution target.                                                       |
| `credit_applied_amount`     | Integer (Money)           | The sum of all credit used to fund the order.                                                                          |
| `credit_earned_amount`      | Integer (Money)           | The sum of all credit earned from the order.                                                                           |
| `spend_amount`              | Integer (Money)           | The amount spent by the user, excluding tip and credit applied.                                                        |
| `tip_amount`                | Integer (Money)           | The amount tipped by the user.                                                                                         |
| `total_amount`              | Integer (Money)           | The amount spent by the user, including tip, but excluding credit applied.                                             |
| `items[]`                   | JSON Array                | The array of items in the order                                                                                        |
|  `item`                     | JSON Hash                 | The object representing an order item.                                                                                 |
|  `item[charged_price]`      | Integer                   | The price for the item(s) that was charged to the customer (in cents)                                                  |
|  `item[description]`        | String                    | The description of the item.                                                                                           |
|  `item[name]`               | String                    | The name of the item.                                                 |
|  `item[sku]`                | String                    | SKU (Stock Keeping Unit) code of this item .                          |

#### Response Headers

| Header | Description                                             |
|--------|---------------------------------------------------------|
| `Link` | The URL to use for requesting the next page of results. |

#### List more orders

To keep this example simple, assume that each page of results only includes 2 orders. Fields
other than `id` and `updated_at` are hidden. Response headers other than “Link” are also not shown.

For the very first page of results, the client simply requests `/users/orders`.

Request: `https://api.thelevelup.com/v15/users/orders`

Response Headers:

`Link: <https://api.thelevelup.com/v15/users/orders?page=2>; rel="next"`

Status Code: 200 OK

Body:

```json
[
  {"order": {"bundle_closed_at":null, ...}},
  {"order": {"bundle_closed_at":null, ...}}
]
```

The client remembers the value of the “Link” header, and uses it to retrieve the next page of results:

Request: `https://api.thelevelup.com/v15/users/orders?page=2`

Response Headers:

`Link: <https://api.thelevelup.com/v15/users/orders?page=3>; rel="next"

Status Code: 200 OK

Body:

```json
[
  {"order": {"bundle_closed_at":null, ...}},
  {"order": {"bundle_closed_at":null, ...}}
]
```

Finally the next (and currently last) page of results:

Request: `https://api.thelevelup.com/v15/users/orders?page=20`

Response Headers: (Does not include a Link header.)

Status Code: 204 No Content

Body:
(empty)

Since the client got a 204 response, it knows that it is done retrieving updates.
