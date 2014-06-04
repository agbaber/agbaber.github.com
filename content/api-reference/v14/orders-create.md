---
title: 'Orders .: Create'
navigation: 820
category: 'Orders'
action: 'Create'
---

Create an Order
---

This endpoint creates a new order.

NOTE: Tip information is included as part of the customer's QR code so the full payment amount will
not be known until the response from LevelUp is received.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">POST</span> /v14/orders
</div>

### Authentication Required -- Merchant Token in Header

```
Authorization: token 123456-75489120749...
```

### Request Body
```json
{
  "order": {
    "identifier_from_merchant": "001001",
    "location_id": 1234,
    "payment_token_data": "LU02111222333444555666777888999LU",
    "spend_amount": 997,
    "cashier": "Andrew Jones",
    "register": "03",
    "items": [
              {
                "item": {
                          "charged_price": 599,
                          "description": "Three buttermilk biscuits with sausage gravy",
                          "name": "Biscuits and Gravy",
                          "quantity": 1,
                          "sku": "01abc192",
                          "category": "Breakfast Mains",
                          "standard_price": 599
                        }
              },
              {
                "item": {
                          "charged_price": 398,
                          "description": "12oz Can of Coca-Cola",
                          "name": "Can Coke",
                          "quantity": 2,
                          "sku": "291soo01",
                          "category": "Drinks",
                          "standard_price": 199,
                          "upc": "04963406"
                        }
              }
             ]
          }
}
```

### Request Parameters

| Parameters                        | Type       | Required | Description                                                           |
|-----------------------------------|------------|----------|-----------------------------------------------------------------------|
|  `token`                          | String     | Yes      | Authentication token (`access_token`) for the merchant.                 |
|  `identifier_from_`<br>`merchant` | String     | No       | The POS-specific order ID or number for the check.  Max 10 characters.|
|  `location_id`                    | Integer    | Yes      | LevelUp Location ID that is placing the order.                        |
|  `payment_token_data`             | String     | Yes      | Customer QR code data (input from the LevelUp Scanner).               |
|  `spend_amount`                   | Integer    | Yes      | Total amount to be charged (in cents).                                |
|  `cashier`                        | String     | No       | Cashier name or identifier.                                           |
|  `register`                       | String     | No       | Register name or identifier.                                          |
|  `items[]`                        | JSON Array | No       | An array of items in the order.                                       |
|  `item`                           | JSON Hash  | Yes      | Object representing an order item.                                    |
|  `item[charged_price]`            | Integer    | Yes      | The price for the item(s) that was charged to the customer (in cents) |
|  `item[description]`              | String     | Yes      | The description of the item.                                          |
|  `item[name]`                     | String     | Yes      | The name of the item.                                                 |
|  `item[quantity]`                 | Integer    | Yes      | The number of this item sold.                                         |
|  `item[sku]`                      | String     | No       | SKU (Stock Keeping Unit) code of this item .                          |
|  `item[category]`                 | String     | No       | Category of the item.                                                 |
|  `item[standard_price]`           | Integer    | No       | Standard price for the item.                                          |
|  `item[upc]`                      | String     | No       | UPC (Universal Product Code) of the item.                             |

### cURL Example

```bash
curl -X POST -H Accept:application/json -H Content-Type:application/json -H Authorization:"token 123456-75489120749..."  -d '{ "order": { "identifier_from_merchant": "001001", "location_id": 1234, "payment_token_data": "LU02111222333444555666777888999LU", "spend_amount": 997, "cashier": "Andrew Jones", "register": "03", "items": [ { "item": { "charged_price": 599, "description": "Three buttermilk biscuits with sausage gravy", "name": "Biscuits and Gravy", "quantity": 1, "sku": "01abc192", "category": "Breakfast Mains", "standard_price": 599 } }, { "item": { "charged_price": 398, "description": "12oz Can of Coca-Cola", "name": "Can Coke", "quantity": 2, "sku": "291soo01", "category": "Drinks", "standard_price": 199, "upc": "04963406" } } ] } }' https://api.thelevelup.com/v14/orders

```

### Example Response Body
```json
{
  "order": {
    "uuid": "1a2b3c4d5e6f7g8h9i9h8g7f6e5d4c3b2a1",
    "spend_amount": 997,
    "tip_amount": 0,
    "total_amount": 997
  }
}
```

### Response Parameters

| Parameters      | Type       | Description                              |
|-----------------|------------|------------------------------------------|
|  `order`        | JSON Hash  | Successfully created order object.       |
|  `uuid`         | String     | UUID for the order.                      |
|  `spend_amount` | Integer    | Amount requested for payment (in cents). |
|  `tip_amount`   | Integer    | Tip amount (in cents).                   |
|  `total_amount` | Integer    | Total amount including tip (in cents)    |


### Errors

`HTTP/1.1 error 422 Unprocessable Entity` - QR code was not recognized

```json
[{
    "error": {
      "message": "We couldn't recognize that as a valid LevelUp Code. Perhaps scan again?",
      "object": "order",
      "property": "base"
    }
}]
```

`HTTP/1.1 error 422 Unprocessable Entity` - The customer's card could not be charged

```json
[{
    "error": {
      "message": "Sorry. We cannot charge the credit card at this time.",
      "object": "order",
      "property": "base"
    }
}]
```

`HTTP/1.1 error 422 Unprocessable Entity` - Invalid payment token

```json
[{
  "error": {
    "object": "order",
    "property": "payment_token_data",
    "code": "invalid",
    "message": "Payment token is invalid."
  }
}]
```

`HTTP/1.1 error 404 Not Found` - Location not found or not configured correctly

```json
[{
  "error": {
    "object": "order",
    "property": "location_id",
    "code": "not_found",
    "message": "Location not found."
  }
}]
```
