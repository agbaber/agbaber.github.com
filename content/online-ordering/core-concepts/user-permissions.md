---
title: "User Permissions"
navigation: 4
---

When a user wants to pay with LevelUp from within your e-commerce experience, you'll need an `access_token` from them. As described in the [Sample UX Flows section](/online-ordering/sample-ux-flows/levelup-as-payment/), there are a few ways that you could have received this `access_token`:

1. A user connected their LevelUp account to an existing site account

	a. <u>Online:</u> The user enters their email and your app posts to the User Permissions endpoint with the desired permissions. The user receives a push notification with details of the permission request and then accepts or rejects it. If they accept it, you will receive a callback with the access_token. You can also poll an endpoint to check for the access token.

	b. <u>Mobile:</u> The user is deeplinked into the LevelUp App with a URI including the desired permissions as parameters. The user is presented with a dialog detailing the permission requests and accepts or rejects them. If they accept, we will redirect to your application with the access_token.

2. A user logged in with LevelUp using the User Permissions endpoint

	a. <u>Online:</u> Same flow as described above.

	b. <u>Mobile:</u> Same flow as described above.

3. A user registered with LevelUp from your experience using the User Registration endpoint (Enterprise SDK only. Please email [enterprise@thelevelup.com](mailto:enterprise@thelevelup.com) for details.)

4. Your e-commerce engine is embedded in an app running the LevelUp SDK and an `access_token` is securely syndicated in session (Enterprise SDK only. Please email [enterprise@thelevelup.com](mailto:enterprise@thelevelup.com) for details.)

Once a user is authenticated, you'll have their `access_token` with the permissions that your app requested. This `access_token` will be used to read addresses, receive basic personal information, perhaps even read transaction history, and of course be able to charge the user.
