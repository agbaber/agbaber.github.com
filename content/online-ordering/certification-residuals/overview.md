---
title: "Overview"
navigation: 1
---
## Online Ordering Integration Certification Requirements

In order to become a Certified LevelUp Online Ordering Integration Partner, your integration must meet a set of requirements. The goal of these requirements is to ensure that your integration is capable of operating seamlessly with the LevelUp platform and that prospective joint clients can use it with confidence.

### Benefits to having an integration reach "Certified LevelUp Online Ordering Integration" status:

- Access to our dedicated online ordering merchant support team.
- Eligibility to participate in our referral program outlined on our <a href="https://www.thelevelup.com/resellers" target="_blank">resellers page</a>
- You will receive a 2.5% residual for all revenue earned by orders processed through your platform

### Achieving "Certified LevelUp Online Ordering Integration" status:
<br>
**LevelUp as a “First Class” Payment Method:** LevelUp must be integrated and function the same as any other “First Class” Payment Method (e.g. Debit, Credit, Paypal).  There should be no material difference in functionality or value of LevelUp as compared to other tenders.  This includes robust, accurate, fast and fully functional tender, refund and business logic (analytical) processes. The <a href="https://docs.google.com/a/scvngr.com/forms/d/1PvWYUXugtOctTktPpaWx_7sBoY4Luw9FC0tzsU-MQnw/viewform" target="_blank">LevelUp Quality Assurance Guide</a> should be used to test the range of functionality.

An abbreviated overview of required functionality from any certified integration is listed below:

<ol>
<li>Ability to pay with LevelUp by entering an email address in the payment field</li>
<li>Ability to refund said transaction (usually accomplished via a void/delete payment operation by the merchant)</li>
<li>LevelUp's tender button should be placed in the same general proximity as Credit/Debit Card tender types</li>
<li>Support for displaying errors passed back from the LevelUp API in a clear and readable fashion to the relevant maintainer of the web application</li>
<li>Support for displaying errors passed back from the LevelUp API in a clear and readable fashion to the website user</li>
<li>Support for network retries (3 is recommended), if the first call fails to reach LevelUp</li>
</ol>

**SKU Data:** The integration must send detailed item data with all applicable orders as part of the LevelUp order payload. If SKU or UPC is unavailable, item name, charged price and quantity must be sent.

**Error Logging:** The integration should intelligently log errors to aid with debugging as needed.

**Use Current API Version:** The integration must use the current version of the LevelUp API. The upgrade window to remain compliant with the current spec is 90 days after LevelUp notifies partners of an upgrade to the API. If upgrade is not completed in 90 days, LevelUp reserves the right to withhold revenue sharing (if applicable). Required upgrades will not exceed three per year.

**Integration Documentation:** The integration must be well documented, including configuration, usage, troubleshooting/FAQs and support information, which should be included in merchant's FAQs. This documentation should be polished, clear, comprehensive, and kept up to date as the integration is modified and upgraded. Documentation should be shared with LevelUp as versioned releases coincident with integration release.

**Security:** No private or sensitive data should ever be logged or stored unencrypted. This includes but is not limited to logins, passwords, and access tokens.

**Support:** The integration shall be supported by the integrator in conjunction with LevelUp.  Customers, merchants and value-added-resellers (VARs) should be directed to the relevant party for their support inquiry.  Support tickets should be handled expeditiously and known issues and fix timelines should be shared with LevelUp for support purposes.

**Free to Enable:** There must be no additional charge specifically to enable/install the usage of LevelUp integration for the merchant or customer. Exceptions may include general licensing of interfaces but must not be specific to LevelUp.

**Free to Use:** There must be no additional charge specifically for use of LevelUp integration for the merchant or customer. Exceptions may include general licensing of interfaces but must not be specific to LevelUp.

**Assistance With Issues:** You agree to provide commercially reasonable and timely assistance to LevelUp, or our joint merchants, should they require help related to the integration.

**Data is Private:** All LevelUp data (including transaction data, customer data, analytics data) is private and shall not be shared, sold, or otherwise distributed without consent from LevelUp, merchant, and customer.

**Easy-To-Enable:** The integration should be straightforward and stable enough to be enabled on a merchant-by-merchant basis.

**Supported On Major Browsers:** In order to be considered certified, the integration must work on all browsers supported by the website.

**Support Contact:** A valid support contact must be provided to LevelUp for speedy escalation of any client reported issues with the integration. 

**Outage/Alerts Notification:** Please add pos-alerts@thelevelup.com to your alerts/outage distribution list.

*To begin the process of becoming certified, contact the POS team via email at [pos-support@TheLevelUp.com](mailto:pos-support@thelevelup.com).*
