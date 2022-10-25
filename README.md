# Terraform

### Creation of two servers (LEMP and LAMP) and a load balancer in Yandex Cloud using Terraform.

Check the configuration using the command:

`terraform validate`

Format the configuration files in the current folder and subfolders:

`terraform fmt`

After checking the configuration, run the command:

`terraform plan`

The terminal will display a list of resources with parameters. This is a test step.

To create resources, run the command:

`terraform apply`

To delete resources, run the command:

`terraform apply -destroy`
