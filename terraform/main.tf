# Configure Provider, one for each node
provider "rabbitmq" {
  alias    = "rabbit1"
  endpoint = "http://127.0.0.1:15672"
  username = "guest"
  password = "guest"
}

provider "rabbitmq" {
  alias    = "rabbit2"
  endpoint = "http://127.0.0.1:15673"
  username = "guest"
  password = "guest"
}

provider "rabbitmq" {
  alias    = "rabbit3"
  endpoint = "http://127.0.0.1:15674"
  username = "guest"
  password = "guest"
}

############################################
# Vhost
############################################
resource "rabbitmq_vhost" "logs" {
  provider = "rabbitmq.rabbit1"
  name = "logs"
}

############################################
# Permissions
############################################
resource "rabbitmq_permissions" "guest" {
  provider = "rabbitmq.rabbit1"
  user  = "guest"
  vhost = "${rabbitmq_vhost.logs.name}"

  permissions {
    configure = ".*"
    write     = ".*"
    read      = ".*"
  }
}

############################################
# Exchange
############################################
resource "rabbitmq_exchange" "logs-ingest" {
  provider = "rabbitmq.rabbit1"
  name  = "logs-ingest"
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

############################################
# Queues
############################################

resource "rabbitmq_queue" "nginx-logs" {
  provider = "rabbitmq.rabbit1"
  name  = "nginx_logs"
  vhost = "${rabbitmq_permissions.guest.vhost}"

  settings {
    durable     = false
    auto_delete = false
  }
}

resource "rabbitmq_binding" "nginx_logs" {
  provider = "rabbitmq.rabbit1"
  source           = "${rabbitmq_exchange.logs-ingest.name}"
  vhost            = "${rabbitmq_vhost.logs.name}"
  destination      = "${rabbitmq_queue.nginx-logs.name}"
  destination_type = "queue"
  routing_key      = "nginx_logs.#"
  properties_key   = "%23"
}
