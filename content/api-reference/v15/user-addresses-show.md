---
title: 'User Addresses .: List'
navigation: 1
category: 'User Addresses'
action: 'List'
---

List a user's addresses
---

This endpoint allows you to get all of the addresses of a user.

### Request

<div class="http-request">
  <span class="http-verb">GET</span> /v15/user_addresses
</div>

**NOTE: This is a v15 endpoint. Our stable API version is v14. v15 is our beta branch for exciting new features.**

To see a user's addresses, you must have a user access token with the `manage_user_addresses` permission.

The authorization header should be in the following format:

```
Authorization: token user="123456-75489120749..."
```

A response will look something like below.

```json
[
  {
    "user_address": {
      "address_type": "home",
      "street_address": "101 Arch Street",
      "extended_address": nil,
      "locality": "Boston",
      "region": "MA",
      "postal_code": "02114"
    }
  },
  {
    "user_address": {
      "address_type": 'billing',
      ...
    }
  }
]
```

### Response Parameters

| Parameters                  | Type       | Description                                                                                              |
|-----------------------------|------------|----------------------------------------------------------------------------------------------------------|
|  `address_type`             | String     | The type of the address. Valid values are 'billing', 'home', 'other', 'payment', 'shipping', and 'work'. |
|  `extended_address`         | String     | The second portion of a user's address.                                                                  |
|  `locality`                 | String     | The city of the address.                                                                                 |
|  `postal_code`              | String     | The ZIP code of the address.                                                                             |
|  `region`                   | String     | The state of the address.                                                                                |
|  `street_address`           | String     | The street and number of the address.                                                                    |
