
resource "aws_lb_target_group" "test-target-group" {

  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
  }

  name        = "test-target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = "${aws_vpc.test_vpc.id}"
}

resource "aws_lb" "test-lb" {
  name     = "test-lb"
  internal = false
  security_groups    = [aws_security_group.test_security.id]
  subnets  = [aws_subnet.test_public_subnet.id,aws_subnet.test_public_subnet_1.id]

  tags = {
    Name = "test-lb"
  }
  ip_address_type    = "ipv4"
  load_balancer_type = "application"

}

resource "aws_lb_listener" "test_lb_listener" {
  load_balancer_arn = aws_lb.test-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.test-target-group.arn
    type             = "forward"
  }
}


resource "aws_alb_target_group_attachment" "test-public_instance" {
  target_group_arn = aws_lb_target_group.test-target-group.arn
  target_id        = aws_instance.test_instance.id
}

