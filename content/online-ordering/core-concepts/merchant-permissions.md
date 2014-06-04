---
title: "Merchant Permissions"
navigation: 1
---
In order to process orders on behalf of a LevelUp merchant account you'll need an `access_token` with the correct permissions.

To get a merchant `access_token`, simply use the [LevelUp Log In](/api-reference/v14/access-tokens-create/) endpoint with the account of the user who is the admin of your merchant on LevelUp. The `access_token` returned will have permission to take actions (such as creating orders) on behalf of the merchant.

The LevelUp permissioning architecture is flexible, meaning that you can process orders to handle a number of different scenarios:

1. Process orders on behalf of your own merchant account
2. Process orders on behalf of other merchant's accounts
3. Process orders on behalf of your merchant account or other merchants accounts

Let's walk through each of these scenarios below.

<u>1) Processing Orders On Behalf Of Your Own Merchant Account</u>
If you are acting as a merchant yourself, you'll want to [set up a merchant account with LevelUp](https://www.thelevelup.com/what-is-levelup). Your user will be the admin of that merchant and you'll simply use the log in endpoint to retrieve the appropriate `access_token` with permissions to create orders on behalf of that merchant.

<u>2) Processing Orders On Behalf Of Other Merchant's Account</u>
Each merchant within the LevelUp ecosystem has a merchant account with LevelUp. This merchant account enables them to process payments, run campaigns and view their customer data.

When a merchant already has an account with LevelUp, the e-commerce service can facilitate payments on behalf of a merchant account. But you need that merchants permission to do so. You should obtain that permission by exposing a simple login interface (username & password) for enabling merchants to connect their LevelUp merchant account to your service. The login endpoint will return an `access_token` and merchant ID which can be used to process payments on behalf of that merchant. The merchants username and password should never be stored in your system, only the `access_token`. Access_tokens are long-lived and would only be invalidated through a manual action a merchant may take in their account dashboard.

If your e-commerce implementation is used for ordering food (or other goods) from specific locations, you'll also want to pair your system’s representation of a merchant’s location with LevelUp's representation. The merchant's ID will also enable you to hit a locations endpoint to look up the locations that belong to that merchant, along with their address and IDs. These can be automatically paired based on address or paired one by one by presenting an interface for the merchant to match up the locations.

Once you have the merchant's ID, locations and `access_token`, your e-commerce service has all the necessary information to be ready to process transactions on behalf of another merchant.

<u>3) Processing Orders On Behalf Of Your Merchant Account Or Other Merchant's Accounts</u>
Sometimes it's necessary to mix-and-match methods 1 and 2. There's nothing wrong with that! In fact, it's quite common. For example, if you are an online ordering company, you'd want to have your own merchant account so that users can pay with LevelUp when ordering from any merchant on your platform, but also enable merchants with LevelUp accounts to connect those accounts so that users can accrue/redeem rewards at those merchants when ordering from your site. In this scenario, simply use the merchant's `access_token` when available (when they have a LevelUp merchant account linked) and fall back to your merchant account when they don't have one.

<u>What Does Order Facilitation Mean?</u>
This idea of processing "on behalf" of a merchant is potentially something new for most e-commerce services services. You are likely used to processing payments on behalf of your own merchant account, and then paying out the merchants directly. With LevelUp, it's slightly different if you're facilitating orders on behalf of a merchant's existing LevelUp account. When you process the payment on behalf of the merchant, here's what happens:

- LevelUp will apply all the merchant funded discounts, incentives offers and campaign logic when the payment is processed through LevelUp on behalf of the merchant. When consumers redeem offers from merchants on LevelUp, we never charge that money to the consumer and thus never pay it to the merchant. If you were to process the payment on behalf of your own merchant account, we wouldn't be able to apply the merchant's campaigns and the user would miss out on savings and progress towards future savings.
- LevelUp will pay the merchant directly the next day for all funds, minus of course the discounts and incentives redeemed by users.
- Merchants will be able to see data about that transaction from that customers in their merchant CRM. By processing on behalf of the merchant, merchant's can track their customers interactions with their business regardless of where they pay; in-store or online.
- Merchants will be able to continue to account for their LevelUp transactions and any campaigns they're running on LevelUp, all in one place.
- The merchant will pay LevelUp's 1.95% payment processing fee.
