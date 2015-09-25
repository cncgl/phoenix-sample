# Phoenix-sample

To start your Phoenix app:

  1. Install gulp with `npm i -g gulp`
  2. Install dependencies with `mix deps.get`
  3. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  4. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

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
