---
title: "Overview"
navigation: 1
---

LevelUp is, at its core, just another method of payment. This makes integrating LevelUp into any point-of-sale relatively straightforward. While LevelUp enables a lot of functionality beyond payments (such as loyalty programs, couponing, campaign tools, customer relationship management) all of that logic happens server-side within the LevelUp application, and not within the point-of-sale. This means that all of the complexity of those custom merchant campaigns is abstracted away from the point-of-sale, simplifying integration needs. In fact, LevelUp's interaction with the point-of-sale is purely that of processing a payment with a new tender type.

There are three main steps needed to integrate LevelUp into a point-of-sale system:

- [Configuring Merchants](/pos-integration/core-concepts/configuring-merchants/): Allow merchants to connect their LevelUp merchant account within your point-of-sale so that you can process transactions on behalf of that merchant account.
- [Processing Transactions](/pos-integration/core-concepts/processing-transactions/): Add a new LevelUp tender type and associated button to the UI for closing out a transaction. When that tender button is pressed, transactions should be sent to LevelUp (as opposed to a credit card processor) for processing.
- [Handling Refunds](/pos-integration/core-concepts/handling-refunds/): Store the UUID -- a universally unique identifier -- that LevelUp returns with each successful transaction -- within your POS so that if that transaction needs to be refunded, you can do so.

In this section, we've also included links to the relevant API calls, the transaction flow from the
consumer perspective, and some helpful FAQs. If you haven't yet, you should follow the instructions
in the [developer setup](/pos-integration/getting-started/developer-setup/) section to make sure you
have the necessary API Keys to begin development. Should you get stuck at any point along the way,
please reach out to us on our <a href="http://support.thelevelup.com/"
target="_blank">support website</a>.

Once your POS is integrated, let us know! We'll go through the [certification steps](/pos-integration/certification-residuals/overview/) together and then we'd love to feature
you on our <a href="https://www.thelevelup.com/pos-partners" target="_blank">point-of-sale partners
page</a>. We look forward to creating opportunities to work together to both introduce your point-
of-sale solution to our merchant base and introduce LevelUp to your merchant base, enabling you to
earn residuals through our [reseller program](/pos-integration/certification-residuals/overview/).
