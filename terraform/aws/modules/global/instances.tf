resource "aws_instance" "VMs" {
  ami           = var.ami
  instance_type = "t3a.medium"
  key_name      = var.key_name
  subnet_id     = aws_subnet.subnet.id
  count = length(var.student_names)
  root_block_device {
    volume_size = "8"
  }

  vpc_security_group_ids = [
    data.aws_security_group.default.id,
  ]

  lifecycle {
    ignore_changes = [
      ami,
    ]
  }

  tags = {
    Name = var.student_names[count.index]
    Env  = "global"
  }
}



variable "student_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["sribiere", "dandriatahiry", "sbarre", "abasset", "abonin", "qcaisez", "lcarre", "qcauville", "jcorreira",
  "ddauteur", "nelhajji", "hfray", "cgagnepain", "qjacot", "bkoubemba", "ylopesregab", "tmagnien", "vmarchal", "kmarquand",
    "lmesser", "aparfait", "kperyton", "pprovost", "mvoegtlin", "cvorillon"]
}