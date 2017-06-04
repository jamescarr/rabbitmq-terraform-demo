# RabbitMQ Terraform
This is another personal repository to play around with using the rabbitmq terraform provider.

## Running It
The `Makefile` has various targets that do all the heavy lifting for you.

- `make up` - brings up the docker containers for rabbitmq cluster. Visit http://localhost:15672 to verify all containers are up and clustered. Login is *guest*/*guest*.
- `make init` - initializes the `terraform/` dir
- `make plan` - does a plan in the dir, removing the outfile if it already exists
- `make apply` - applies the plan.

At this point, you should be able to visit the management console and see the exchange create
as well as both the single `nginx-logs` queue and the sharded `syslogs` queue.
