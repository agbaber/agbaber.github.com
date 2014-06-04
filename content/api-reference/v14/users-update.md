---
title: 'Users .: Update'
navigation: 1130
category: 'Users'
action: 'Update'
---
Update a User
---

This endpoint updates a user account. Include as few or as many user parameters as you wish to update.
See section “[Custom user attributes](/api-reference/v14/users-custom-attributes/)” for more information on the
`custom_attributes` key.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">PUT</span> /v14/users/:id
</div>

### Authentication Required -- User token

```
Authorization: token 123456-75489120749...
```

### Request Body

```json
{
  "user": {
    "email": "ryanp@thelevelup.com",
    "first_name": "Ryan",
    "last_name": "Punxsutawney",
    "password": "s3cr3t"
  }
}
```

### Request Parameters

| Param               | Type          | Required | Description                                                                                                                                                                                                                                      |
|---------------------|---------------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id`                | Integer       | Yes      | The user's ID.                                                                                                                                                                                                                                   |
| `born_at`           | String (Date) | No       | The user's birthday as an ISO 8601 date (YYYY-MM-DD).                                                                                                                                                                                            |
| `custom_attributes` | Object        | No       | Arbitrary key-value data to associate with this user. Scoped by the API Key associated with the request's access token. For more information about custom user attributes, see section "[Custom user attributes](/api-reference/v14/users-custom-attributes/)". |
| `email`             | String        | No       | The user's email address.                                                                                                                                                                                                                        |
| `first_name`        | String        | No       | The user's first name.                                                                                                                                                                                                                           |
| `gender`            | String        | No       | The user's gender. Valid values are "female", "male", and null.                                                                                                                                                                                  |
| `last_name`         | String        | No       | The user's last name.                                                                                                                                                                                                                            |
| `new_password`      | String        | No       | The user's new password.                                                                                                                                                                                                                         |

### cURL Example

```bash
curl -X PUT -H Accept:application/json -H Content-Type:application/json -H Authorization:"token 123456-75489120749..." -d '{ "user": { "last_name": "Foo" } }' https://api.thelevelup.com/v14/users/123456
```

### Example Response Body

`HTTP/1.1 200 OK`

```json
{
  "user": {
    "born_at": null,
    "cause_id": 123,
    "connected_to_facebook": true,
    "custom_attributes": { "foo": "bar" },
    "email": "ryanp@thelevelup.com",
    "first_name": "Ryan",
    "gender": null,
    "global_credit_amount": 0,
    "last_name": "Punxsutawney",
    "merchants_visited_count": 0,
    "debit_card_only": false,
    "orders_count": 0,
    "terms_accepted_at": null,
    "total_savings_amount": 0
  }
}
```

### Response Parameters

| Parameters                | Type    | Description                                       |
|---------------------------|---------|---------------------------------------------------|
| `born_at`                 | String  | The user's birthdate (if available)               |
| `cause_id`                | Integer | The ID of the cause the user is associated with   |
| `connected_to_facebook`   | Boolean | The state of the user's connection to facebook    |
| `custom_attributes`       | Object  | Arbitrary key-value data to associate with this user. Scoped by the API Key associated with the request's access token. For more information about custom user attributes, see section "[Custom user attributes](/api-reference/v14/users-custom-attributes/)". |
| `email`                   | String  | The user's email address                          |
| `first_name`              | String  | The user's first name                             |
| `gender`                  | String  | The user's gender                                 |
| `debit_card_only`         | Boolean | If the user's account is limited to debit cards   |
| `global_credit_amount`    | Integer | The amount of global credit in the user's account |
| `last_name`               | String  | The user's last name                              |
| `merchants_visited_count` | Integer | The number of merchants the user has visited      |
| `orders_count`            | Integer | The number of orders a user has made              |
| `terms_accepted_at`       | String  | The date the user accepted LevelUp's terms        |
| `total_savings_amount`    | Integer | The total amount the user has saved on Levelup    |

### Errors

#### The user token is invalid

`HTTP/1.1 401 Unauthorized`

