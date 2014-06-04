---
title: 'Users .: Custom Attributes'
navigation: 1150
category: 'Users'
action: 'Custom Attributes'
---
Custom User Attributes
---

Custom user attributes are a way to associate arbitrary key-value data with a specific user and
OAuth client, the idea being that different LevelUp apps (white label, for example) will use
different OAuth clients, and will therefore be able to read and write their own quarantined custom
user attributes without access to other apps’ attributes.

Custom attributes are a one-level key-value dictionary. The database stores and returns all values
as strings, so you are responsible for any client-side marshaling and serialization. To read custom
user attributes, look at the `custom_attributes` key when using the endpoint described in section
“[Show a user](/api-reference/v14/users-show)”. To write custom user attributes, set the `custom_attributes` key to a
dictionary of keys and values when using the endpoint described in “[Update a user](/api-reference/v14/users-update)”.

Note that attribute updates are merged with client precedence. This means that keys sent by the
client will overwrite existing keys of the same name stored on the server. This behavior is
illustrated in the following example.

<div class="http-request">
  <span class="http-verb">GET</span> /v14/users/1
</div>

```json
{
  ...,
  "custom_attributes": {
    "foo": "bar",
    "baz": "qux"
  },
  ...
}
```

<div class="http-request">
  <span class="http-verb">PUT</span> /v14/users/1
</div>

```json
{
  ...,
  "custom_attributes": {
    "foo":  "buz",
    "honk": "blat"
  },
  ...
}
```

<div class="http-request">
  <span class="http-verb">GET</span> /v14/users/1
</div>

```json
{
  ...,
  "custom_attributes": {
    "foo":  "buz",
    "baz":  "qux",
    "honk": "blat"
  },
  ...
}
```
