---
title: 'Orders .: Get Merchant Details'
navigation: 830
category: 'Orders'
action: 'Get Merchant Details'
---

Get Merchant-Oriented Order Details
---

This endpoint returns keys pertinent to merchants, as opposed to users. In order to access an order through this endpoint, the user must be associated with the merchant.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v14/merchants/:id/orders/:uuid
</div>

### Authentication Required -- Merchant Token in Header

```
Authorization: token 123456-75489120749...
```

### Request Parameters

| Param   | Presence | Description                                   |
|---------|----------|-----------------------------------------------|
| `uuid`  | Required | The UUID of the order.                        |
| `id`    | Required | The merchant's ID                             |


### cURL Example
```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json -H "Authorization:token 123456-75489120749..." https://api.thelevelup.com/v14/merchants/3225/orders/123b75b0806011e29e960800200c9a66
```


### Example Response

`HTTP/1.1 200 OK`

```json
{
  "order": {
    "created_at": "2014-01-01T00:00:00-04:00",
    "merchant_funded_credit_amount": 5,
    "earn_amount": 0,
    "loyalty_id": 123,
    "spend_amount": 5,
    "refunded_at": "2014-01-01T00:00:00-04:00",
    "tip_amount": 0,
    "total_amount": 5,
    "location_id": 123,
    "transacted_at": "2014-01-01T00:00:00-04:00",
    "user_display_name": "Ryan T",
    "uuid": "123b75b0806011e29e960800200c9a66"
  }
}
```

### Errors

#### A merchant with the given ID was not found

`HTTP/1.1 404 Not Found`

```json
[{
  "error": {
    "object": "merchant",
    "property": "id",
    "message": "Merchant not found."
  }
}]
```

#### An order with the given UUID was not found

`HTTP/1.1 404 Not Found`

```json
[{
  "error": {
    "object": "order",
    "property": "id",
    "message": "Order not found."
  }
}]
```

#### The current user does not have proper merchant credentials

`HTTP/1.1 401 Unauthorized`

