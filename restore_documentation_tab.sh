#!/bin/bash
# Documentation tab restoration script
# Usage: ./restore_documentation_tab.sh

echo "🔧 Documentation Tab Restoration Script"
echo "========================================"

if [ ! -f "docs.json" ]; then
    echo "❌ Error: docs.json file not found in current directory"
    exit 1
fi

if [ ! -f "hidden_documentation_tab_backup.txt" ]; then
    echo "❌ Error: Backup file not found"
    exit 1
fi

echo "📝 Restoring Documentation tab to docs.json..."

# Create a backup of current docs.json
cp docs.json docs.json.backup

# Read the current docs.json and add the Documentation tab back
cat > docs.json << 'EOF'
{
  "$schema": "https://mintlify.com/docs.json",
  "theme": "mint",
  "name": "Passport API Documentation",
  "colors": {
    "primary": "#367CFF",
    "light": "#367CFF",
    "dark": "#367CFF"
  },
  "favicon": "/favicon.svg",
  "navigation": {
    "tabs": [
      {
        "tab": "API Reference",
        "openapi": "api-reference/openapi.json",
        "groups": [
          {
            "group": "Getting Started",
            "pages": [
              "api-reference/introduction",
              "api-reference/api-keys"
            ]
          }
        ]
      },
      {
        "tab": "Documentation",
        "groups": [
          {
            "group": "Basics",
            "pages": [
              "documentation/fetching-pass-details",
              "documentation/creating-push-notifications",
              "documentation/fetching-push-notification-details"
            ]
          },
          {
            "group": "Guides",
            "pages": [
              "documentation/creating-wallet-passes",
              "documentation/sending-location-based-notifications",
              "documentation/file-uploads"
            ]
          },
          {
            "group": "Advanced",
            "pages": [
              "documentation/pass-customization",
              "documentation/bulk-operations",
              "documentation/webhooks",
              "documentation/analytics"
            ]
          }
        ]
      }
    ]
  },
  "logo": {
    "light": "/logo/light.svg",
    "dark": "/logo/dark.svg"
  },
  "navbar": {
    "links": [
      {
        "label": "Support",
        "href": "mailto:hi@mintlify.com"
      }
    ],
    "primary": {
      "type": "button",
      "label": "Dashboard",
      "href": "https://dashboard.mintlify.com"
    }
  },
  "footer": {
    "socials": {
      "x": "https://x.com/mintlify",
      "github": "https://github.com/mintlify",
      "linkedin": "https://linkedin.com/company/mintlify"
    }
  }
}
EOF

echo "✅ Documentation tab has been restored!"
echo "💾 Previous docs.json backed up as docs.json.backup"
echo "🔄 You may need to refresh your documentation site to see the changes" 
