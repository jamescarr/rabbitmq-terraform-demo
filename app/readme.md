# Go RabbitMQ Publisher
This is a simple demo of how to publish messages to rabbitmq from Go.

## Running It
Make sure you have glide installed (`go get glide`) and run 

```
glide install

```

Then run `go run main.go` to start publishing messages in batches of five at two second intervals.

If we inspect the queues now they'll contain what we expect, with the "unprocessed messages" queue containing the unroutable `syslog-3.#` and `syslog-4.#` messages.
