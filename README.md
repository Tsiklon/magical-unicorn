# Damien's Magical Unicorn displaying web app.

A simple web app used to test the waters with deploying AWS infrastructure with terraform

Tech used:
- Terraform
- Ansible
- Docker
- PHP

## Overview
### Infrastructure Provisioned:

Network:
 - a Virtual Private Cloud network - `10.0.0.0/16`
  - a Gateway from this VPC granting external access
  - a subnet within the VPC - `10.0.1.0/24`
  - an Elastic Load balancer
  
Compute:
 - a single t2.micro EC2 instance in my preferred region (eu-west-1) 
 -  Ubuntu 18.04 x86_64
 - Provisioner - remote-exec
  - Terraform will refresh the repos, install git and ansible, 
  - clone this repository to the system.
  - execute this playbook locally - writing logs to /home/ubuntu/deploy.log
 - output will be the URL of the ELB

Playbook - Task summary:
 - upgrade all packages.
 - configure remote Docker repo + key
 - install docker + docker python module
 - start docker
 - build a docker image from the cloned repository directory.
 - start the image
 
The docker image makes use of the most recent (at the time) php/apache image provided by the php maintainers - `php:7.3-apache`

The PHP serving the site - reads the contents of the `images` directory into an array and outputs it into an `img` stanza with the `array_rand` function  

Terraform implementation adapted from - https://github.com/terraform-providers/terraform-provider-aws/tree/master/examples/two-tier 

Ansible playbook - my own work

## Areas for improvement
 - This can scale horizontally by provisioning additional web servers under the same ELB
 - We would want to serve the images from another instance in the same private network - possibly via NFS
 - alternatively we could use S3 to serve images

## Personal notes
This took a bit longer than I anticipated - in the region of 6-10 hours - mostly due to my lack of experience with Terraform and Docker, though this is functional and builds successfully - serving as a proof of concept for further development and learning.
