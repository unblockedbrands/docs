#!/bin/bash

# Script to restore AccessToken authentication option to the API documentation
# This was hidden on 2025-09-24 to simplify authentication options

echo "Restoring AccessToken authentication option..."

# Update the global security section to include both AccessToken and APIKey
sed -i '' '/"security": \[/,/\]/c\
  "security": [\
    {\
      "AccessToken": []\
    },\
    {\
      "APIKey": []\
    }\
  ],' api-reference/openapi.json

echo "AccessToken authentication has been restored."
echo ""
echo "Note: The AccessToken security scheme is still defined in the securitySchemes section:"
echo "  - Type: http"
echo "  - Scheme: bearer"
echo "  - Bearer Format: JWT"
echo ""
echo "To fully remove AccessToken support, you would also need to remove it from securitySchemes."