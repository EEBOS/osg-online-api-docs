---
title: Train Sessions
---


## Train Sessions

The `/api/train_sessions/{ train_session_id }` endpoint implements RESTful methods to let you interact with your data.

### List

To retrieve the list of train sessions available for your account, simply send a `GET` request to the base endpoint, you can pass a series of filters to refine your search

`GET https://learninglogin.com/api/train_sessions`



#### Sample response body

~~~json

[
  {"id"=>3,
  "score"=>0,
  "percent_complete"=>0,
  "failed_attempts"=>0,
  "status"=>"Assigned",
  "cert_expiry"=>nil,
  "completion_date"=>nil,
  "complete_by"=>nil,
  "full_name"=>"Michelle Dragsta",
  "time_spent"=>nil},
 {"id"=>2,
  "score"=>0,
  "percent_complete"=>0,
  "failed_attempts"=>0,
  "status"=>"Assigned",
  "cert_expiry"=>nil,
  "completion_date"=>nil,
  "complete_by"=>nil,
  "full_name"=>"Michelle Dragsta",
  "time_spent"=>nil},
 {"id"=>1,
  "score"=>0,
  "percent_complete"=>0,
  "failed_attempts"=>0,
  "status"=>"Assigned",
  "cert_expiry"=>nil,
  "completion_date"=>nil,
  "complete_by"=>nil,
  "full_name"=>"Michelle Dragsta",
  "time_spent"=>nil}
]

~~~

#### Available search filters

To create a new login, send a `POST` request to the base logins' endpoint with the following parameters:

| Name                             | Type   | Description                                        |
|----------------------------------|--------|----------------------------------------------------|
| course_code_or_course_name_cont  | string | Filter by course code or course name               |
| full_name_cont                   | string | Filter by full name                                |
| score_eq                         | string | Filter by score                                    |
| completion_date_gteq             | string | Filter by completion date after than provided      |
| completion_date_lteq             | string | Filter by completion date before than provided     |
| cert_expiry_gt                   | string | Filter by certificate expiry date after            |
| cert_expiry_lt                   | string | Filter by certificate expiry before than           |
| percent_complete_eq              | string | Filter by percentage of completeness               |
| complete_by_eq                   | string | Filter by Completed by                             |
| last_attempt_eq                  | string | Filter by last attempt                             |
| assignee_login_username_eq       | string | Filter by assignee username                        |
| failed_attempts_eq               | string | Filter by failed attempts                          |
| unit_unit_expiry_gt              | string | Filter by unit expity after                        |
| unit_unit_expiry_lt              | string | Filter by unit expiry before                       |


### Show

To retrieve a specific train session send a `GET` request to:

`GET https://learninglogin.com/api/train_sessions/train_session_id`

