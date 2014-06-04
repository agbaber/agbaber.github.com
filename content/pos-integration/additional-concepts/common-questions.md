---
title: "Common Questions"
navigation: 2
---

Here are some answers to common questions regarding integrating LevelUp into your point-of-sale system:

#### Should I still print a paper receipt?

LevelUp users do not expect paper receipts. We email them detailed receipts showing any credit
applied, any progress made towards unlocking loyalty credit and custom messages from the merchants.
They also receive a push notification and in-app receipt instantly with all the same details. A
paper receipt is not expected and potentially confusing as it won't have all the information the
LevelUp receipt will.

#### Why do I need to send LevelUp item level data?
For a number of reasons:

LevelUp uses this data to provide richer analytics to merchants. Merchants can target offers to
specific items and we need to know what items were purchased to know what credit/discounts to apply.

Brand advertisers can target offers to incentivize purchases of their products at merchants. This
drives additional sales to merchants, funded by someone else's advertising spend.

Because these three features are core value drivers for the LevelUp merchant ecosystem, we require
that POS systems deliver item level detail along with each transaction submitted to LevelUp.

#### Should I charge sales tax on the full amount of the order even the user is redeeming savings?
Sales tax should be calculated as normal per the rules already configured within your POS. Even if
an earned reward is being redeemed by the consumer, sales tax should be charged on the full amount
of the order as the "credit" is actually an earned currency (a form of money) and thus not exempt
from sales tax. Individual state laws may vary on this point, but the guaranteed safest approach is
to charge sales tax on the full amount of the order and pay that full amount of sales tax to the
relevant government entity.

#### Can I store the merchant's password in my point-of-sale for later usage? 
No. You should not store anything but the merchant's access token. You won't need and shouldn't use 
the password for anything but the initial authentication.
