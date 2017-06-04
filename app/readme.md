# Go RabbitMQ Publisher
This is a simple demo of how to publish messages to rabbitmq from Go.

## Running It
Make sure you have glide installed (`go get glide`) and run 

```
glide install

```

Currently this is failing for me when I run `go run` or `go build` from this directory.

```
main.go:11:3: cannot find package "github.com/streadway/amqp" in any of:
        /usr/local/Cellar/go/1.8.1/libexec/src/github.com/streadway/amqp (from $GOROOT)
        /Users/jamescarr/gopath/src/github.com/streadway/amqp (from $GOPATH)

```

