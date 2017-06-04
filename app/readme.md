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

From my current directory (this project):

```
jamescarr@ip-172-27-235-145 ~/Projects/rabbitmq-terraform/app                                                                                                                                        [11:06:15]
> $ tree                                                                                                                                                                                    ⬡ 7.5.0 [±master ✓]
.
├── glide.lock
├── glide.yaml
├── main.go
├── readme.md
└── vendor
    └── github.com
        └── streadway
            └── amqp
                ├── CONTRIBUTING.md
                ├── LICENSE
                ├── README.md
                ├── _examples
                │   ├── pubsub
                │   │   └── pubsub.go
                │   ├── simple-consumer
                │   │   └── consumer.go
                │   └── simple-producer
                │       └── producer.go
                ├── allocator.go
                ├── allocator_test.go
                ├── auth.go
                ├── certs.sh
                ├── channel.go
                ├── client_test.go
                ├── confirms.go
                ├── confirms_test.go
                ├── connection.go
                ├── connection_test.go
                ├── consumers.go
                ├── delivery.go
                ├── delivery_test.go
                ├── doc.go
                ├── examples_test.go
                ├── fuzz.go
                ├── gen.sh
                ├── integration_test.go
                ├── pre-commit
                ├── read.go
                ├── read_test.go
                ├── reconnect_test.go
                ├── return.go
                ├── shared_test.go
                ├── spec
                │   ├── amqp0-9-1.stripped.extended.xml
                │   └── gen.go
                ├── spec091.go
                ├── tls_test.go
                ├── types.go
                ├── uri.go
                ├── uri_test.go
                └── write.go

9 directories, 42 files
            
```
