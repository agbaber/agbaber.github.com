---
title: "Login"
navigation: 2
---

Logging in on LevelUp is done by sending a username and password to retrieve a long-lived access
token. This access token should then be persisted until it's expired, invalidated, or the user
decides to log out.

Once logged in, it's usually helpful to get the user's info. This is retrieved by taking the user ID
returned in the access token request and requesting the details of that user.

## iOS

The access token is represented by the
[LUAccessToken](http://thelevelup.github.io/levelup-sdk-ios/Classes/LUAccessToken.html) class. Use
[LUAuthenticationRequestFactory](http://thelevelup.github.io/levelup-sdk-ios/Classes/LUAuthenticationRequestFactory.html)
to create requests to authenticate.

## Android

To retrieve an [AccessToken][a-AccessToken], pass a username and password to
[AccessTokenRequestFactory][a-AccessTokenRequestFactory]. Upon success, the result of this request
can be parsed into an [AccessToken][a-AccessToken] using an
[AccessTokenJsonFactory][a-AccessTokenJsonFactory].

You'll need to implement an [AccessTokenRetriever][a-AccessTokenRetriever] in order to be able to
make authenticated requests. See [Getting Started: Authentication][a-authentication] for more
details on this.

The [AccessToken][a-AccessToken] also contains the logged-in user’s ID. Make sure that this is also
persisted, as it’s needed to update and retrieve user profile information. To get user profile
information, pass the stored user ID to a [UserRequestFactory][a-UserRequestFactory] to retrieve the
[User][a-User] from the LevelUp web service.

[a-AccessToken]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/AccessToken.html
[a-AccessTokenRequestFactory]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/request/factory/AccessTokenRequestFactory.html
[a-AccessTokenJsonFactory]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/factory/json/AccessTokenJsonFactory.html
[a-AccessTokenRetriever]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/AccessTokenRetriever.html
[a-UserRequestFactory]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/request/factory/UserRequestFactory.html
[a-authentication]: ../../getting-started/android/#authentication
[a-User]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/User.html
