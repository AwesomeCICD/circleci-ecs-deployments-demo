# CircleCI ECS Deployments Demo

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/CircleCI-Labs/circleci-ecs-deployments/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/CircleCI-Labs/circleci-ecs-deployments/tree/main)

---

### Overview

The repo showcases the following: 

- Uses the [aws-ecr orb](https://circleci.com/developer/orbs/orb/circleci/aws-ecr) to showcase how to build and push a simple docker image to the [AWS Elastic Container Registry](https://aws.amazon.com/ecr/).
- Uses the [official Terraform Docker](https://hub.docker.com/layers/hashicorp/terraform/1.8.3/images/sha256-4c7e93870a73e2c12e28858388eccf6541fda287f26795076787bf03bb0749df?context=explore) image to showcase how to build [ECS Task Definition](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html) templates.
- Persisting task definition templates between different jobs using the [Workspaces](https://circleci.com/docs/workspaces/) feature.
- Demonstrates how ECS Task Definition environment variables can be performed easily in CircleCI:
  - By updating the [task-definition](https://github.com/CircleCI-Labs/circleci-ecs-deployments/blob/main/terraform/templates/my-task-definition.json.tpl) template directly
  - By injecting [pre-defined environment variables](https://circleci.com/docs/variables/) directly at runtime. (Example [here](https://ecs-demo.fieldeng-sphereci.com:5000/)]
- Perform an [*update_task_definition_from_json*](https://github.com/CircleCI-Labs/circleci-ecs-deployments/blob/main/.circleci/config.yml#L132-L134) using the [aws-ecs orb](https://circleci.com/developer/orbs/orb/circleci/aws-ecs?utm_term=g_-_c__rsa1_&utm_campaign=sem-google-dg--uscan-en-DSA-tCPA-auth-nb&utm_source=google&utm_medium=sem&utm_content=&hsa_acc=2021276923&hsa_cam=21281368932&hsa_grp=169131607664&hsa_ad=699387060157&hsa_src=g&hsa_tgt=dsa-94608848670&hsa_kw=&hsa_mt=&hsa_net=adwords&hsa_ver=3&gad_source=1&gclid=Cj0KCQjw5ea1BhC6ARIsAEOG5pyEa85gq7hLE_i2qDogR9xnZkT4SlKZDC2zq7GTALdZXwfRzKMV2bgaAqQdEALw_wcB#usage-update_task_definition_from_json)
- Perform an [*update_service*](https://github.com/CircleCI-Labs/circleci-ecs-deployments/blob/main/.circleci/config.yml#L135-L141) using the [aws-ecs orb](https://circleci.com/developer/orbs/orb/circleci/aws-ecs?utm_term=g_-_c__rsa1_&utm_campaign=sem-google-dg--uscan-en-DSA-tCPA-auth-nb&utm_source=google&utm_medium=sem&utm_content=&hsa_acc=2021276923&hsa_cam=21281368932&hsa_grp=169131607664&hsa_ad=699387060157&hsa_src=g&hsa_tgt=dsa-94608848670&hsa_kw=&hsa_mt=&hsa_net=adwords&hsa_ver=3&gad_source=1&gclid=Cj0KCQjw5ea1BhC6ARIsAEOG5pyEa85gq7hLE_i2qDogR9xnZkT4SlKZDC2zq7GTALdZXwfRzKMV2bgaAqQdEALw_wcB#usage-update_service)
 
---


**Disclaimer:**

CircleCI Labs, including this repo, is a collection of solutions developed by members of CircleCI's field engineering teams through our engagement with various customer needs.

-   ✅ Created by engineers @ CircleCI
-   ✅ Used by real CircleCI customers
-   ❌ **not** officially supported by CircleCI support

---
