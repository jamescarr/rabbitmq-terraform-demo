package main

import (
  "fmt"
  "log"
  "time"
  "os"
  "os/signal"
  "syscall"

  "github.com/streadway/amqp"
)


func failOnError(err error, msg string) {
	if err != nil {
		log.Fatalf("%s: %s", msg, err)
	}
}


func send(ch *amqp.Channel, key string, body string) {
  ch.Publish(
		"logs-ingest",     // exchange
		key, // routing key
		false,  // mandatory
		false,  // immediate
		amqp.Publishing{
			ContentType: "text/plain",
			Body:        []byte(body),
		})
	log.Printf(" [x] Sent %s using key %s", body, key)
}
func main() {
  conn, err := amqp.Dial("amqp://guest:guest@localhost:5672/logs")
  failOnError(err, "Failed to connect to RabbitMQ")
  defer conn.Close()
  
  ch, err := conn.Channel()
  failOnError(err, "Failed to open the channel")
  defer ch.Close()

  sigs := make(chan os.Signal, 1)

  signal.Notify(sigs, syscall.SIGINT, syscall.SIGTERM)

  ticker := time.NewTicker(time.Second * 2)
  go func() {
    for t := range ticker.C {
      fmt.Println("Tick at ", t.UTC())
      for i := 0; i <= 4; i++ {
        key := fmt.Sprintf("syslogs-%d.foo.bar", i)
        go send(ch, key, "test")
      }
    }
  }()

  fmt.Println("Publishing messages, hit ctrl+c to exit!")
  <-sigs
}
