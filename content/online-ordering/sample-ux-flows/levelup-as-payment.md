---
title: "LevelUp as Payment"
navigation: 1
---

The most basic way to use LevelUp is simply as a method of payment. In this scenario, the user flow is as follows:

### Online:

1. User logs in or registers for your site's account
2. On the checkout screen, your site displays payment options and ability to add new ones
3. User selects "Pay with LevelUp" and is presented with a text field to enter their email
4. You pass the user's email to LevelUp's [User Permissions](/api-reference/v15/permissions-create/) endpoint along with the requested permissions, such as: `create_orders` or `read_user_orders`
5. The user receives a push notification to their mobile device explaining the permission request and accepts or rejects it
6. You receive a callback from our site (or can poll an endpoint) with the `access_token` from the user. That `access_token` can now be used to charge the user money, read their basic info, etc.

### In-App:

1. User logs in or registers for your app's account
2. On the checkout screen, you display payment options and ability to add new ones
3. User selects "Pay with LevelUp" and is deep-linked into the LevelUp application. The deep-link URL must be configured with the desired permissions.
4. LevelUp presents a dialog to the user explaining the permission request.
5. The user accepts or rejects it and is redirected back to your app with an `access_token`. That `access_token` can now be used to charge the user money, read their basic info, etc.
The `access_token` LevelUp passes back both online and in-app can be stored on that users account for future usage, allowing the user to authenticate just one time.
