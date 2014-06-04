---
title: 'Detached Refunds .: Create'
navigation: 400
category: 'Detached Refunds'
action: 'Create'
---

Create a Detached Refund
---

This endpoint creates a detached refund.

A detached refund is a way of granting credit to a customer in cases where the point of sale does
not support voiding payments; or where payments must be voided the same day, and that day has
already closed.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">POST</span> /v14/detached_refunds
</div>

### Authentication Required -- Merchant Token in Header

```
Authorization: token 123456-50c345032b...
```

### Request Body

```json
{
  "detached_refund": {
    "cashier": "Andrew Jones",
    "credit_amount": 743,
    "customer_facing_reason": "Sorry about your coffee!",
    "identifier_from_merchant": "001001",
    "internal_reason": "Andrew didn't like his coffee",
    "location_id": 1855,
    "manager_confirmation": "12345",
    "payment_token_data": "LU02111222333444555666777888999LU",
    "register": "03"
  }
}
```

### Request Parameters

| Parameters                       | Type    | Required | Description                                                                                                |
|----------------------------------|---------|----------|------------------------------------------------------------------------------------------------------------|
| `cashier`                        | String  | No       | Cashier name or identifier. Max 255 characters.                                                            |
| `credit_amount`                  | Integer | Yes      | Total amount to be credited (in cents).                                                                    |
| `customer_facing_`<br>`reason`   | String  | No       | An optional message to the customer. It will be displayed in the email receipt. Max 1000 characters.       |
| `identifier_from_`<br>`merchant` | String  | No       | The POS-specific order ID or number for the check. Max 255 characters.                                     |
| `internal_reason`                | String  | No       | An optional internal explanation of the refund. It will not be shown to the customer. Max 1000 characters. |
| `location_id`                    | Integer | Yes      | LevelUp Location ID that is granting the refund.                                                           |
| `manager_confirmation`           | String  | No       | The manager confirmation code, if the merchant requires one.                                               |
| `payment_token_data`             | String  | Yes      | Customer QR code data (input from the LevelUp Scanner).                                                    |
| `register`                       | String  | No       | Register name or identifier. Max 255 characters.                                                           |

### cURL Example

```bash
curl -H Accept: application/json -H Content-Type: application/json -H Authorization: "token 123456-50c345032b..." -d '{"detached_refund":{"credit_amount":734,"location_id":1855,' '"payment_token_data":"LU02111222333444555666777888999LU"}}' https://api.thelevelup.com/v14/detached_refunds
```

### Example Response

```json
{
  "detached_refund": {
    "cashier": "Andrew Jones",
    "credit_amount": 734,
    "customer_facing_reason": "Sorry about your coffee!",
    "identifier_from_merchant": "001001",
    "internal_reason": "Andrew didn't like his coffee",
    "location_id": 1855,
    "loyalty_id": 123,
    "refunded_at": "2014-01-01T00:00:00-04:00",
    "register": "03"
  }
}
```

### Response Parameters

| Parameters                       | Type             | Description                                                  |
|----------------------------------|------------------|--------------------------------------------------------------|
| `cashier`                        | String or `null` | Cashier name or identifier.                                  |
| `credit_amount`                  | Integer          | Total amount credited (in cents).                            |
| `customer_facing_`<br>`reason`   | String or `null` | Message displayed to the customer in the email receipt.      |
| `identifier_from_`<br>`merchant` | String or `null` | The POS-specific order ID or number for the check.           |
| `internal_reason`                | String or `null` | The internal explanation of the refund.                      |
| `location_id`                    | Integer          | LevelUp location ID that granted the refund.                 |
| `loyalty_id`                     | Integer          | LevelUp loyalty ID representing the recipient of the credit. |
| `refunded_at`                    | String (Date)    | The date and time that the refund was granted.               |
| `register`                       | String or `null` | Register name or identifier.                                 |

### Errors

`HTTP/1.1 401 Unauthorized` - You're not associated with a merchant, location does not belong to
your merchant, or the location does not exist

(No response body.)

`HTTP/1.1 422 Unprocessable Entity` - The manager confirmation was incorrect

```json
[{
  "error": {
    "object": "detached_refund",
    "property": "manager_confirmation",
    "message": "Manager confirmation was incorrect."
  }
}]
```

`HTTP/1.1 422 Unprocessable Entity` - The recipient has never transacted at the merchant

```json
[{
  "error": {
    "object": "detached_refund",
    "property": "base",
    "message": "You can't refund Andrew J. because they've never transacted at LevelUp Cafe."
  }
}]
```

`HTTP/1.1 422 Unprocessable Entity` - The credit amount is more than the recipient has ever spent
at the merchant

```json
[{
  "error": {
    "object": "detached_refund",
    "property": "credit_amount",
    "message": "Credit amount cannot be more than Andrew J. has ever spent at LevelUp Cafe."
  }
}]
```
