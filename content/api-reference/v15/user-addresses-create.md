---
title: 'User Addresses .: Create'
navigation: 1
category: 'User Addresses'
action: 'Create'
---

Create a new address for a user
---

This endpoint allows you to create a new address for a user.  To create an address, you must have a user access token with the `manage_user_addresses` permission.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">POST</span> /v15/user_addresses
</div>

**NOTE: This is a v15 endpoint. Our stable API version is v14. v15 is our beta branch for exciting new features.**

### Authentication Required -- User Token in Header

```
Authorization: token user="489882-2b5ecc5f80005f8f64bb354161275f6558f7cac45e4888ab"
```

A request will look something like below.

```json
{
  "user_address": {
    "address_type": "home",
    "street_address": "101 Arch Street",
    "extended_address": "Suite 555",
    "locality": "Boston",
    "region": "MA",
    "postal_code": "02114"
  }
}
```

### Request Parameters

| Parameters                  | Type       | Description                                                                                              |
|-----------------------------|------------|----------------------------------------------------------------------------------------------------------|
|  `address_type`             | String     | The type of the address. Valid values are 'billing', 'home', 'other', 'payment', 'shipping', and 'work'. |
|  `extended_address`         | String     | The second portion of a user's address.                                                                  |
|  `locality`                 | String     | The city of the address.                                                                                 |
|  `postal_code`              | String     | The ZIP code of the address.                                                                             |
|  `region`                   | String     | The state of the address.                                                                                |
|  `street_address`           | String     | The street and number of the address.                                                                    |

### Responses

#### The address was created successfully

`HTTP/1.1 200 OK`

```json
{
  "user_address": {
    "address_type": "home",
    "extended_address": "Suite 555",
    "locality": "Boston",
    "postal_code": "02114",
    "region": "MA",
    "street_address": "101 Arch Street"
  }
}
```

#### The address details were invalid

`HTTP/1.1 422 Unprocessable Entity`

```json
[{
  "error": {
    "object": "user_address",
    "property": "address_type",
    "message": "Address type is invalid."
  }
}]
```
