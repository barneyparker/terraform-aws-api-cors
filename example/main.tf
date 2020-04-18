resource "aws_api_gateway_rest_api" "api" {
  name = "api_cors"
}

module "api-cors" {
  source  = "barneyparker/api-cors/aws"

  api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_rest_api.api.root_resource_id
}