resource "rabbitmq_exchange" "sharted" {
  provider = "rabbitmq.rabbit1"
  name  = "sharted"
  vhost = "${rabbitmq_permissions.guest.vhost}"

  settings {
    type        = "topic"
    durable     = false
    auto_delete = false
    arguments {
      alternate-exchange = "unprocessed"
    }
  }
}

resource "rabbitmq_queue" "sharded-queue" {
  provider = "rabbitmq.rabbit1"
  name  = "auto.sharded.queue"
  vhost = "${rabbitmq_permissions.guest.vhost}"

  settings {
    durable     = false
    auto_delete = false
  }
}

resource "rabbitmq_binding" "sharded-queue" {
  provider = "rabbitmq.rabbit1"
  source           = "${rabbitmq_exchange.sharted.name}"
  vhost            = "${rabbitmq_vhost.logs.name}"
  destination      = "${rabbitmq_queue.sharded-queue.name}"
  destination_type = "queue"
  routing_key      = "foo.bar.baz"
  properties_key   = "%31"
}

#resource "rabbitmq_policy" "sharded-queue" {
#  provider = "rabbitmq.rabbit1"
#  name  = "sharded-queue-policy"
#  vhost = "${rabbitmq_permissions.guest.vhost}"
#
#  policy {
#    pattern  = "^${rabbitmq_queue.sharded-queue.name}$"
#    priority = 0
#    apply_to = "queues"
#
#    definition {
#      shards-per-node = 2
#      routing-key = "foo.bar.baz"
#    }
#  }
#}
