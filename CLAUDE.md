# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Mintlify-powered API documentation site for the Passport API (formerly Unblocked Wallet Passes). The documentation provides comprehensive guides for creating and managing digital wallet passes for Apple Wallet and Google Pay.

## Development Commands

### Local Development
```bash
# Install Mintlify CLI globally
npm i -g mintlify

# Run development server at the root directory (where docs.json is)
mintlify dev

# Upgrade Mintlify (if needed)
npm i -g mintlify@latest
mintlify upgrade
```

### Deployment
Changes are automatically deployed via GitHub App integration. Push to the default branch to trigger deployment.

## Architecture & Structure

### Core Configuration
- `docs.json` - Main Mintlify configuration file defining navigation, theming, and site structure
- `api-reference/openapi.json` - OpenAPI specification defining all API endpoints and schemas

### Documentation Structure
- `/api-reference/` - Auto-generated API documentation from OpenAPI spec
  - `introduction.mdx` - API overview and getting started
  - `api-keys.mdx` - Authentication documentation
  - `/endpoint/` - Individual endpoint documentation files

- `/documentation/` - Manual guide pages organized by complexity:
  - Basics: Core operations (fetching passes, creating notifications)
  - Guides: Step-by-step tutorials (creating wallet passes, location-based features)
  - Advanced: Complex features (bulk operations, webhooks, analytics)

- `/essentials/` - Mintlify component documentation
- `/images/` and `/logo/` - Visual assets
- `/snippets/` - Reusable MDX components

### API Base URL
Production: `https://api.ubpass.co/v1/`

### Hidden Features & Backups
The repository contains backup files for restoring hidden documentation tabs and fields:
- `hidden_documentation_tab_backup.txt` - Documentation tab configuration backup
- `hidden_fields_backup.txt` - Hidden API schema fields
- `restore_documentation_tab.sh` - Script to restore Documentation tab
- `restore_fields.sh` - Script to restore hidden fields

## Important Considerations

### Mintlify-Specific Requirements
- All documentation files must be in MDX format
- Navigation structure is defined in `docs.json` under the `navigation` property
- OpenAPI integration requires the `openapi` field in tab configuration
- Components like `<Card>`, `<CardGroup>`, `<Accordion>`, and `<Note>` are Mintlify built-ins

### API Documentation Management
- The API Reference tab is auto-generated from `openapi.json`
- Manual documentation pages complement the API reference with guides and tutorials
- Authentication uses `api-key` header with format: `ub_live_your_api_key_here`

### Content Guidelines
- Pass creation requires three steps: upload assets, create pass metadata, publish
- Location-based features use geofencing with 15-minute batch scheduling
- Push notifications support Draft and Scheduled statuses
- All examples should use the production API URL

### Schema Modifications
Certain fields are intentionally hidden from the OpenAPI documentation:
- System-generated fields in WalletPassInfo, PassNotification, PassLocation
- Internal-only endpoints and operations
- The `locations` field in PassMetadata (managed separately)

## Common Tasks

### Adding New Documentation
1. Create MDX file in appropriate `/documentation/` subdirectory
2. Update `docs.json` navigation to include the new page
3. Follow existing page structure with Prerequisites → Request → Response format

### Modifying API Documentation
1. Update `api-reference/openapi.json` with endpoint changes
2. API Reference pages will auto-regenerate from the OpenAPI spec
3. Update manual guides if API behavior changes

### Restoring Hidden Content
```bash
# Restore Documentation tab
./restore_documentation_tab.sh

# Restore hidden fields (if script is properly configured)
./restore_fields.sh
```