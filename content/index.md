---
title: API
---


## What is the OLE LMS API?

The OLE LMS API is a complete programmable interface to all LMS functionality. All resources are exposed through RESTful URLS.


## What can you do with it?

Assigning courses, creating users, accessing reports. There are quite a number of features we support! Use the left-hand menu to navigate through all the available endpoints for more information.

## How do I get started?

In order to interact with our API, you’re required to include an authentication token in the header of every request. This API key will be provided to you by Online Learning Enterprises.


For example, to retrieve the list of users under your company, you can make the following request via `curl`:

```
curl http://learninglogin.com/api/users -H 'Authorization: Token token="TOKENHERE"'
```

If your authentication token is not correct, you will receive a “HTTP Token: Access Denied” response.

All of our API responses are sent in `JSON`.

# Services

* [Logins](/api/logins/index.html)
* [Courses](/api/courses/index.html)
* [Inventories](/api/inventories/index.html)
* [Train Sessions](/api/train_sessions/index.html)
* [LMS Access](/api/lms_access/index.html)
