---
title: "Manage Cards"
navigation: 4
---

A user may have multiple cards, but one will be marked as "promoted". This means that this card will
be attempted to be charged first when a payment is made.

Several requests are supported by the SDK:

- Requesting information on all of the user's cards. The user's CVV and full credit card number are
  not included.
- Adding a credit/debit card.
- Promoting a card. This will automatically "unpromote" the currently promoted card.
- Deleting a card.

## iOS

Cards are represented by the
[LUCreditCard](http://thelevelup.github.io/levelup-sdk-ios/Classes/LUCreditCard.html) class. Use
[LUCreditCardRequestFactory](http://thelevelup.github.io/levelup-sdk-ios/Classes/LUCreditCardRequestFactory.html)
to create requests.

## Android

Cards are represented by the
[CreditCard](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/CreditCard.html)
class. Use the
[CreditCardRequestFactory](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/request/factory/CreditCardRequestFactory.html)
to create the credit card request. The response should be parsed with the
[CreditCardJsonFactory](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/factory/json/CreditCardJsonFactory.html)
if the response status is
[LevelUpStatus.OK](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/LevelUpStatus.html#OK).
