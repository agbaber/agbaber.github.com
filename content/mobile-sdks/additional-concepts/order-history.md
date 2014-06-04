---
title: "Order History"
---

A user may have many orders charged at merchants on LevelUp. The SDK allows you to get a list of a
logged in user's orders at the locations associated with your app. See [Locations](../locations) for
details about merchants and locations.

Two requests are supported by the SDK:

 - Order history for the user for the current app. This request is paginated. Rather than requiring
   you to keep track of a "page" index, instead each response will contain a URL pointing to the
   next page of results.
 - Details of a specific order for the user by its UUID.


## iOS

Orders are represented by the
[LUOrder](http://thelevelup.github.io/levelup-sdk-ios/Classes/LUOrder.html) class. Use
[LUOrderRequestFactory](http://thelevelup.github.io/levelup-sdk-ios/Classes/LUOrderRequestFactory.html)
to request orders. For requests returned from `requestForOrders`, the `nextPageURL` method of the
`LUAPIResponse` instance will contain a link to the next page, which can be passed to
`requestForOrdersOnPage:` to retrieve the next page of results. When this requests returns `nil`,
you have reached the last page of orders.

## Android

Orders are represented by the
[Order](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/Order.html)
class. Use the
[OrderRequestFactory](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/request/factory/OrderRequestFactory.html)
to create requests. For the requests returned from
[getAppOrdersRequests](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/request/factory/OrderRequestFactory.html#newGetAppOrdersRequest(long,%20int)),
the web service will return link headers pointing to the next page. If the status of the
[LevelUpResponse](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/LevelUpResponse.html)
returned from the web service is
[LevelUpStatus.OK](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/LevelUpStatus.html#OK)
and
[LevelUpResponse.getHttpStatusCode](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/AbstractResponse.html#getHttpStatusCode())
returns HTTP 204, you have reached the last page of orders. For successful requests, the response
should be parsed with
[OrderJsonFactory](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/factory/json/OrderJsonFactory.html).
