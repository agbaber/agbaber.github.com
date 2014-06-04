---
title: 'QR Codes .: Get'
navigation: 1
category: 'QR Codes'
action: 'Get'
---

Get a user's QR Code (Payment Token)
---

This endpoint allows you to get a currently valid QR Code for a user.  To see a user's QR Code, you must have a user access token with the `read_qr_code` permission.

Tips can either be formatted as an amount in cents or as a percentage.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v15/qr_codes
</div>

**NOTE: This is a v15 endpoint. Our stable API version is v14. v15 is our beta branch for exciting new features.**


### Authentication Required -- User Token in Header

```
Authorization: token user="123456-75489120749..."
```

### Request URL Format
```
/qr_codes?preferences[color]=0&preferences[tip_amount]=0&preferences[tip_percent]=0
```

### Request Parameters
| Parameter                         | Type    | Required | Description                                                             |
|-----------------------------------|---------|----------|-------------------------------------------------------------------------|
|  `preferences[color]`             | Integer | Yes      | The desired color to be displayed when scanned into a LevelUp Scanner   |
|  `preferences`<br>`[tip_amount]`  | Integer | No       | The desired tip amount as an integer number of cents                    |
|  `preferences`<br>`[tip_percent]` | Integer | No       | The desired tip amount as an integer percent (max 100)                  |

### Available Colors
| Color            | Number   <TH> Example </TH>                          |
|------------------|------------------------------------------------------|
| Soothing Green   | 0       <TD style="background:#00FF00 !important;"/> 
| Atomic Lime      | 1       <TD style="background:#BAFF48 !important;"/>    
| Tango Red        | 2       <TD style="background:#FF0002 !important;"/>    
| Galactic Blue    | 3       <TD style="background:#0030F8 !important;"/>    
| Purple Haze      | 4       <TD style="background:#7800F7 !important;"/>    
| Yellow Submarine | 5       <TD style="background:#FFFC48 !important;"/>    
| Arctic Teal      | 6       <TD style="background:#00E4FD !important;"/>    
| Sick Flamingo    | 7       <TD style="background:#FF00C6 !important;"/>    
| Mint Julep       | 8       <TD style="background:#00FF84 !important;"/>    
| Ninja Orange     | 9       <TD style="background:#FF721C !important;"/>    


### cURL Example
```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json -H Authorization:token user="123456-75489120749..." https://api.thelevelup.com/v15/qr_codes?preferences[color]=0&preferences[tip_percent]=10
```

### Example Response

```json
{
  qr_code: {
    code: "LU02000..."
  }
}
```

### Response Parameters

| Parameters                  | Type       | Description                                      |
|-----------------------------|------------|--------------------------------------------------|
|  `code`                     | String     | The user's current payment token (QR Code) data. |


### Errors
`HTTP/1.1 error 422 Unprocessable Entity` - Tip was more than spend or over 100%

```json
[{
    "error": {
        "message": "Payment preferences are invalid",
        "object": "qr_code",
        "property": "base"
    }
}]
```