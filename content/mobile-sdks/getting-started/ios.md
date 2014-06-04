---
title: "Getting Started: iOS"
navigation: 3
---

## Installation

There are two ways to install the LevelUp SDK: CocoaPods, and a pre-compiled framework.

### CocoaPods

The recommended way to access the LevelUp SDK is through [CocoaPods](http://cocoapods.org/). If
you've never used CocoaPods before, install it by running:

```bash
$ gem install cocoapods
$ pod setup
```

LevelUp uses a private CocoaPods repo for the SDK. Once you've been accepted for access to the SDK,
you will be given access to private GitHub repositories for the SDK as well as a CocoaPods repo. To
add the CocoaPods repo, run:

```bash
pod repo add levelup git@github.com:TheLevelUp/Specs.git
```

To add the SDK as a dependency in your project, edit a text file called Podfile in your Xcode
project directory:

```ruby
platform :ios, '6.0'
pod 'LevelUpSDK'
```

To install the SDK:

```bash
pod install
```

If your project doesn't have an Xcode workspace, one will be created. Be sure to open this workspace
file and not your project file when working on your app.

### Framework

You can also install the LevelUp SDK using a precompiled framework. This framework contains the SDK
as well as all of its dependencies. All classes and other symbols of the dependencies have been
namespaced, which means you can use different versions of the SDK's dependencies without having
any build conflicts.

Installation instructions:

1. Visit our [releases](https://github.com/TheLevelUp/levelup-sdk-ios/releases) page and download
"LevelUpSDK.embeddedframework.zip" from the latest release.
1. Unzip "LevelUpSDK.embeddedframework.zip".
1. Open your project in Xcode, and drag "LevelUpSDK.embeddedframework" into the Project Navigator.
Make sure "Create groups for any added folders" is selected, and "Copy items into destination
group's folder" is checked:
<img src="/images/ios-framework-install.png" alt="LevelUp App" style="margin:10px;">
1. Ensure that the following frameworks are added to your project: AVFoundation, CoreData,
CoreGraphics, CoreLocation, CoreMedia, CoreVideo, ImageIO, MobileCoreServices, QuartzCore, Security,
and SystemConfiguration. You can do this by selecting your project file, selecting your build target,
and selecting the "Build Phases" tab. Under "Link Binary With Libraries", press "+" and add each
framework.
1. Import the main header file in your code:

```objective-c
#import <LevelUpSDK/LevelUpSDK.h>
```

## Performing Requests

Interactions with the LevelUp API occur through the
[LUAPIClient](http://thelevelup.github.io/levelup-sdk-ios/Classes/LUAPIClient.html) class. This is a
singleton class through which all requests are performed.

Before issuing any requests, you must register an App ID and API key and specify if you would like
to run requests against LevelUp's sandbox server or production server. This is done using the
`setupWithAppID:APIKey:developmentMode:` method:

```objective-c
[[LUAPIClient sharedClient] setupWithAppID:APP_ID APIKey:API_KEY developmentMode:NO];
```

Only set `developmentMode:YES` if you've been explicitly given access to our sandbox by LevelUp;
otherwise you'll get a `Client is invalid` error.

An API request is an instance of
[LUAPIRequest](http://thelevelup.github.io/levelup-sdk-ios/Classes/LUAPIRequest.html). The SDK
includes a set of request factories in order to create these requests.

Requests are performed by calling `performRequest:success:failure:`:

```objective-c
LUAPIRequest *request = [LUUserRequestFactory requestForCurrentUser];
[[LUAPIClient sharedClient] performRequest:request
                                   success:^(LUUser *user, LUAPIResponse *response) {
                                     NSLog(@"Retrieved user: %@", user);
                                   }
                                   failure:^(NSError *error) {
                                     NSLog(@"Error while retrieving user: %@");
                                   }];
```

When the API call is successful, the `success` block will be called, and will be passed two
parameters. The first is the result. This result differs for each call; for example, a request for
the current user returns an `LUUser`, while a request for nearby locations would return an `NSArray`
of `LULocation` objects. The documentation for each request factory specifies the result which will
be returned. The second parameter to the success block is an instance of `LUAPIResponse`.

## Authentication

When a user logs in, an access token is provided along with the user's ID. `LUAPIClient` needs to be
given these values so that it can be included in API calls which require an authenticated user.

The application is responsible for securely storing these values so that when the application
launches, users will remain logged in. As part of launching your application, you may set these
values using the `accessToken` and `currentUserID` properties of the `LUAPIClient` singleton object:

```objective-c
[LUAPIClient sharedClient].accessToken = myPersistedAccessToken;
[LUAPIClient sharedClient].currentUserID = myPersistedUserId;
```

## Errors

If an API request fails, an `NSError` instance will be passed to the `failure` block. This `NSError`
instance will have the domain `LUAPIErrorDomain`, and one of several possible codes:

 - `LUAPIErrorLoginRequired`: The client must be logged in to complete the request.
 - `LUAPIErrorMaintenance`: The server is currently down for maintenance.
 - `LUAPIErrorNetwork`: Was unable to get to the server because the network is down.
 - `LUAPIErrorParsing`: The server responded with JSON that couldn't be parsed.
 - `LUAPIErrorServer`: The server responded with an error.
 - `LUAPIErrorUpgrade`: The SDK needs to be upgraded.

In addition, the `userInfo` dictionary has keys for several pieces of information:

 - `LUAPIErrorKeyAPIErrors`: An optional array of
   [LUAPIError](http://thelevelup.github.io/levelup-sdk-ios/Classes/LUAPIError.html) objects
   returned by the server.
 - `LUAPIErrorKeyErrorMessage`: An optional error message from the server. If multiple errors were
   returned, this will only contain the first message. `LUAPIErrorKeyAPIErrors` can be used to see
   all errors.
 - `LUAPIErrorKeyJSONResponse`: An optional JSON response from the server.
 - `LUAPIErrorKeyOriginalError`: If this error was generated from another `NSError`, it is included
   under this key.
 - `LUAPIErrorKeyURLResponse`: An `NSURLResponse` containing the response.

## Sample

To see how an app can handle requests, authentication, and errors, check out our [sample
app](https://github.com/TheLevelUp/levelup-sdk-sample-ios) for the LevelUp SDK on iOS.
