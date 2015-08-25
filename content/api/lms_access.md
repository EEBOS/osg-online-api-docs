---
title: LMS Access
---

## LMS Access

It is possible for your users to access our fully-featured LMS using their API credentials. A two-steps verification process is required:

1.
  Request a one-time use token

  `POST https://learninglogin.com/api/logins/request_token`

  Send a `POST` request to the URL above with the following parameters:

  | Name     | Type   | Required? | Description                                 |
  |----------|--------|-----------|---------------------------------------------|
  | username | string | yes       |                                             |            |
  | token    | string | yes       | Login token provided when login is created  |
  

2.
  Use the token to access the LMS

  `GET https://learninglogin.com/api/logins/authenticate`

  Send a `GET` request to the URL above with the following parameters:

  | Name     | Type   | Required? | Description                                 |
  |----------|--------|-----------|---------------------------------------------|
  | username | string | yes       |                                             |
  | token    | string | yes       | One-time use token generated in **step 1**  |

After step 2 is completed, you will be **redirected** to `https://learninglogin.com/en/inventories`

Once you access the LMS with your token, it **cannot be reused**. If your session is closed or expired, you will need to repeat this process in order to regain access to our LMS.