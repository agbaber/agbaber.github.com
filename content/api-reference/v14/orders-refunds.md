---
title: 'Orders .: Refund'
navigation: 840
category: 'Orders'
action: 'Refund'
---

Refund an Order
---

This endpoint refunds an order and returns it with a non-null `refunded_at` key and other
merchant-facing data.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">POST</span> /v14/orders/:uuid/refund
</div>

### Authentication Required -- Merchant Token in Header

```
Authorization: token 123456-75489120749...
```

### Request Body (If `manager_confirmation` exists for merchant.  Note: this is uncommon.)

```json
{
  "refund": {
    "manager_confirmation": "87168"
  }
}
```

### Request Parameters

| Param                  | Type   | Required | Description                                                                           |
|------------------------|--------|----------|---------------------------------------------------------------------------------------|
| `manager_confirmation` | String | No       | If the merchant uses one, the manager confirmation code used to authorize the refund. |

### cURL Example

```bash
curl -X POST -H Accept:application/json -H Content-Type:application/json -H Authorization:"token 123456-75489120749..." -d '{"refund": {"manager_confirmation": "87168"}}' https://api.thelevelup.com/v14/orders/1esfba10ac51013149f162d2f425c456/refund
```

### Example Response

`HTTP/1.1 200 OK`

```json
{
  "order": {
    "created_at": "2014-01-01T00:00:00-04:00",
    "merchant_funded_credit_amount": 5,
    "earn_amount": 0,
    "uuid": "393b75b0806011e29e960800200c9a66",
    "loyalty_id": 123,
    "spend_amount": 5,
    "refunded_at": "2014-01-01T00:00:00-04:00",
    "tip_amount": 0,
    "total_amount": 5,
    "location_id": 123,
    "user_display_name": "Ryan T"
  }
}
```

### Response Parameters

| Parameters                       | Type       | Description                                                  |
|----------------------------------|------------|--------------------------------------------------------------|
|  `created_at`                    | String     | Time when the order was created in ISO standard format 8601  |
|  `merchant_funded_credit_amount` | Integer    | Merchant-funded credit used on order                         |
|  `earn_amount`                   | Integer    | Credit unlocked on order                                     |
|  `uuid`                          | String     | UUID for the order                                           |
|  `loyalty_id`                    | Integer    | ID for LevelUp user at that merchant                         |
|  `spend_amount`                  | Integer    | Amount requested for payment (in cents).                     |
|  `refunded_at`                   | String     | Time when the order was refunded in ISO standard format 8601 |
|  `tip_amount`                    | Integer    | Tip amount (in cents)                                        |
|  `total_amount`                  | Integer    | Total amount including tip (in cents)                        |
|  `location_id`                   | Integer    | Location id where the order was created                      |
|  `user_display_name`             | String     | First name and last initial of customer                      |

### Errors 

#### If the order does not exist

`HTTP/1.1 404 Not Found`

(Empty response body.)

#### If the order is unable to be refunded, perhaps because the order has already been refunded or because the original processing of the order failed to complete

`HTTP/1.1 422 Unprocessable Entity`

```json
[{
  "error": {
    "object": "order",
    "property": "base",
    "message": "The refund was unsuccessful. Perhaps this order has already been refunded or was unsuccessful."
  }
}]
```

#### If the manager confirmation is incorrect

`HTTP/1.1 422 Unprocessable Entity`

```json
[{
  "error": {
    "object": "refund",
    "property": "manager_confirmation",
    "message": "Manager confirmation was incorrect."
  }
}]
```
