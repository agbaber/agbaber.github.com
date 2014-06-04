---
title: "Getting Started: Android"
navigation: 4
---
## Overview

The Android LevelUp SDK provides the basic building blocks you'll need to integrate LevelUp into
your app. Specifically, this provides classes which allow you to make requests to the LevelUp web
service and handle the results.  As there are many UI styles and preferences in the Android
community the SDK doesn't mandate using anything in particular.

While the SDK itself doesn't contain UI components, we don't want to leave you completely in the
cold. The [sample app][sample] provides a bare-bones implementation of a UI built on top of the
LevelUp SDK.

## Requirements

The LevelUp SDK is designed to work with the Android ant build system. Currently, only Eclipse and
Ant builds are supported, although we'll be adding support for Gradle as soon as it becomes more
stable.

The LevelUp SDK requires a number of libraries, all of which are included in the `libs/` folder as
`.jar` files.

The LevelUp SDK sample is dependent on the SDK library project. Instructions on setting up the
sample are below.

### API key

To use the LevelUp SDK, you will need to first get [a LevelUp API key][api-key].

## Installation

To get a good feel for how to use the SDK, first download the [SDK sample app][sample]. This will
walk you through the basics for logging in users, registering new users, and showing a payment
token.

It is recommended to get the latest SDK version by way of Git. If you're unfamiliar with Git, please
see the [GitHub Getting Started Guide][git-intro].

### Getting the SDK

The sample app contains everything you need to get up and running. The SDK itself is included by way
of a git submodule. You can have git automatically download and checkout the submodule by using the
`--recursive` option as shown below:

```bash
git clone --recursive git@github.com:TheLevelUp/levelup-sdk-sample-android.git
```

If you want to get just the SDK (without the sample), just do:

```bash
git clone git@github.com:TheLevelUp/levelup-sdk-android.git
```

### <a id="set-the-api-key"></a>Set the API key

Before any requests can be made, you need to set the API key via resource overlays. For those
unfamiliar with resource overlays, this is just a way of overriding an SDK-provided resource (the
stuff in `res/`) with your own.

In this case, the API key must be put in the `levelup_api_key` string resource.  An example of this
is in the [sample] in `doc/strings_api_keys.xml` which should be copied to the sample's
`res/values/` directory. This will be read by the [AccessTokenRequestFactory] when you build a
request.

```bash
cp doc/strings_api_keys.xml levelup-sdk-sample/res/values/
```

Then edit the strings file to add in the API key:

```bash
$EDITOR levelup-sdk-sample/res/values/strings_api_keys.xml
```

### Building the Sample with Eclipse

Open Eclipse (with the Android development environment installed) and go to `File → New → Other… →
Android Project from Existing Code`. Then select both the sample app in `levelup-sdk-sample-android`
and the SDK library project itself `levelup-sdk-android`.

Once built, run the `levelup-sdk-sample` app.

### Building the Sample with Ant

To compile the sample, do the usual:

```bash
cd levelup-sdk-sample/
ant debug install
```

If ant is having trouble finding your Android install, make sure your `ANDROID_HOME` environment
variable is set.

You may also wish to update your `local.properties` file by going into the sample project:


```bash
android update project --subprojects --target android-18 --path .
```

## Performing Requests

The LevelUp web service API is a RESTful HTTP API. The SDK provides a number of classes which can be
used in concert to perform requests. As there are a number of ways to manage background threads in
Android, the task of executing requests in the background is left up to the reader. The [sample]
provides a demonstration of using a [Loader] for this purpose.

### Sending Requests

Requests are made by using [request factories] to generate an [AbstractRequest]. These requests are
then sent to the web service using a [LevelUpConnection] which will return an instance of an
[LevelUpResponse].

At this stage, the `LevelUpResponse` should be checked for an [LevelUpStatus.OK] status code. If the
request was successful, [model JSON factories] can turn this response into a simple POJO [model]. If
there was an error performing the request, there are a few things that need to be checked.

### <a id="errors"></a>Handling Errors

When the response `Content-Type` header is set to `application/json`, the error messages can be
extracted from the response body using [ErrorJsonFactory]. This is usually returned on form
validation errors and includes information about which form field needs to be corrected.

Other status codes indicate various types of server/client errors and should be displayed to the
user appropriately.

If the status is [LevelUpStatus.LOGIN_REQUIRED], either an authenticated request needs to be made or
the user is no longer logged in (their access token has expired or been invalidated).

### <a id="authentication"></a>Authentication

Most requests need to be authenticated. Authentication is performed by logging in, which will
return an [AccessToken] that should be persisted until the server requests that it be revoked.
Generally, this means that the `AccessToken` should be stored in a private [SQLiteDatabase] or using
[SharedPreferences]. See the sample code for an example of persisting this using
`SharedPreferences`.

When implementing your own [AccessToken] storage mechanism, you must implement the
[AccessTokenRetriever] and [Parcelable] interfaces.


[source]: https://github.com/TheLevelUp/levelup-sdk-android
[sample]: https://github.com/TheLevelUp/levelup-sdk-sample-android
[library-projects]: https://developer.android.com/tools/projects/projects-eclipse.html
[api-key]: ../../../getting-started/sign-up/
[git-intro]: https://help.github.com/articles/set-up-git

[Loader]: https://developer.android.com/reference/android/content/Loader.html
[AccessTokenRequestFactory]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/request/factory/AccessTokenRequestFactory.html
[request factories]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/request/factory/package-summary.html
[AbstractRequest]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/AbstractRequest.html
[LevelUpConnection]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/LevelUpConnection.html
[LevelUpResponse]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/LevelUpResponse.html
[model JSON factories]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/factory/json/package-summary.html
[model]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/package-summary.html
[LevelUpStatus.OK]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/LevelUpStatus.html#OK
[ErrorJsonFactory]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/factory/json/ErrorJsonFactory.html
[LevelUpStatus.LOGIN_REQUIRED]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/LevelUpStatus.html#LOGIN_REQUIRED
[AccessToken]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/AccessToken.html
[SQLiteDatabase]: https://developer.android.com/reference/android/database/sqlite/SQLiteDatabase.html
[SharedPreferences]: http://developer.android.com/reference/android/content/SharedPreferences.html
[AccessTokenRetriever]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/AccessTokenRetriever.html
[Parcelable]: http://developer.android.com/reference/android/os/Parcelable.html
