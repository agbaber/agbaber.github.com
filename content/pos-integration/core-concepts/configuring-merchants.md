---
title: "Configuring Merchants"
navigation: 1
---

Each merchant within the LevelUp ecosystem has a merchant account with LevelUp. This merchant account enables them to process payments, run campaigns and view their customer data.

A POS with LevelUp integration is essentially processing payments on behalf of a merchant and therefore needs to connect to that merchant's account to be granted permission to do so.

The first step to interacting with the LevelUp API on behalf of a merchant is to obtain an authorization token for that LevelUp merchant. This is accomplished by making a POST request to the [access token endpoint](/api-reference/v14/access-tokens-create/) with your specific API key, the merchant's username, and merchant's password.

Your POS should expose a simple login interface (for the merchant's username & password) to enable merchants to connect their LevelUp merchant account to your POS. This will return an authorization token and merchant ID which can be used to process payments on behalf of that merchant. The merchant's username and password should never be stored in your system, only the authorization token. Authorization tokens are long-lived and will only be invalidated when a merchant does so via manual action in their account dashboard.

If a merchant has multiple locations, you'll also want to pair your systems representation of a location to that of LevelUp's.  The merchant's ID will also enable you to hit the [locations endpoint](/api-reference/v14/locations-list-by-merchant/) to look up the locations that belong to that merchant, along with their addresses and IDs. These can be automatically paired based on address or paired one by one by presenting an interface for the merchant to match up the locations.

Once you have the merchant's ID, locations and authorization token, your POS has configured itself and should be ready to [process transactions](/pos-integration/core-concepts/processing-transactions/).
