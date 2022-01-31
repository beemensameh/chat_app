# Chat app

This app is a small exsample of chat app with Ruby on Rails with Mysql and elasticsearch

## Tech Stack

**Server:** Ruby v2.3.3, Rails v5.2.6

**Database:** Mysql v8.0

**Other integrated servce** Elasticsearch v7.16.3


## Installation

before you start steps you will need docker and docker compose for this. If you don't have, you need to install them first.

1. Just run these commands and the server will start automaticlly.

```bash
  $ docker-compose build
  $ docker-compose up
```

* If you have a tool can run make commands you can run this command instead of the previous one
```bash
  $ make docker-refresh
```

2. After the dockers start you can natigate to `127.0.0.1:3000` to see the app home page.
3. You will find a postman collection in the root directory in the project. Just import it and change the `{{base_url}}` in the environment.

## API Reference

### Application

#### Create application

```http
  POST /api/v1/applications
```


| Body   | Type     | Description                                               |
| :----- | :------- | :-------------------------------------------------------- |
| `name` | `string` | **Required**. The application name **(Should be unquie)** |

The Body
```json
{
    "name": "user"
}
```

#### Get application details

```http
  GET /api/v1/applications/${token}
```

| Parameter | Type     | Description                         |
| :-------- | :------- | :---------------------------------- |
| `token`   | `string` | **Required**. The application token |

### Chat

#### Create chat for specific application

```http
  POST /api/v1/applications/${token}/chats
```

| Parameter | Type     | Description                         |
| :-------- | :------- | :---------------------------------- |
| `token`   | `string` | **Required**. The application token |

#### Get list of chats for specific application

```http
  GET /api/v1/applications/${token}/chats
```

| Parameter | Type     | Description                         |
| :-------- | :------- | :---------------------------------- |
| `token`   | `string` | **Required**. The application token |

### Messages

#### Create message for specific chat

```http
  POST /api/v1/applications/${token}/chats/${chat_number}/messages
```

| Parameter     | Type      | Description                         |
| :------------ | :-------- | :---------------------------------- |
| `token`       | `string`  | **Required**. The application token |
| `chat_number` | `integer` | **Required**. The chat number       |


| Body      | Type     | Description                          |
| :-------- | :------- | :----------------------------------- |
| `content` | `string` | **Required**. The content of message |


The Body
```json
{
    "content": "My first message"
}
```

#### Get list of messages for specific chat

```http
  Get /api/v1/applications/${token}/chats/${chat_number}/messages
```

| Parameter     | Type      | Description                         |
| :------------ | :-------- | :---------------------------------- |
| `token`       | `string`  | **Required**. The application token |
| `chat_number` | `integer` | **Required**. The chat number       |

#### Filter on messages for specific chat

```http
  Get /api/v1/applications/${token}/chats/${chat_number}/messages?query=${query}
```

| Parameter     | Type      | Description                                       |
| :------------ | :-------- | :------------------------------------------------ |
| `token`       | `string`  | **Required**. The application token               |
| `chat_number` | `integer` | **Required**. The chat number                     |
| `query`       | `string`  | **Required**. The word that you want to search on |

## Screenshots

### Database desgin

![Database](https://user-images.githubusercontent.com/41084077/151868733-3346a94e-a51c-492f-9963-297fcd0c3302.png)

### API requests

#### Create application
![Screenshot from 2022-01-31 22-34-51](https://user-images.githubusercontent.com/41084077/151869308-de158480-75c7-4cb9-a5d4-ce09781b70ae.png)
#### Get application details
![Screenshot from 2022-01-31 22-35-06](https://user-images.githubusercontent.com/41084077/151869315-7e076559-8f1a-4d80-aaa9-c5c6aca2e129.png)
#### Create chat for specific application
![Screenshot from 2022-01-31 22-35-17](https://user-images.githubusercontent.com/41084077/151869317-f14b82a2-b102-4a5c-9faf-d2de0e948e7b.png)
#### Get list of chats for specific application
![Screenshot from 2022-01-31 22-35-57](https://user-images.githubusercontent.com/41084077/151869322-6cd77736-846c-4910-a95e-6d00a2344309.png)
#### Create message for specific chat
![Screenshot from 2022-01-31 22-37-10](https://user-images.githubusercontent.com/41084077/151869328-8d093897-1ffa-4ba7-bf86-36d8214fa0cd.png)
#### Get list of messages for specific chat
![Screenshot from 2022-01-31 22-37-33](https://user-images.githubusercontent.com/41084077/151869329-c943f1a2-896f-4ea2-8b93-635c1ff2d9ad.png)
#### Filter on messages for specific chat
![Screenshot from 2022-01-31 22-37-50](https://user-images.githubusercontent.com/41084077/151869332-42e87253-9529-454c-88d3-8aecc3ef2da6.png)
