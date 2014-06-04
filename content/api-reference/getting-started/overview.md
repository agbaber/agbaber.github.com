---
title: 'Requests & Responses'
navigation: 1
---

The LevelUp API exposes the core aspects of our business to you. As a developer, you can use our endpoints to get information about users, merchants and campaigns, perform LevelUp transactions, view analytics and more.

## Making requests

All API requests should be made to `https://api.thelevelup.com`. So to [acquire an access token](/api-reference/v14/access-tokens-create/), for example, you'll make a request to `https://api.thelevelup.com/v14/access_tokens`.

### Authentication

Each authenticated request must include an Authorization HTTP header, with a type of `token` followed by the OAuth token:

`Authorization: token 2-3393f3ad53f668e9c0b55acdadb9d725500132ddb2896d548cb8fce43f460e7a`

If you supply an incorrect access token, or do not supply one at all, and make a request to an endpoint which requires authentication, you will receive a `401 Unauthorized` response from the server, along with a `WWW-Authenticate` header describing the error:

`WWW-Authenticate: OAuth2 realm="levelup", error="invalid_token"`

### Content types

All requests must use the `Accept` and `Content-Type` HTTP headers to negotiate content type. For most API requests, you’ll want a JSON-encoded response, and so you’ll use the following header:

`Accept: application/json`

There is no support in API v14 for specifying content type by appending an extension to the request URI.

### HTTP status codes

The following HTTP status codes are returned by the API:

| HTTP Status Code           | Reason                                   |
|----------------------------|------------------------------------------|
| `200 OK`                   | The request was processed without error. |
| `304 Not Modified`         | The resource has not been modified since the version specified by the request's `If-Match` header. |
| `400 Bad Request`          | The request contained invalid, unparseable JSON. |
| `401 Unauthorized`         | Authentication was incorrect. |
| `404 Not Found`            | The requested resource does not exist. |
| `406 Not Acceptable`       | The server doesn't support the format requested in the `Accept` header. |
| `422 Unprocessable Entity` | A validation error occurred because of invalid input. The client should look for errors in the response body for details. |
| `501 Not Implemented`      | The server is unable to fulfill the request because the client is outdated. |
| `503 Service Unavailable`  | LevelUp is undergoing maintenance or is otherwise unavailable. |

## Errors

### Error objects

Errors are returned as an array of one or more error objects. Each error object may contain the following keys:

| Key        | Presence | Description |
|------------|----------|-------------|
| `object`   | Optional | The object to which this error applies, e.g. `"credit_card"`. |
| `property` | Optional | The property of object to which this error applies, e.g. `"first_name"`. |
| `message`  | Required | A human-readable error message, e.g. `"First name is required"`. |

### Example

An example error response might look like this:

`HTTP/1.1 422 Unprocessable Entity`

```json
[{
  "error": {
    "object": "user",
    "property": "first_name",
    "message": "First name is required"
  }
}, ...]
```

In this document, example error responses are included with many endpoints. The list is not exhaustive, however. You may encounter more mundane errors, such as "cannot be blank", for request parameters marked as "required".
