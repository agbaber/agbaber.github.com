---
title: "Locations"
---

One of the core models in the LevelUp SDK is the concept of a "location". A location represents a
place of business that accepts LevelUp for payment. A LevelUp merchant may have one or more
associated locations. For example, imagine a chain restaurant with multiple franchises. This chain
is a single merchant, but each restaurant would have its own location.

When you create an app using LevelUp, you will choose if you want your app to be associated with a
single merchant, a group of merchants, or all LevelUp merchants. This choice is based on how your
app will use LevelUp. For example, if your app will be branded for a single merchant, then it
probably makes sense to be associated with that merchant only.

Using the SDK, you can request locations associated with your app, ordered by distance from a given
location. This request is paginated. Rather than requiring you to keep track of a "page" index,
instead each response will contain a URL pointing to the next page of results.

Note that all LevelUp merchants are still accessible via the SDK regardless of the locations with
which your app is associated. The SDK also provides methods to retrieve summary information on all
LevelUp locations. The requests for all locations are designed to be locally cached and sorted on
the device. The SDK will provide a seeded database of location summaries, and this database can be
periodically updated with changes from the LevelUp platform.

## iOS

Locations are represented by the
[LULocation](http://thelevelup.github.io/levelup-sdk-ios/Classes/LULocation.html) class. Use
[LULocationRequestFactory](http://thelevelup.github.io/levelup-sdk-ios/Classes/LULocationRequestFactory.html)
to create requests related to locations.

Location summary information is cached locally using Core Data. Use
[LUCachedLocationSearch](http://thelevelup.github.io/levelup-sdk-ios/Classes/LUCachedLocationSearch.html)
to search the cache, and
[LULocationCacheUpdater](http://thelevelup.github.io/levelup-sdk-ios/Classes/LULocationCacheUpdater.html)
to keep update the cache up-to-date.

## Android

Locations are represented by the
[Location](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/Location.html)
class. Use the
[LocationRequestFactory](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/request/factory/LocationRequestFactory.html)
to create requests. For the requests returned from
[buildGetAppLocationsListRequest](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/request/factory/LocationRequestFactory.html#buildGetAppLocationsListRequest(long,%20android.location.Location)),
the web service will return link headers pointing to the next page. If the status of the
[LevelUpResponse](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/LevelUpResponse.html)
returned from the web service is
[LevelUpStatus.OK](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/LevelUpStatus.html#OK)
and
[LevelUpResponse.getHttpStatusCode](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/AbstractResponse.html#getHttpStatusCode())
returns HTTP 204, you have reached the last page of locations. For successful requests, the response
should be parsed with
[OrderJsonFactory](http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/factory/json/OrderJsonFactory.html).

