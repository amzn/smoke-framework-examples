# OtherServiceSwiftClient

Uses SwiftPM plugins for build time code generation. 

Package originally generated using https://github.com/amzn/smoke-aws-generate with the command-

```
swift run APIGatewayClientInitialize -c release \
--base-file-path ${basePath}/OtherServiceSwiftClient \
--base-name "Other" \
--model-format "OPENAPI3_0" \
--model-path "OpenAPI30.yaml" \
--model-product-dependency "OtherServiceModel" \
--package-location "../OtherServiceModel" \
--version-requirement-type "path"
```
