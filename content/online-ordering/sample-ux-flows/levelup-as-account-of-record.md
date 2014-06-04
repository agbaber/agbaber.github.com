---
title: "LevelUp as Account of Record"
navigation: 3
---

Using LevelUp as your apps account of record can be thought of much like how many apps only offer Facebook Login. In that case, while your site still maintains an account, the account exposed to the user for login is always Facebook. Because LevelUp does not have as many users as Facebook (yet!) we also enable easy in-stream registration if you're going this route.

If the user already has an account, the login flow is exactly the same as described in the log in section. If the user does not have an account, the flow is as follows

### Online/In-App:

1. User is presented with a Log In With LevelUp or Join LevelUp button
2. If Log In is selected, the flow is the same as above. If Join LevelUp is selected, the user is shown a series of fields to add:

      a. First Name

      b. Last Name
      
      c. Email

3. You hit our [User Creation](/api-reference/v14/users-create/) endpoint with the information and we pass back an access_token with the default permissions.
4. Because LevelUp is not super useful without a method of payment attached, this `access_token` also lets you add one credit/debit card within the next 24 hours. After that time, they must use the LevelUp app or website to manage their payment methods.
5. The user receives an email from LevelUp inviting them to set a secure password and grab the LevelUp app for account management.

Please note that if you've purchased the Enterprise SDK, the account of record flow is different as the Enterprise SDK provides richer in-app account management capabilities for a more integrated experience. Please email [enterprise@thelevelup.com](mailto:enterprise@thelevelup.com) for more details.
