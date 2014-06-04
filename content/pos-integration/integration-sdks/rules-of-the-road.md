---
title: "Rules of the Road"
navigation: 2
---
Applications and integrations built using the LevelUp SDK should emphasize speed, ease of use,
security, and fault-tolerance.

## Keep the user's information safe
Never store usernames, passwords, or LevelUp QR data. The username and password should be used only
to obtain an access token, then discarded. The LevelUp QR data should be used to complete an order
transaction before being discarded as well. Access tokens may be saved but represent the user's
identity so encrypting them is a very good idea.

## Keep the user informed
You should always provide complete, detailed, human-readable error messages should something go
wrong and need to be displayed to the user. Please also save a log of all important information,
including errors, in case further debugging is necessary.

For more detailed do's and don'ts (along with a healthy dose of legalese) please see our
[Platform Rules of the Road](/getting-started/rules-of-the-road/) and <a
href="https://www.thelevelup.com/developer-terms/" target="_blank">Developer Terms & Conditions</a>.
