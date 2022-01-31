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

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)

### API requests
