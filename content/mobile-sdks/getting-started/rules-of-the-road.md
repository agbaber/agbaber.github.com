---
title: "Rules of the Road"
navigation: 2
---

Mobile apps built using the LevelUp SDK should emphasize speed, security, and fault-tolerance.

## Keep the user's stuff safe
Never store passwords or credit card numbers. Always use app-private storage (Android) and the
keychain (iOS) to store sensitive information like access or payment tokens. On Android, disallow
backups of app data and screenshots of activities that include the user's QR code. Never expose the
user's LevelUp data to other apps via intents, content providers, or shared storage.

## Don't make the user worry about their network state
Cache but refresh in the background when possible, especially for the user's payment token. Letting
the user pay quickly regardless of network state is a core feature of LevelUp, but fresh data is
better when you can get it. Log the user out if you get an login-required response (HTTP 401
Unauthorized) -- this means the user needs to reauthenticate.

## Keep the user informed
Make sure the user knows they're agreeing to LevelUp's terms of service.
Users shouldn't be surprised by the creation of a LevelUp account. Always show "By tapping below you
agree to the [terms and conditions](https://www.thelevelup.com/terms)." with a link to
https://www.thelevelup.com/terms/.


For more detailed do’s and don’ts (along with a healthy dose of legalese) please see our [Platform
Rules of the Road](../../../getting-started/rules-of-the-road/) and [Developer Terms & Conditions]
(https://www.thelevelup.com/developer-terms).
