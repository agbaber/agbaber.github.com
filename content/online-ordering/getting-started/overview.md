---
title: "Overview"
navigation: 1
---
Integrating LevelUp into an e-commerce ordering platform provides a number of benefits for both merchant and consumer. For consumers, it provides a simple, fast checkout experience with the ability to accrue/redeem rewards whether they pay in-store or online. For merchants, it means faster checkout (and less cart abandonment), cheaper payment processing and consistent data about customer interactions in-store and online enabling them to target campaigns to customers no matter where the sale is made.

There are a number of core ways to utilize LevelUp for your e-commerce site:

1. **LevelUp as a method of payment:** Users link LevelUp as a method of payment.

2. **LevelUp as method of login/payment:** Users log in with LevelUp (much like Log In with Facebook) which grants access the payment method, basic user and address info. This info can be used to populate checkout fields, reducing the need for users to key in their information.

3. **LevelUp as account of record:** Users log in with LevelUp, or register with LevelUp to pay and provide additional information such as shipping address. While your site might maintain a shadow account to track additional user activity, the primary account the user is exposed to is the LevelUp account. This is particularly useful for restaurants where the majority of the volume is in-store or for sites that don't yet have account infrastructures or don't feel the need to ask users to register at all.

LevelUp enables a lot of functionality beyond payments (such as loyalty programs, couponing, campaign tools, customer relationship management) all of that logic happens server-side within the LevelUp application, and not within the e-commerce checkout flow. This means that all of the complexity of those custom merchant campaigns is abstracted away from the e-commerce service, simplifying your integration needs. LevelUp does provide all the endpoints necessary to show customers what campaigns their order is triggering.

There are a few steps to integrating LevelUp into an e-commerce platform:

1. **Get Merchant Permissions:** Obtain an access_token to be able to facilitate orders on behalf of a LevelUp merchant account from your e-commerce site. If you're managing a platform for multiple merchants you'll want to provide a way for them to make this connection.

2. **Get User Permissions:** Enable users to log in with LevelUp or connect LevelUp to your e-commerce site so you can charge them, read their address and other information.

3. **Processing Transactions:** Once you have a user's access_token (after they grant permission), you can then read their basic info, get their available addresses, and of course, submit the orders to LevelUp for payment.

4. **LevelUp Responds:** LevelUp will respond with success or failure and an error message. If successful, LevelUp will pass back a UUID -- a universal unique identifier which you should store as that is what you can use to issue refunds later on.

We've also included in this section links to the relevant API calls and some helpful FAQs. If you haven't yet, you should follow the steps in the [Getting Started](/) section to make sure you have the necessary API Keys to begin development. Should you get stuck at any point along the way, please reach out to us via [support@thelevelup.com](mailto:support@thelevelup.com).

Once your e-commerce platform is integrated, let us know! We'd love to feature you on our [Partners Page](https://www.thelevelup.com/pos-partners) and explore ways to work together to introduce your services to our user and merchant base.