# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Salesforce DX (source-format) project targeting API version 66.0. All metadata lives under `force-app/main/default/`. The default connected org alias is `Developer Org` (set in `.sf/config.json`).

## Common Commands

### Org Operations
```bash
# Authorize an org
sf org login web -a <alias>

# Create a scratch org
sf org create scratch -f config/project-scratch-def.json -a <alias>

# Deploy source to org
sf project deploy start

# Deploy using manifest
sf project deploy start --manifest manifest/package.xml

# Retrieve source from org
sf project retrieve start --manifest manifest/package.xml

# Retrieve a specific component
sf project retrieve start -m ApexClass:<ClassName>
```

### Apex
```bash
# Run all Apex tests
sf apex run test --synchronous

# Run a single test class
sf apex run test -n <TestClassName> --synchronous

# Run anonymous Apex
sf apex run --file scripts/apex/hello.apex

# Execute a SOQL query
sf data query --query "$(cat scripts/soql/account.soql)"
```

### LWC / JavaScript
```bash
# Lint Aura and LWC JS
npm run lint

# Run all LWC unit tests
npm run test

# Run tests in watch mode
npm run test:unit:watch

# Run tests with coverage
npm run test:unit:coverage

# Run tests for a single component
npx sfdx-lwc-jest force-app/main/default/lwc/<componentName>
```

### Code Formatting
```bash
# Format all files (Apex, LWC, XML, etc.)
npm run prettier

# Verify formatting without writing
npm run prettier:verify
```

## Architecture

### Metadata Structure
All Salesforce source lives in `force-app/main/default/` organized by metadata type. Key directories:

- `classes/` — Apex classes and test classes (paired `.cls` + `.cls-meta.xml`)
- `triggers/` — Apex triggers (Account, Lead, Opportunity, EmailMessage, BatchApexError, Platform Event)
- `lwc/` — Lightning Web Components (bikeCard, helloWorld, lwcBusinessVertical, treeGrid, etc.)
- `aura/` — Aura components
- `flows/` — Salesforce Flows (screen flows, auto-launched flows)
- `objects/` — Custom object definitions with fields, validation rules, layouts nested inside
- `customMetadata/` — Custom Metadata Type records

### Apex Patterns
- Triggers follow an "all-events" handler pattern (e.g., `AccountAllTrigger`, `OpportunityAllTrigger`); business logic lives in corresponding service/handler classes
- Batch Apex: `BatchLeadConvert` with `BatchLeadConvertErrors__c` custom object for error tracking
- Test classes are co-located with the class they test (e.g., `BatchLeadConvert.cls` / `BatchLeadConvertTest.cls`)
- Email services use `AsyncCreateNewContactSOAP` for inbound email handling
- Platform Events: `Test_event__e` with a trigger subscriber (`testTriggerEventSub`)

### LWC Structure
Each LWC bundle under `lwc/<componentName>/` contains:
- `<componentName>.html` — template
- `<componentName>.js` — controller (ES module)
- `<componentName>.js-meta.xml` — component configuration/targets
- `__tests__/<componentName>.test.js` — Jest unit tests

LWC components that call Apex use `@salesforce/apex` wire adapters or imperative calls. Controller classes for LWC (e.g., `BusinessVerticalLookupController`) are annotated with `@AuraEnabled`.

### Pre-commit Hooks
Husky runs `lint-staged` on every commit:
1. Prettier formats all changed files
2. ESLint checks changed Aura/LWC JS
3. Jest runs tests related to changed LWC files (bail on first failure)

### Custom Objects of Note
- `Camping_Item__c`, `Expense__c`, `Tower__c` — domain-specific custom objects
- `BatchLeadConvertErrors__c` — error log for batch lead conversion
- `Country_Code__mdt` — Custom Metadata Type for country lookups
- `ObjectFromEmailAcceptedFields__c`, `ObjectFromEmailDefaultFields__c` — email-to-object configuration
