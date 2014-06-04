---
title: "Register"
navigation: 2
---

To use LevelUp, users must either [login] or register for a new account.  Once registered, they must
[login][] (though it's probably a good idea to log them in automatically using the credentials they
provided in the register form) and [add a credit card][cc] (if they don't have one added to their
account) before they can make a payment.

## iOS

Users are represented by the
[LUUser](http://thelevelup.github.io/levelup-sdk-ios/Classes/LUUser.html) class. Any properties
which are not readonly can be changed via the API. Use
[LUUserRequestFactory](http://thelevelup.github.io/levelup-sdk-ios/Classes/LUUserRequestFactory.html)
to create and update users.

## Android

New users are registered by supplying the necessary account details to
[UserRequestFactory#buildRegisterRequest()][a-UserRequestFactory_register]. If there's an error
registering the user, it can be extracted using an [ErrorJsonFactory][a-ErrorJsonFactory]. See
[Getting Started: handling errors][a-errors] for more information.

A successful registration response should be parsed into a [User][a-User] using a
[UserJsonFactory][a-UserJsonFactory].

[login]: ../login/
[cc]: ../manage-cards/
[a-errors]: ../../getting-started/android/#errors
[a-User]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/User.html
[a-UserRequestFactory_register]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/net/request/factory/UserRequestFactory.html#buildRegisterRequest%28java.lang.String,%20java.lang.String,%20java.lang.String,%20java.lang.String,%20Location%29
[a-ErrorJsonFactory]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/factory/json/ErrorJsonFactory.html
[a-UserJsonFactory]: http://thelevelup.github.io/levelup-sdk-android/com/scvngr/levelup/core/model/factory/json/UserJsonFactory.html
