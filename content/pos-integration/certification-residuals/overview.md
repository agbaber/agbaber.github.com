---
title: "Overview"
navigation: 1
---
## Point-of-Sale Integration Certification Requirements

In order to be considered a "Certified LevelUp Point-of-Sale Integration", your integration must meet a certain set of requirements. The goal of these requirements is to ensure that your point-of-sale integration is capable of operating seamlessly with the LevelUp platform and that prospective joint clients can use it with confidence.

### Benefits to having "Certified LevelUp Point-of-Sale Integration" status:

- You will be eligible for the LevelUp Residual Program which pays out 2.5% of our total revenue from merchants using your integration.
    - 50% of this goes to the part of the organization that maintains the integration
    - 50% goes to the part of the organization the services the client
- You will be featured on our <a href="https://www.thelevelup.com/pos-partners" target="_blank">Certified Point-of-Sale Integration Partner Page</a>
- You will be recommended to our clients looking for solutions in your category

*Please note that the Residual Program only applies to certified point-of-sale integrations.*

### Achieving "Certified LevelUp Point-of-Sale Integration" status:
<br>
**LevelUp as a “First Class” Payment Method:** LevelUp must be integrated and function the same as any other “First Class” Payment Method (i.e. Cash, Check, Credit).  There should be no material difference in functionality or value of LevelUp as compared to other tenders.  This includes robust, accurate, fast and fully functional tender, refund and business logic (analytical) processes. The <a href="https://docs.google.com/forms/d/1PYoT1yLOIONf_rY8eolvoJL-8uI400e_F7haA-s5gVg/viewform" target="_blank">LevelUp Quality Assurance Guide</a> should be used to test the range of functionality.

An abbreviated overview of required functionality from any certified integration is listed below:

<ol>
<li>Ability to complete a transaction with LevelUp by scanning a QR Code read by a LevelUp scanner connected to the point-of-sale terminal</li>
<li>Support for the standard LevelUp scanner connected via Bluetooth, USB, serial or other supported connection</li>
<li>Ability to refund said transaction (usually accomplished via a void/delete payment operation)</li>
<li>LevelUp's tender button should be placed in the same general proximity as the Cash and Credit Card tender types</li>
<li>Support for tips on LevelUp transactions embedded into the LevelUp QR Code</li>
<li>Support for displaying errors passed back from the LevelUp API in a clear and readable fashion to the cashier</li>
<li>Support for network retries (3 is recommended), if the first call fails to reach LevelUp</li>
</ol>

**SKU Data:** The integration must send detailed item data with all applicable orders as part of the LevelUp order payload. If SKU or UPC is unavailable, item name, charged price and quantity must be sent.

**Error Logging:** The integration should intelligently log errors to aid with debugging.

**Use Current API Version:** The integration must use the current version of the LevelUp API (presently 14). The upgrade window to remain compliant with the current spec is 90 days after LevelUp notifies partners of an upgrade to the API. If upgrade is not completed in 90 days, LevelUp reserves the right to withhold revenue sharing (if applicable). Required upgrades will not exceed three per year.

**Integration Documentation:** The integration must be well documented including installation, usage, troubleshooting/FAQs and support information. This documentation should be polished, clear, comprehensive, and kept up to date as the integration is modified and upgraded. Documentation should be shared with LevelUp as versioned releases coincident with integration release.

**Security:** No private or sensitive data should ever be logged or stored unencrypted. This includes but is not limited to logins, passwords, access tokens and QR codes.

**Support:** The integration shall be supported by the integrator in conjunction with LevelUp.  Customers, merchants value-added-resellers (VARs) should be directed to the relevant party for their support inquiry.  Support tickets should be handled expeditiously and known issues and fix ETAs should be shared with LevelUp for support purposes.

**Free to Enable:** There must be no additional charge specifically to enable/install the usage of LevelUp integration for the merchant or customer. Exceptions may include general licensing of interfaces but must not be specific to LevelUp.

**Free to Use:** There must be no additional charge specifically for use of LevelUp integration for the merchant or customer. Exceptions may include general licensing of interfaces but must not be specific to LevelUp.

**Assistance With Issues:** You agree to provide commercially reasonable and timely assistance to LevelUp, or our joint merchants, should they require help related to the integration.

**Data is Private:** All LevelUp data (including transaction data, customer data, analytics data) is private and shall not be shared, sold, or otherwise distributed without consent from LevelUp, merchant, and customer.

**Non-Interference:** The integration should not interfere with the regular operation of other components of the point-of-sale system. E.G. it should allow multiple scanners to be plugged in and it should not interfere with the usage of regular software keyboards.

**Easy-To-Enable:** The integration should be straightforward enough to enable that a merchant, with instructions, can enable it on their own without requiring any on-site assistance.

**Supported On Majority Of Versions:** In order to be considered certified, the integration must work on at least a majority of the currently supported versions of your point-of-sale system.

**Support Contact:** A valid support contact must be provided to LevelUp for speedy escalation of any client reported issues with the integration. 

**Outage/Alerts Notification:** pos-alerts@thelevelup.com should be added to your alerts/outage distribution list.

*To begin the process of becoming certified, contact the POS team via email at [pos-support@TheLevelUp.com](mailto:pos-support@thelevelup.com).*
