---
title: 'Permissions .: Create'
navigation: 1
category: 'Permissions'
action: 'Create'
---

Create a Permissions Request
---

Create a Permissions Request to take actions on an account based on the permissions keynames that are requested.

### Request Endpoint

<div class="http-request">
  <span class="http-verb">POST</span> /v15/apps/permissions_requests
</div>

** NOTE: This is a v15 endpoint.  Our stable API version is v14.  v15 is our beta branch for exciting new features.**

### Authentication Required -- App Token

```
Authorization: token 123456-75489120749...
```

### Request Body

```json
   {
  "permissions_request": {
    "email": "guy@example.com",
    "permission_keynames": ["create_orders"]
  }
}
```

### Request Parameters

| Parameter              | Type   | Required | Description                                                                 |
|------------------------|--------|----------|-----------------------------------------------------------------------------|
|  `email`               | String | Yes      | The user's email address                                                    |
|  `permission_keynames` | String | Yes      | Array of [requested permissions](/getting-started/permissions-list/)        |

The request for permissions will be created and approved or declined by the user.  The result of the permission request will be POSTed back to your designated App Callback Url.  To set your App Callback Url, please [submit a support request](https://levelup.zendesk.com/hc/en-us/requests/new).



### Example Call

```bash
curl -iH 'Accept: application/json' -H 'Content-Type: application/json' -H  'Authorization: token 123456-d1af6099abe44f01f14690bfa423468f189a78326f1a8b45cdad817367f1f3c8' --request POST -d '{"permissions_request": {"email": "user@email.com", "permission_keynames": ["create_orders"]}}' https://api.thelevelup.com/v15/apps/permissions_requests
```

### Example Response

```json
{
    "permissions_request": {
        "app_id":102,
        "id":36,
        "permission_keynames":["create_orders"],
        "state":"pending"
    }
}

```

### Response Parameters

| Param                   | Type    | Description                                                               |
|-------------------------|---------|---------------------------------------------------------------------------|
| `app_id`                | Integer | The LevelUp App ID                                                        |
| `id`                    | Integer | The LevelUp permission request ID                                         |
| `permission_keynames`   | Array   | Types of permissions requested                                            |
| `state`                 | String  | State of request  (Will be pending until the user approves the request)   |

After this call, the user will receive a notifcation to approve the requested permissions to your app.  If they approve the app, the LevelUp API will POST a response to the URL of your choosing.  To set your App POST URL, [submit a support request](https://levelup.zendesk.com/hc/en-us/requests/new).  If you don't have an endpoint ready but still want to receive the responses, we recommend utilizing our [Permissions Request Show endpoint](/api-reference/v15/permissions-request-show/).

You will want to save the id of the permissions request as you will use it to identify the POST response from LevelUp when the user accepts the permissions request:

```json
{
    "permissions_request": {
        "id":38,
        "state":"accepted",
        "token":"123456-9a56559c71fd6fc3bb0766dceabe0b6a3ee6dba40c7e05d0ef2d4e45b4f5ae41"
    }
}
```

Once you recieve this POST, you can use the token to authenticate relevant requests for that account.