---
title: "Embedded Flow"
navigation: 4
---

You can embed your e-commerce or online ordering mobile experience into an app running the LevelUp SDK to create a seamless log-in/checkout experience. This experience is extremely compelling for the user:

- Open the app running the LevelUp SDK
- Press the tab that brings them to the in-app commerce section
- This section loads up your mobile-optimized e-commerce experience in an emdedded web-browser and passes along a limited use access\_token to auto log in the user and provide you with the ability to charge them for that order. We pass that access token as a URL parameter in the format: https://www.yourbaseurl.com/levelup/`access_token`
- The user creates their cart and proceeds to checkout like normal
- The user simply hits "Pay with LevelUp" and you hit the Create Orders endpoint with the access token securely syndicated to your mobile commerce site within the app

Right now, this user flow is only available for users of the LevelUp Enterprise SDK. If you're interested, please email [support@thelevelup.com](mailto:support@thelevelup.com).
