terraform {
  backend "s3" {}
}

resource "aws_iam_policy" "github_policy" {
  name        = "github_policy"
  description = "github_policy"
  path        = "/"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "dynamodb:UpdateTimeToLive",
                "dynamodb:DeleteTable",
                "dynamodb:ListTagsOfResource",
                "dynamodb:DescribeTimeToLive",
                "dynamodb:CreateTable",
                "dynamodb:BatchWriteItem",
                "dynamodb:TagResource",
                "dynamodb:PutItem",
                "dynamodb:DescribeTable",
                "dynamodb:DeleteItem",
                "dynamodb:GetItem",
                "dynamodb:DescribeContinuousBackups",
                "dynamodb:UpdateItem",
                "ssm:*",
                "kms:DescribeCustomKeyStores",
                "kms:ListKeys",
                "kms:DeleteCustomKeyStore",
                "kms:GenerateRandom",
                "kms:UpdateCustomKeyStore",
                "kms:ListAliases",
                "kms:DisconnectCustomKeyStore",
                "kms:CreateKey",
                "kms:ConnectCustomKeyStore",
                "kms:CreateCustomKeyStore",
                "cloudformation:*",
                "s3:*",
                "iam:PutRolePolicy",
                "iam:GetRole",
                "lambda:UpdateFunctionCode",
                "lambda:CreateFunction",
                "lambda:TagResource",
                "lambda:DeleteProvisionedConcurrencyConfig",
                "lambda:GetFunctionConfiguration",
                "lambda:DeleteFunction",
                "lambda:GetAlias",
                "lambda:ListCodeSigningConfigs",
                "lambda:UpdateFunctionUrlConfig",
                "lambda:CreateFunctionUrlConfig",
                "lambda:UpdateFunctionEventInvokeConfig",
                "lambda:DeleteFunctionCodeSigningConfig",
                "lambda:InvokeFunctionUrl",
                "lambda:ListFunctions",
                "lambda:InvokeFunction",
                "lambda:ListAliases",
                "lambda:GetFunctionUrlConfig",
                "lambda:UpdateAlias",
                "lambda:GetFunctionConcurrency",
                "lambda:PutProvisionedConcurrencyConfig",
                "lambda:CreateAlias",
                "lambda:ListVersionsByFunction",
                "lambda:UntagResource",
                "lambda:GetProvisionedConcurrencyConfig",
                "lambda:PutFunctionConcurrency",
                "lambda:ListTags",
                "lambda:GetFunction",
                "lambda:UpdateFunctionConfiguration",
                "lambda:ListFunctionUrlConfigs",
                "lambda:AddPermission",
                "lambda:GetFunctionEventInvokeConfig",
                "lambda:DeleteAlias",
                "lambda:DeleteFunctionConcurrency",
                "lambda:DeleteFunctionUrlConfig",
                "lambda:RemovePermission",
                "lambda:GetPolicy",
                "lambda:PublishVersion",
                "apigateway:*",
                "logs:*",
                "iam:*",
                "ec2:*",
                "events:DescribeRule",
                "events:PutRule",
                "events:EnableRule",
                "events:ListRules",
                "events:PutPermission",
                "events:PutTargets",
                "events:RemoveTargets",
                "cloudfront:CreateInvalidation"
            ],
            "Resource": "*"
        }
    ]
})
}

resource "aws_iam_role" "github_role" {
  name        = "github_role"
  description = "github_role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::379717436591:oidc-provider/token.actions.githubusercontent.com"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
                }
            }
        }
    ]
})
}

resource "aws_iam_role_policy_attachment" "github_attach" {
  role       = aws_iam_role.github_role.name
  policy_arn = aws_iam_policy.github_policy.arn
}