

variable "container_port" {
  type        = number
  description = "Container Port"
  default     = 5000
}

# Create an ECS Cluster
resource "aws_ecs_cluster" "ecs_demo" {
  name = "ecs-demo-cluster"
}

# Create an ECR repository (if you don't have one)
resource "aws_ecr_repository" "ecs_demo" {
  name = "ecs-demo-repo"
}


import {
  to = aws_iam_role.ecs_task_execution_role
  id = "ecsTaskExecutionRole"
}


# Define the IAM role for the ECS task
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

# Attach the required policies to the IAM role
resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# Define a security group for the load balancer
resource "aws_security_group" "lb" {
  name        = "lb-security-group"
  description = "Allow HTTP traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.container_port
    to_port     = var.container_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an Application Load Balancer
resource "aws_lb" "ecs_demo" {
  name               = "ecs-demo-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb.id]
  subnets            = var.subnets
}

## Fetch the DNS Name for the Load Balancer
output "alb_dns_name" {
  value = aws_lb.ecs_demo.dns_name
}

# Create a target group for the ECS service
resource "aws_lb_target_group" "ecs_demo" {
  name     = "ecs-demo-tg"
  port     = var.container_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  # Target Type set to IP
  target_type = "ip"

  health_check {
    path = "/"
  }
}

# Create a listener for the load balancer
resource "aws_lb_listener" "ecs_demo" {
  load_balancer_arn = aws_lb.ecs_demo.arn
  port              = var.container_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_demo.arn
  }
}

# Define the ECS Task Definition
resource "aws_ecs_task_definition" "ecs_demo" {
  family                   = "ecs_demo_task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "ecs_demo_container",
      image     = "${aws_ecr_repository.ecs_demo.repository_url}:latest",
      essential = true,
      environments = [
        {
          env_var1 = "default-value1"
          env_var2 = "default-value2"
        }
      ]
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
        }
      ]
    }
  ])
}

# Define the ECS Service
resource "aws_ecs_service" "ecs_demo" {
  name            = "ecs_demo_service"
  cluster         = aws_ecs_cluster.ecs_demo.id
  task_definition = aws_ecs_task_definition.ecs_demo.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnets
    security_groups  = [aws_security_group.lb.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_demo.arn
    container_name   = "ecs_demo_container"
    container_port   = var.container_port
  }
}
