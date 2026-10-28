
data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "jenkins_admin_role" {
  name               = "Jenkins-Terraform-Admin-Role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

  tags = {
    Environment = "DevOps"
    ManagedBy   = "Terraform"
  }
}

resource "aws_iam_role_policy_attachment" "admin_attach" {
  role       = aws_iam_role.jenkins_admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_instance_profile" "jenkins_profile" {
  name = "Jenkins-Terraform-Admin-Profile"
  role = aws_iam_role.jenkins_admin_role.name
}

output "instance_profile_name" {
  value       = aws_iam_instance_profile.jenkins_profile.name
  description = "Attach this instance profile to your Jenkins EC2 server"
}
