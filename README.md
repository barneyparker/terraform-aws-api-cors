# terraform-aws-api-cors

Module to simplify implimentation of CORS responses on API Gateway routes.

## Compatibility

This module is HCL2 compatible only.

## Example

```
resource "aws_api_gateway_rest_api" "api" {
  name = "api_cors"
}

module "api-cors" {
  source  = "barneyparker/api-cors/aws"

  api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_rest_api.api.root_resource_id
}
```