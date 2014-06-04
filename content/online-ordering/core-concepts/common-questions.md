---
title: "Common Questions"
navigation: 8
---
Here are some answers to common questions regarding integrating LevelUp into your online ordering system:

<u>Should I still email a receipt?</u>
Yes. LevelUp will also send an email receipt to the consumer confirming the transaction. But yours will likely have more detailed information about the specific order and any special instructions.

<u>Why do I need to send LevelUp item level data?</u>
For a number of reasons:

- LevelUp uses this data to provide richer analytics to merchants.
- Merchants can target offers to specific items and we need to know what items were purchased to know what credit/discounts to apply.
- Brand advertisers can target offers to incentivize purchases of their products at merchants. This drives additional sales to merchants, funded by someone else's advertising spend. 

Because these features are core value drivers for the LevelUp merchant ecosystem, we require that online ordering systems deliver item level detail along with each transaction submitted to LevelUp.

<u>Should I charge sales tax on the full amount of the order even the user is redeeming savings?</u>
Sales tax should be calculated as normal per the rules already configured within your app. Even if an earned reward is being redeemed by the consumer, our belief is that sales tax should be charged on the full amount of the order as the "credit" is actually an earned currency (a form of money) and thus not exempt from sales tax. Individual state laws may vary on this point, but the guaranteed safest approach is to charge sales tax on the full amount of the order and pay that full amount of sales tax to the relevant government entity.

If you would like to reduce sales tax by the amount of credit being redeemed, you can do this by making a request to the [User Credit Endpoint](/api-reference/v14/loyalties/) to see how much credit the user will redeem on this order. Then, to ensure accounting consistency, pass that amount back to LevelUp along with the order to guarantee that exactly that amount of credit is applied and no time-based edge-conditions can shift the amount of credit applied.

<u>Can I store the merchant's password in my online ordering solution for later usage?</u>
No. You should not store anything but the merchant's `access_token`. You should be using a [merchant permissions](/online-ordering/core-concepts/merchant-permissions/) request to retrieve an `access_token`.