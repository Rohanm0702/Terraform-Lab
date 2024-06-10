terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_instance" "labec2" {
  ami               = var.ec2_ami_id
  instance_type     = var.ec2_instance_type
  subnet_id         = aws_subnet.ec2_subnet.id
  availability_zone = "us-east-1a"
  tags = {
    Name = "LabEC2"
  }
}

resource "aws_ebs_volume" "labec2_ebs" {
  availability_zone = "us-east-1a"
  size              = 1
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.labec2_ebs.id
  instance_id = aws_instance.labec2.id
}

resource "aws_launch_template" "ec2_template" {
  name = "ec2_template"

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 8
    }
  }

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  image_id = "ami-00beae93a2d981137"
  instance_type = "t2.micro"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test"
    }
  }
}

resource "aws_vpc" "ec2_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "ec2_vpc"
  }
}

resource "aws_subnet" "ec2_subnet" {
  vpc_id     = aws_vpc.ec2_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "ec2_subnet"
  }
}

resource "aws_autoscaling_group" "ec2_scaling" {
  name                      = "ec2_scaling"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 4
  force_delete              = true
  vpc_zone_identifier       = [aws_subnet.ec2_subnet.id]
  instance_maintenance_policy {
    min_healthy_percentage = 90
    max_healthy_percentage = 120
  }
  launch_template {
    id      = aws_launch_template.ec2_template.id
    version = "$Latest"
  }
  timeouts {
    delete = "15m"
  }


}
