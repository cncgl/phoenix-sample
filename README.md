# phoenix-todo

A todo application for Phoenix on elixir

[![Build Status](https://travis-ci.org/cncgl/phoenix-todo.svg?branch=master)](https://travis-ci.org/cncgl/phoenix-todo)




## Install Dependencies
```
$ npm i -g gulp
$ mix deps.get
```

## Prepare Database
Install PostgreSQL and create user `postgres` with password `postgres`.
```
$ mix ecto.create && mix ecto.migrate
```

## Run Service
```
$ mix phoenix.server
```
visit http://localhost:4000/api/todos

## API

index
```
$ curl http://localhost:4000/api/todos
```

show
```
$ curl http://localhost:4000/api/todos/:id
```

create
```
$ curl http://localhost:4000/api/todos -X POST -d "todo[title]=jogging" -d "todo[status]=false"
```

edit
```
$ curl http://localhost:4000/api/todos/:id -X PUT -d "todo[title]=movie"
```

delete
```
$ curl http://localhost:4000/api/todos/:id -X DELETE
```

## LICENSE

MIT
