# Go RabbitMQ Publisher
This is a simple demo of how to publish messages to rabbitmq from Go.

## Running It
Make sure you have glide installed (`go get glide`) and run 

```
glide install

```

Then run `go run main.go` to start publishing messages in batches of five at two second intervals.

<img width="553" alt="screen shot 2017-06-04 at 11 36 15 am" src="https://cloud.githubusercontent.com/assets/45389/26763569/9a22d1f2-491a-11e7-9cec-b2a669d07bf2.png">

If we inspect the queues now they'll contain what we expect, with the "unprocessed messages" queue containing the unroutable `syslog-3.#` and `syslog-4.#` messages.

<img width="923" alt="screen shot 2017-06-04 at 11 39 06 am" src="https://cloud.githubusercontent.com/assets/45389/26763570/9b8f9aac-491a-11e7-9466-43c1e0ac20c7.png">
<img width="548" alt="screen shot 2017-06-04 at 11 40 06 am" src="https://cloud.githubusercontent.com/assets/45389/26763571/9c89d35a-491a-11e7-89ce-30861cd9eb48.png">
