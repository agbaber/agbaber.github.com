---
title: 'Orders .: List by App'
navigation: 800
category: 'Orders'
action: 'List by App'
---

List Orders Placed Using a Specific App
---

This endpoint returns a list of orders placed by the current user, using the specified app. The response includes user-oriented data, as opposed to merchant-oriented data. If the app is considered “global”, this endpoint returns all orders placed at any merchant.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">GET</span> /v14/apps/:id/orders
</div>

### Authentication Required -- User Token in Header

```
Authorization: token 123456-75489120749...
```

### Request Parameters

| Param  | Type            | Required | Description                       |
|--------|-----------------|----------|-----------------------------------|
| `id`   | Integer         | Yes      | The app's ID                      |
| `page` | Integer or null | No       | Page number of results to return. |


### cURL Example
```bash
curl -X GET -H Accept:application/json -H Content-Type:application/json -H Authorization:"token 123456-75489120749..." https://api.thelevelup.com/v14/apps/1/orders
```

### Example Response

`HTTP/1.1 200 OK`

```json
[{
  "order": {
		bundle_closed_at: null
		bundle_descriptor: "LevelUp*NedsFalafel"
		contribution_target_name: null
		created_at: "2014-05-05T12:33:41-04:00"
		location_id: 3796
		location_extended_address: "Ste 400"
		location_locality: "Boston"
		location_postal_code: "02110"
		location_region: "MA"
		location_street_address: "1234 Main St"
		merchant_id: 1234
		merchant_name: "Ned's Falafel Shop"
		refunded_at: null
		transacted_at: "2014-05-05T12:33:41-04:00"
		uuid: "a209dd40b6a001318b26125276c82bfa"
		balance_amount: 0
		contribution_amount: null
		credit_applied_amount: 10
		credit_earned_amount: 0
		spend_amount: 10
		tip_amount: 0
		total_amount: 10
	}
}, ...]
```
