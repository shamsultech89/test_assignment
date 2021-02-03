# README

Follow the below steps to run the application:

* Install Ruby version 2.7.1

* Install the gems
  ```
  bundle
  ```

* Database creation
  ```
  rake db:create
  rake db:migrate
  ```

* Test cases is covered with Rspec
  ```
  rspec
  ```

*Api documentation

1. Get Auth token

```
curl -X POST https://arcane-ravine-30637.herokuapp.com/sessions.json -H "Content-Type:application/json" -d @request.body
```
Request body

```
{
  "email": "test@g.com",
  "password": "password"
}
```

Sample Response

```
{
    "user": {
        "id": 1,
        "username": null,
        "email": "test@g.com",
        "created_at": "2021-02-03T14:50:55.299Z",
        "updated_at": "2021-02-03T14:50:55.299Z"
    },
    "token": "abcede123ytr",
    "expires_in": 1612450356
}
```

2. Create Campaign

```
curl -X POST https://arcane-ravine-30637.herokuapp.com/campaigns.json  -H "Authorization:jsonwebtoken" -H "Content-Type:application/json" -d @request.body
```
Request body

```
{
  "campaign": {
    "title": "Test title now",
    "purpose": "Hello",
    "estimated_duration": "within_1_week",
    "tag_ids": [1,2]
  }
}
```

Sample Response

```
{
    "id": 1,
    "title": "Test title now",
    "purpose": "Hello",
    "estimated_duration": "within_1_week",
    "user_id": 1
}
```


3. Create discussion topic

```
curl -X POST https://arcane-ravine-30637.herokuapp.com/discussion_topics.json  -H "Authorization:jsonwebtoken" -H "Content-Type:application/json" -d @request.body
```
Request body

```
{
  "discussion_topic": {
    "title": "This is discussion topic",
    "campaign_id": 1
  }
}
```

Sample Response

```
{
    "id": 1,
    "title": "This is discussion topic",
    "campaign_id": 1,
    "user_id": 1,
    "created_at": "2021-02-03T15:05:29.756Z",
    "updated_at": "2021-02-03T15:05:29.756Z"
}
```

4. Create tag with sub tags

```
curl -X POST https://arcane-ravine-30637.herokuapp.com/tags.json  -H "Authorization:jsonwebtoken" -H "Content-Type:application/json" -d @request.body
```
Request body

```
{
  "tag": {
    "name": "Ruby",
    "sub_tags_attributes": [
      {
        "name": "Programming"
        }
    ]
  }
}
```

Sample Response

```
{
    "id": 1,
    "name": "Ruby",
    "tag_id": null,
    "created_at": "2021-02-03T15:00:59.687Z",
    "updated_at": "2021-02-03T15:00:59.687Z"
}
```


5. Add comment on Campaign

```
curl -X POST https://arcane-ravine-30637.herokuapp.com/comments.json  -H "Authorization:jsonwebtoken" -H "Content-Type:application/json" -d @request.body
```
Request body

```
{
  "comment": {
    "content": "This comment is on campaign",
    "commentable_type": "Campaign",
    "commentable_id": 1
  }
}
```

Sample Response

```
{
    "id": 2,
    "content": "This comment is on campaign",
    "user_id": 1,
    "commentable_type": "Campaign",
    "commentable_id": 1,
    "created_at": "2021-02-03T05:24:51.480Z",
    "updated_at": "2021-02-03T05:24:51.480Z"
}
```

6. Add comment on discussion topic

```
curl -X POST https://arcane-ravine-30637.herokuapp.com/comments.json  -H "Authorization:jsonwebtoken" -H "Content-Type:application/json" -d @request.body
```
Request body

```
{
  "comment": {
    "content": "This comment is on discussion topic",
    "commentable_type": "DiscussionTopic",
    "commentable_id": 1
  }
}
```

Sample Response

```
{
    "id": 2,
    "content": "This comment is on discussion topic",
    "user_id": 1,
    "commentable_type": "DiscussionTopic",
    "commentable_id": 1,
    "created_at": "2021-02-03T05:24:51.480Z",
    "updated_at": "2021-02-03T05:24:51.480Z"
}
```