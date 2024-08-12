{
    "family": "ecs_demo_task",
    "containerDefinitions": [
        {
            "name": "ecs_demo_container",
            "image": "${ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/ecs-demo-repo:latest",
            "cpu": 0,
            "portMappings": [
                {
                    "containerPort": ${CONTAINER_PORT},
                    "hostPort": ${CONTAINER_PORT},
                    "protocol": "tcp"
                }
            ],
            "essential": true,
            "environment": [
                {
                    "name": "ENV_VAR1",
                    "value": "${ENV_VAR1}"
                  },
                  {
                    "name": "ENV_VAR2",
                    "value": "${ENV_VAR2}"
                  }
            ],
            "mountPoints": [],
            "volumesFrom": [],
            "systemControls": []
        }
    ],
    "executionRoleArn": "arn:aws:iam::${ACCOUNT_ID}:role/ecsTaskExecutionRole",
    "networkMode": "awsvpc",
    "requiresCompatibilities": [
        "FARGATE"
    ],
    "cpu": "256",
    "memory": "512",
    "tags": [
        {
            "key": "owner",
            "value": "fieldeng"
        },
        {
            "key": "Team",
            "value": "field_engineering"
        },
        {
            "key": "iac",
            "value": "true"
        },
        {
            "key": "cost_center",
            "value": "fieldeng"
        },
        {
            "key": "asset_criticality",
            "value": "false"
        },
        {
            "key": "optimization_opt_in",
            "value": "true"
        }
    ]
}
