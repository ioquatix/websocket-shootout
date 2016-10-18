# Rails Action Cable Server

## Dependencies

* Ruby 2.3+
* Redis

```
bundle install
```

To run the server:

```
rails s -p 3334 -e production
```

You can specify the number of Puma workers:

```
WEB_CONCURRENCY=4 rails s -p 3334 -e production
```

The raw message to send to a connection to join a channel is as follows:

```
{"command":"subscribe","identifier":"{\"channel\":\"BenchmarkChannel\"}"}
```

To run a patched version of Action Cable run with `PATCH` env variable:

```
PATCH=1 WEB_CONCURRENCY=4 rails s -p 3334 -e production
```

For more inforrmation about the patch see [this issue](https://github.com/rails/rails/issues/26999).
