---
title: 'Orders .: Create'
navigation: 1
category: 'Orders'
action: 'Create'
---

Place a Connected App Order
---

This endpoint allows you to create permissions-based orders.  Once a customer has approved your permissions request to charge orders, you'll receive an access token you can use to charge orders to their account.

To create an order, you must have a user access token with the `create_orders` permission and a
merchant access token with the `manage_merchant_orders` permission. As an alternative to using a
user access token to authenticate the user, you can include the user's QR code in the
`payment_token_data` parameter of the request body.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">POST</span> /v15/orders
</div>

** NOTE: This is a v15 endpoint.  Our stable API version is v14.  v15 is our beta branch for
exciting new features.**

### Authentication Required -- Merchant and User Tokens in Header

```
Authorization: token merchant="123456-abcdefghijklmnopqrstuvwxyz1234567890", user="123145-zasefghijklmnopqrstuvwxyz1234567890"
```

### Request Body

```json
{
  "order": {
    "identifier_from_merchant": "001001",
    "location_id": 1234,
    "spend_amount": 997,
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
|  `token`                          | String     | Yes      | Authentication token (`access_token`) for the merchant.               |
|  `identifier_from_`<br>`merchant` | String     | No       | The order ID or number for the check.  Max 10 characters.             |
|  `location_id`                    | Integer    | Yes      | LevelUp Location ID that is placing the order.                        |
|  `payment_token_data`             | String     | No       | Customer QR code data (input from the LevelUp Scanner).               |
|  `spend_amount`                   | Integer    | Yes      | Total amount to be charged (in cents).                                |
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
curl -X POST -H Accept:application/json -H Content-Type:application/json -H 'Authorization: token merchant="123456-abc...", user="456789-zas..."' -d '{ "order": { "identifier_from_merchant": "001001", "location_id": 1234, "spend_amount": 997, "items": [ { "item": { "charged_price": 599, "description": "Three buttermilk biscuits with sausage gravy", "name": "Biscuits and Gravy", "quantity": 1, "sku": "01abc192", "category": "Breakfast Mains", "standard_price": 599 } }, { "item": { "charged_price": 398, "description": "12oz Can of Coca-Cola", "name": "Can Coke", "quantity": 2, "sku": "291soo01", "category": "Drinks", "standard_price": 199, "upc": "04963406" } } ] } }' https://api.thelevelup.com/v15/orders

```

### Example Response

```json
{
  "order": {
    "uuid": "1a2b3c4d5e6f7g8h9i9h8g7f6e5d4c3b2a1",
    "spend_amount": 10,
    "tip_amount": 0,
    "total_amount": 10
  }
}
```

### Response Parameters

| Parameters      | Type       | Description                              |
|-----------------|------------|------------------------------------------|
|  `order`        | JSON Array | Successfully created order object.       |
|  `uuid`         | String     | UUID for the order.                      |
|  `spend_amount` | Integer    | Amount requested for payment (in cents). |
|  `tip_amount`   | Integer    | Tip amount (in cents).                   |
|  `total_amount` | Integer    | Total amount including tip (in cents)    |


### Errors

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


`HTTP/1.1 401 Unauthorized` - Not authorized to create orders for this user.

```json
[{
  "error": {
    "object": "order",
    "property": "user_token",
    "code": "not_authorized",
    "message": "Not authorized to create orders for this user."
  }
}]
```

`HTTP/1.1 401 Unauthorized` - Not authorized to create orders for this merchant.

```json
[{
  "error": {
    "object": "order",
    "property": "merchant_token",
    "code": "not_authorized",
    "message": "Not authorized to create orders for this merchant."
  }
}]
```
