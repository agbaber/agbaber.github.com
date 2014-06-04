---
title: 'Permissions List'
navigation: 4
---

Apps on LevelUp interact with merchants and users based on granular permission sets. Below is a
table of the permissions that your app can request and what each permission enables your app to do.
Not every endpoint requires a permission. For the full list of endpoints, visit the [API Reference](/api-reference/)
section.

User Permissions
----------------

The permissions you'll need to interact with users.

| Permission Name                  | Description                                               | Endpoints Available                                                    | Restrictions                                                                           |
|----------------------------------|-----------------------------------------------------------|------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| `create_orders`                  | Charge a user on behalf of a merchant.                    | [Create order](/api-reference/v15/orders-create/)               | Requires a merchant access token with the manage\_merchant\_orders permission also.    |
| `read_user_`<br>`orders`         | Read a users transaction history, with item level detail. | [List user orders](/api-reference/v15/user-orders-list/)               |                                                                                        |
| `read_user_`<br>`basic_info`     | Read a user's name, email, birthday and gender            | [Get user details](/api-reference/v15/user-show/)                      |                                                                                        |
| `read_qr_code`                   | Read a user's current payment token info                  | [Get user QR code](/api-reference/v15/qr-codes-get/)                   | QR codes are only guaranteed to be good for one transaction.                           |
| `manage_user_`<br>`campaigns`    | Can view credit for a user and claim campaigns.           |                                                                        |                                                                                        |
| `manage_user_`<br>`addresses`    | Can read a user's addresses and add new ones.             | [Create user addresses](/api-reference/v15/user-addresses-create/) and [List user addresses](/api-reference/v15/user-addresses-show/)         | Can not edit addresses. Only read and add.                                             |
| `create_user_`<br>`registration` | Can create a new user and add a single card               |                                                                        | Restricted usage. Please email enterprise@thelevelup.com                               |

Merchant Permissions
--------------------

| Permission Name                              | Description                                                              | Endpoints Available                                                            | Restrictions                                                                           |
|----------------------------------------------|--------------------------------------------------------------------------|--------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| `manage_merchant_`<br>`orders`               | Can create orders on behalf of this merchant and be able to refund them  | [Create order](/api-reference/v15/orders-create/)                       | Also requires a user access_token to charge the user                                   |
| `give_merchant_`<br>`funded_credit`          | Can grant credit on behalf of a merchant                                 | [Give merchant funded credit](/api-reference/v15/merchant-funded-credit-give/) |                                                                                        |
| `read_merchant_`<br>`locations`              | Can view all of a merchants locations, even not yet visible ones         |                                                                                |                                                                                        |
| `read_merchant_`<br>`transaction_history`    | Can read a merchants transaction history                                 |                                                                                |                                                                                        |
| `read_customer_list`                         | Can read a merchants customer list                                       |                                                                                | User information is restricted                                                         |

Enterprise Permissions
----------------------

Usage of these is restricted to the LevelUp Enterprise SDK. Access to the LevelUp Enterprise SDK is
highly restricted and not free. You will be required to submit an application that includes a D&B
number. Please email enterprise@thelevelup.com. The Enterprise SDK is really only needed in very
specific scenarios. If you're not sure you need it, you probably don't.

| Permission Name                 | Description                                                                                                              | Endpoints Available | Restrictions                                                                           |
|---------------------------------|--------------------------------------------------------------------------------------------------------------------------|---------------------|----------------------------------------------------------------------------------------|
| `manage_user_`<br>`log_in`      | Can log users in with username & password as opposed to deeplinking to LevelUp on mobile or using two-factor flow online |                     | Enterprise SDK Only                                                                    |
| `manage_funding_`<br>`sources`  | Can manage a user's credit cards and add news                                                                            |                     | Enterprise SDK Only                                                                    |
| `create_support_`<br>`tickets`  | Can submit support tickets                                                                                               |                     | Enterprise SDK Only                                                                    |
| `manage_user_`<br>`information` | Can manage a user's basic information and custom attributes                                                              |                     | Enterprise SDK Only                                                                    |
