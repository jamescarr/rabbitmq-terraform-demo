# RabbitMQ Terraform
This is another personal repository to play around with using the rabbitmq terraform provider.

## Running It
Run `docker-compose up -d` to bring up a three node rabbitmq cluster in docker.

From the terraform directory, run `terraform plan -out a.out` and `terraform apply a.out` to experiment adding users, queues, etc.

## Special Thanks
http://www.levvel.io/blog-post/testing-rabbitmq-clustering-using-docker-part-1/ for the easily found example of clustering rabbitmq in docker.
