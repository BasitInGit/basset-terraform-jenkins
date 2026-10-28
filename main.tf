locals {
  name = "jenkins"
}

resource "aws_instance" "jenkins_app_controller" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.jenkins_app_sg.name]

  iam_instance_profile = aws_iam_instance_profile.jenkins_profile.name
  tags = {
    Name = "${local.name}-controller"
  }
  user_data = file("jenkins-userdata.sh")
}

resource "aws_instance" "jenkins_app_agent" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.jenkins_app_sg.name]

  iam_instance_profile = aws_iam_instance_profile.jenkins_profile.name
  tags = {
    Name = "${local.name}-agent"
  }
  user_data = file("agent-userdata.sh")
  
}

