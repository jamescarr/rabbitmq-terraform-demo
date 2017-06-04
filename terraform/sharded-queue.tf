################################################
# A sharded queue is accomplished by creating
# multiple queues, one on each node, to balance
# the work across the cluster. This implementation
# requires client awareness by defining the 
# routing key.
################################################

############################################
# Queues
############################################

resource "rabbitmq_queue" "syslog-logs-0" {
  provider = "rabbitmq.rabbit1"
  name  = "syslogs-0"
  vhost = "${rabbitmq_permissions.guest.vhost}"

  settings {
    durable     = false
    auto_delete = false
  }
}

resource "rabbitmq_binding" "syslog_logs-0" {
  provider = "rabbitmq.rabbit1"
  source           = "${rabbitmq_exchange.logs-ingest.name}"
  vhost            = "${rabbitmq_vhost.logs.name}"
  destination      = "${rabbitmq_queue.syslog-logs-0.name}"
  destination_type = "queue"
  routing_key      = "syslogs-0.#"
  properties_key   = "%24"
}

resource "rabbitmq_queue" "syslog-logs-1" {
  provider = "rabbitmq.rabbit2"
  name  = "syslogs-1"
  vhost = "${rabbitmq_permissions.guest.vhost}"

  settings {
    durable     = false
    auto_delete = false
  }
}

resource "rabbitmq_binding" "syslog_logs-1" {
  provider = "rabbitmq.rabbit2"
  source           = "${rabbitmq_exchange.logs-ingest.name}"
  vhost            = "${rabbitmq_vhost.logs.name}"
  destination      = "${rabbitmq_queue.syslog-logs-1.name}"
  destination_type = "queue"
  routing_key      = "syslogs-1.#"
  properties_key   = "%25"
}

resource "rabbitmq_queue" "syslog-logs-2" {
  provider = "rabbitmq.rabbit3"
  name  = "syslogs-2"
  vhost = "${rabbitmq_permissions.guest.vhost}"

  settings {
    durable     = false
    auto_delete = false
  }
}

resource "rabbitmq_binding" "syslog_logs-2" {
  provider = "rabbitmq.rabbit3"
  source           = "${rabbitmq_exchange.logs-ingest.name}"
  vhost            = "${rabbitmq_vhost.logs.name}"
  destination      = "${rabbitmq_queue.syslog-logs-2.name}"
  destination_type = "queue"
  routing_key      = "syslogs-2.#"
  properties_key   = "%26"
}

