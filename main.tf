module "cors_integration" {
  source = "github.com/barneyparker/terraform-aws-api-generic"

  api_id   = var.api_id
  resource_id   = var.resource_id
  http_method = "OPTIONS"
  authorization = "NONE"

  type = "MOCK"
  request_templates = {
    "application/json" = jsonencode({
      statusCode = 200
    })
  }

  responses = [
    {
      status_code = "200"
      templates = {
        "application/json" = ""
      }

      models = {
        "application/json" = "Empty"
      }

      parameters = [
        "method.response.header.Access-Control-Allow-Headers",
        "method.response.header.Access-Control-Allow-Methods",
        "method.response.header.Access-Control-Allow-Origin",
      ]

      param_values = [
        "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
        "'OPTIONS,POST'",
        "'*'",
      ]

      param_requires = [
        false,
        false,
        false,
      ]
    }

  ]
}