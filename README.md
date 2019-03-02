# Damien's Magical Unicorn displaying web app.

A simple web app used to test the waters with deploying AWS infrastructure with terraform

Tech used:
- Terraform
- Ansible
- Docker
- PHP

## Overview
Terraform will provision:
 - a Virtual Private Cloud - 10.0.0.0/16
  - a Gateway from this VPC granting external acces
  - a subnet - 10.0.1.0/24
 - an Elastic Load balancer (ELB)

 - a t2.micro EC2 instance in our preferred region 
  - Ubuntu 18.04 x86_64
 - Provisioner - remote-exec
  - Terraform will refresh the repos, install git and ansible
  - clone this repository to the system.
  - execute this playbook locally - writing logs to $(LOG PATH)
 - output will be the IP address of the ELB

Playbook - Task summary:
 - upgrade all packages.
 - configure remote Docker repo + key
 - install docker + docker python module
 - start docker
 - build a docker image from the cloned repository directory.
 - start the image

Terraform implementation developed from - https://github.com/terraform-providers/terraform-provider-aws/tree/master/examples/two-tier 
Ansible playbook - my own work

## Areas for improvement
 - This can scale horizontally by provisioning additional web servers under the same ELB
 - We would want to serve the images from another instance in the same private network to act as an NFS host to serve the images
  - that way nfs can be presented to the web heads to mount the 'images' directory.
