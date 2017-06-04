
resource "rabbitmq_exchange" "unprocessed" {
  provider = "rabbitmq.rabbit1"
  name  = "unprocessed"
  vhost = "${rabbitmq_permissions.guest.vhost}"

  settings {
    type        = "fanout"
    durable     = false
    auto_delete = false
  }
}

resource "rabbitmq_queue" "unprocessed-messages" {
  provider = "rabbitmq.rabbit2"
  name  = "unprocessed-messages"
  vhost = "${rabbitmq_permissions.guest.vhost}"

  settings {
    durable     = false
    auto_delete = false
  }
}

resource "rabbitmq_binding" "unprocessed-messages" {
  provider = "rabbitmq.rabbit1"
  source           = "${rabbitmq_exchange.unprocessed.name}"
  vhost            = "${rabbitmq_vhost.logs.name}"
  destination      = "${rabbitmq_queue.unprocessed-messages.name}"
  destination_type = "queue"
  properties_key   = "%29"
}
