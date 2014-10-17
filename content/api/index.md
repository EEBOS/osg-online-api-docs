---
title: API
---

# API

In order to interact with our API, you're required to include an authentication token in the header of every request; this token will be provided to you by your distributor.

For instance, to retrieve the list of users from your account, you can make the following request via `curl` command.

```
curl http://learninglogin.com/api/users -H 'Authorization: Token token="aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"'
```

In case you receive a `HTTP Token: Access denied.` response, there's a big chance your access token is either expired or wrong.

All of our API endpoints' responses are in `JSON` format.

# Services

* [Users](/api/users/index.html)
* [Courses](/api/courses/index.html)
