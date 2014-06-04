---
title: 'Orders .: Refund'
navigation: 1
category: 'Orders'
action: 'Refund'
---

Refund an Order
---

This endpoint refunds an order and returns the merchant-facing order data with with a non-null `refunded_at` key.

To refund an order, your app must have created the order and you must have a merchant access token with the `manage_merchant_orders` permission.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">POST</span> /v15/orders/:uuid/refund
</div>

** NOTE: This is a v15 endpoint.  Our stable API version is v14.  v15 is our beta branch for
exciting new features.**

### Authorization Required -- Merchant Token in Header

```
Authorization: token merchant="489882-2b5ecc5f80005f8f64bb354161275f6558f7cac45e4888ab"
```

### Request Body (Optional.  Only required if merchant has manager_confirmation code set, which is uncommon)

```json
{
  "refund": {
    "manager_confirmation": "87168"
  }
}
```

### Request Parameters

| Param                  | Type           | Required | Description                                                                           |
|------------------------|----------------|----------|---------------------------------------------------------------------------------------|
| `manager_confirmation` | String or null | No       | If the merchant uses one, the manager confirmation code used to authorize the refund. |

### cURL Example

```bash
curl -X POST -H Accept:application/json -H Content-Type:application/json -H 'Authorization:token merchant="123456-75489120749..."' -d '' https://api.thelevelup.com/v15/orders/123b75b0806011e29e960800200c9a66/refund
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

### Errors


`HTTP/1.1 404 Not Found` - The order does not exist

(Empty response body.)

`HTTP/1.1 422 Unprocessable Entity` - The order is unable to be refunded.

This error may occur perhaps because the order has already been refunded or because the original processing of the order failed to complete.

```json
[{
  "error": {
    "object": "order",
    "property": "base",
    "message": "The refund was unsuccessful. Perhaps this order has already been refunded or was unsuccessful."
  }
}]
```

`HTTP/1.1 422 Unprocessable Entity` - The manager confirmation is incorrect

```json
[{
  "error": {
    "object": "refund",
    "property": "manager_confirmation",
    "message": "Manager confirmation was incorrect."
  }
}]
```
