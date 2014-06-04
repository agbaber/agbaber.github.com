---
title: 'Orders .: List By Location'
navigation: 810
category: 'Orders'
action: 'List By Location'
---

List Orders Placed At A Merchant Location
---

This endpoint returns a list of orders placed at the given location. The response includes merchant-oriented data. Merchants may only retrieve orders placed at their own locations.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v14/locations/:id/orders
</div>

### Authentication Required -- Merchant Token in Header

```
Authorization: token 123456-75489120749...
```

### Request Parameters

| Param   | Presence | Description                                   |
|---------|----------|-----------------------------------------------|
| `id`    | Required | The ID of the location.                       |

### cURL Example
```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json -H Authorization:"token 123456-75489120749..." https://api.thelevelup.com/v14/locations/3796/orders
```

### Example Response

`HTTP/1.1 200 OK`

```json
[{
  "order": {
    "uuid": "123b75b0806011e29e960800200c9a66",
    "created_at": "2014-01-01T00:00:00-04:00",
    "merchant_funded_credit_amount": 5,
    "earn_amount": 0,
    "loyalty_id": 123,
    "refunded_at": null,
    "refund_source": null,
    "spend_amount": 5,
    "tip_amount": 0,
    "total_amount": 5,
    "user_display_name": "Ryan T"
  }
}, ...]
```
### Errors

#### The logged in user does not have merchant credentials for the given location

`HTTP/1.1 401 Unauthorized`
