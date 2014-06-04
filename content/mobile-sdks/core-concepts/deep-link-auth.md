---
title: "Deep Link Auth"
navigation: 1
---

Deep Link Authorization provides a means of obtaining an access token without requiring the user's
email or password. Instead an app-switching model is used.

The user is deep linked from the requesting mobile app into LevelUp's app, where they are presented
with a dialog describing the list of
[permissions](http://developer.thelevelup.com/getting-started/permissions-list/) being requested.
After responding to the request, the user is returned into the requesting app.

## iOS

Use [LUDeepLinkAuth](http://thelevelup.github.io/levelup-sdk-ios/Classes/LUDeepLinkAuth.html)
to initiate Deep Link Auth requests and to handle their responses.

In order to facilitate the full authorization flow, your app must be configured with a custom URL
scheme as described in "Implementing Custom URL Schemes" in Apple's
[iOS Programming Guide][a-iOS-Programming-Guide].

In addition, when you [sign up](http://developer.thelevelup.com/getting-started/sign-up/) for the
LevelUp Developer Platform please provide your app's bundle ID and URL scheme in order to verify
valid Deep Link Auth requests.

## Android

Coming soon!

[a-iOS-Programming-Guide]: https://developer.apple.com/library/ios/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/AdvancedAppTricks/AdvancedAppTricks.html#//apple_ref/doc/uid/TP40007072-CH7-SW50
