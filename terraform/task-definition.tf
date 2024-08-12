resource "local_file" "task_definition_template" {
  content = templatefile("${path.module}/templates/my-task-definition.json.tpl", {
    ACCOUNT_ID         = "992382483259"
    CONTAINER_PORT     = "5000"
    ENV_VAR1           = "env-var-1"
    ENV_VAR2           = "env-var-2"
    AWS_DEFAULT_REGION = var.aws_region
  })
  filename = "my-task-definition.json"
}