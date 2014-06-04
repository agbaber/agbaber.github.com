---
title: "Payment"
navigation: 5
---

A payment token is a unique ID, tied to a single user, that enables them to make a payment with
LevelUp. The payment token's data is encoded in a QR code which is scanned by a LevelUp Scanner when
the user pays. Each payment token is scoped to both the user and also to the app which is requesting
it.

Apps should regularly check the current user's payment token. A good time to do this is immediately
when the app becomes active. There are several reasons to do this:

* A user's payment token may have expired or changed. LevelUp may randomly rotate tokens for
  increased security.
* A user's access token may have expired. In this case, the request will return with a "login
  required" error.
* If the request returns a "not found" error, it means the user is not currently payment eligible.
  This may mean they haven't added any credit/debit cards or their card has expired. In this case,
  consider directing the user to add a card, rather than showing a QR code.
* This is a very quick request and can catch a lot of potentially confusing user situations if run
  right when the app becomes active.

For optimal user experience, it's a good idea to cache the user's payment token. This way, if the
user's device is having trouble connecting to the network, they can still pay.

## iOS
A payment token is represented by the
[LUPaymentToken](http://thelevelup.github.io/levelup-sdk-ios/Classes/LUPaymentToken.html) class. Use
[LUPaymentTokenRequestFactory](http://thelevelup.github.io/levelup-sdk-ios/Classes/LUPaymentTokenRequestFactory.html)
to create the payment token request.

## Android
A payment token is represented by the
[PaymentToken](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/PaymentToken.html)
class. Use the
[PaymentTokenRequestFactory](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/request/factory/PaymentTokenRequestFactory.html)
to create the payment token request. The response should be parsed with the
[PaymentTokenJsonFactory](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/factory/json/PaymentTokenJsonFactory.html)
if the response status is
[LevelUpStatus.OK](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/LevelUpStatus.html#OK).
If the response status is
[LevelUpStatus.ERROR\_NOT\_FOUND](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/LevelUpStatus.html#ERROR_NOT_FOUND),
then the user is not payment eligible.
