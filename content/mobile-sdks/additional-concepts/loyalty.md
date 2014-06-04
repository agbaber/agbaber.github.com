---
title: "Loyalty"
---

Loyalty represents the user's relationship with a merchant, including the credit available and
earned across the merchant's locations. This is typically used to display an indicator or progress
bar for loyalty credit or rewards levels.

## iOS

Loyalty is represented by the
[LULoyalty](http://thelevelup.github.io/levelup-sdk-ios/Classes/LULoyalty.html) class. Use
[LULoyaltyRequestFactory](http://thelevelup.github.io/levelup-sdk-ios/Classes/LULoyaltyRequestFactory.html)
to request loyalty at a specific merchant.

## Android

Loyalty is represented by the
[Loyalty](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/Loyalty.html)
class. Use the
[LoyaltyRequestFactory](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/request/factory/LoyaltyRequestFactory.html)
to create a loyalty request. The response should be parsed with the
[LoyaltyJsonFactory](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/factory/json/LoyaltyJsonFactory.html)
if the response status is
[LevelUpStatus.OK](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/LevelUpStatus.html#OK).
