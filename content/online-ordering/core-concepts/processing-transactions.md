---
title: "Processing Transactions"
navigation: 6
---

Once the user is ready to complete their order (perhaps by hitting a "Pay With LevelUp" button), you can process the order by hitting the LevelUp orders endpoint to create an order.

When submitting an order, you'll send in the following attributes:

- User `access_token` in the authorization header
- Merchant `access_token` in the authorization header (your account or the facilitated merchant's account
- Location ID
- Total Sales Price including sales tax as applied to the full value of the order
- Items In The Order

If it is successful, LevelUp will return a full response object with additional information about the order. LevelUp will then also send a push notification and email receipt to the consumer. You should also send an e-receipt to the user if it contains more details or special instructions.
