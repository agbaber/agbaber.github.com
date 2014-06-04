---
title: "Processing Transactions"
navigation: 2
---

When a consumer wants to pay with LevelUp, they will present a QR Code on their mobile device or physical card. This QR Code will be scanned by a LevelUp Scanner which is plugged into the POS. The POS should add a new tender button (LevelUp) that when pressed submits the QR Code data and the transaction details to LevelUp to process the transaction using the [orders endpoint](/api-reference/v14/orders-create/).

LevelUp will then return success if the transaction goes through successfully (as most do) or failure with a message about why that transaction can not be processed. The response objects can be viewed in more detail in the [API reference](/api-reference/). If it's successful, the transaction can then be closed out in the point-of-sale.

### Scanners
<img src="/images/scanner.jpg" alt="LevelUp Scanner" style="float:right;margin-left:30px;">
LevelUp produces custom LevelUp Scanners which are optimized to read LevelUp QR Codes from a mobile device. The scanners can be configured to act as another keyboard, or powered with a custom driver.
<br style="clear:both;" />

### QR Codes
<img src="/images/fake-qr-code.png" alt="LevelUp QR Code" style="float:right;margin-left:30px;">

The QR Code data will be transmitted from the scanner into the POS as an alphanumeric string. The QR Code data will always begin and end with "LU" as sentinels. It is roughly 32 characters in length, though that is not guaranteed and the LU...LU sentinels should be used for identification purposes.
<br style="clear:both;" />

### Scanning the QR Code
It is important that a consumer can scan their QR Code at any time during the transaction process. If your POS is capable of identifying and "caching" the QR Code at any time during the order then it should capture and store that QR code to apply payment to the current check. If your POS cannot "cache" the code, LevelUp Scanners come with an optional physical button that can be connected to the scanner.  If the physical button is connected, the QR Code will be cached in the scanner until the POS is ready to receive it, at which point the cashier can press the button to release the QR Code.

### Processing The Transaction
Once the transaction details have been fully entered in the point-of-sale and the cashier is ready to close out the transaction, you can process the order by hitting the [orders endpoint](/api-reference/v14/orders-create/) to create an order.

In order to process the transaction, you will send a number of attributes including: the customer's QR code data, the total sales price and the items in the order. For full details and formatting requirements see the [orders endpoint](/api-reference/v14/orders-create/) documentation in the API reference.

If it is successful, LevelUp will return a full [response object](/api-reference/v14/orders-create/) with additional information about the order. LevelUp will then also send a push notification and email receipt to the consumer. LevelUp users neither expect nor need a paper receipt, so save a tree and don't print one.

### Tips
Tips are set by the user on their mobile device and embedded into the QR Code. LevelUp will decode the tip amount server side and return the intended tip value in the response object from a successful transaction.
