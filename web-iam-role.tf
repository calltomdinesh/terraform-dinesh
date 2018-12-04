resource "aws_iam_role" "test_role" {
  name               = "test_role"
  assume_role_policy = "${file("iam/ec2-assume-policy.json")}"
}

# Policy document
resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"
  policy      = "${file("iam/ec2-policy.json")}"
}

# Attach policy with role
resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  roles      = ["${aws_iam_role.test_role.name}"]
  policy_arn = "${aws_iam_policy.policy.arn}"
}

# Create Instance profile for attaching role to ec2
resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = "${aws_iam_role.test_role.name}"
}
