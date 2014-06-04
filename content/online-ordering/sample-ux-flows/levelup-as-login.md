---
title: "LevelUp as Login"
navigation: 2
---

Using LevelUp as a login method is similar to using Facebook Connect, but instead of a social context, LevelUp provides a transactional context and can thus save a lot of time. In a normal checkout flow, the user must complete the following actions:

- Add Basic Information (Or Log In)
- Add Shipping Information
- Add Payment Information
- Add Billing Information

Enabling LevelUp as a login method can compress the long steps above into one quick step. Here's what the experience looks like:

### Online:

1. User is presented with a Log In With LevelUp button and is asked to enter their email address.
2. You hit our [Permissions](/api-reference/v15/permissions-create/) endpoint with the user's email and the requested permissions (such as: `create_orders`, `read_user_orders` and `manage_user_addresses`)
3. The user receives a push notification to their mobile device explaining the permission/login request and accepts or rejects it
4. You receive a callback from our site (or can poll an endpoint) with the access\_token from the user. That access\_token can now be used to charge the user money and read their order history.
5. You can now use this access token to get the user's basic information (registration accomplished), access the user's addresses (delivery information accomplished) and of course process payments (payment information and billing address accomplished)

### In-App:

1. User is presented with a Log In With LevelUp button and is deep-linked into the LevelUp app. The deep-link URI must be configured with the desired permissions.
2. LevelUp presents a dialog to the user explaining the permission request.
3. The user accepts or rejects it and is redirected to your app with an access_token.
4. You can now use this access token to get the user's basic information (registration accomplished), access the user's addresses (delivery information accomplished) and of course process payments (payment information and billing address accomplished)

Using LevelUp as a method of login is often preferable to simply using LevelUp as a method of payment because it enables you to take full advantage of the improved checkout experience that LevelUp can offer.

In some cases, you might want to use LevelUp as your sole account of record, in which case you'll also need to be able to register users within your app. More details on that are available in the next section.
