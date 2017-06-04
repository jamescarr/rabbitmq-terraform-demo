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

func NewConnection() amqp.Connection  {
  conn, err := amqp.Dial("amqp://guest:guest@localhost:5672/")
	failOnError(err, "Failed to connect to RabbitMQ")
	defer conn.Close()
  return conn


}
func main() {
  conn := NewConnection()
  conn.close()
  sigs := make(chan os.Signal, 1)

  signal.Notify(sigs, syscall.SIGINT, syscall.SIGTERM)

  ticker := time.NewTicker(time.Second * 2)
  go func() {
    for t := range ticker.C {
      fmt.Println("Tick at ", t.UTC())
    }
  }()

  fmt.Println("Publishing messages, hit ctrl+c to exit!")
  <-sigs
}
