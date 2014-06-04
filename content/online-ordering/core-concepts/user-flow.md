---
title: "User Flow"
navigation: 2
---

Below is an overview of the transaction process from a consumer perspective for an online ordering transaction paid with LevelUp.

1. The user will add items to their cart.
2. When ready to pay, the user will press a button that reads "Pay with LevelUp".
	- If they have not yet granted permissions, this should prompt them grant permissions to your app to charge their account.
	- If they do not have a LevelUp account, they should be prompted to create one.
3. You will then send the order to LevelUp for processing.
4. If it's successful, you will receive the successful response along with some additional details. At this point, you should submit the order to the merchant. The consumer will then receive a push notification and email receipt detailing their purchase and any savings.

LevelUp prides itself on enabling a simple, quick and convenient user experience. As you can see in the flow above, the consumer never has to do anything but pay with LevelUp to receive all discounts, rewards, loyalty progress etc... from the merchants. All that logic is applied automatically by LevelUp server-side.
