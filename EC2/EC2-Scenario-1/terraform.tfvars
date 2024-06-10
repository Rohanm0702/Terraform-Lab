ec2_ami_id = "ami-00beae93a2d981137"
ec2_instance_type = "t2.small"
ec2_subnet_cidr = "10.0.1.0/24"
ec2_ebs_volume_size = 10
ec2_launch_template_block_device = {
  device_name = "/dev/sdg"
  volume_size = 20
}
ec2_autoscaling_group_name = "my_autoscaling_group"
ec2_autoscaling_max_size = 10
ec2_autoscaling_min_size = 2
ec2_autoscaling_desired_capacity = 5
ec2_autoscaling_health_check_grace_period = 600
ec2_autoscaling_health_check_type = "EC2"
ec2_autoscaling_force_delete = false
ec2_autoscaling_min_healthy_percentage = 80
ec2_autoscaling_max_healthy_percentage = 110
ec2_autoscaling_timeout_delete = "30m"

