__Warning!__

Due to complications with:
- lack of time,
- complications with hooks that sometimes timeout but work in sfdx
- some breaking change in pnpm

this package (and image) won't be maintained anymore.
Thanks anyone that used this package!

# Minimal Force Cli

[![badge with latest npm version](https://img.shields.io/npm/v/@ziemniakoss/mfc)](https://www.npmjs.com/package/@ziemniakoss/mfc)
[![Docker image version tag](https://img.shields.io/docker/v/ziemniakoss/mfc?label=image%20version)](https://hub.docker.com/r/ziemniakoss/mfc)
[![badge with image size](https://img.shields.io/docker/image-size/ziemniakoss/mfc)](https://hub.docker.com/r/ziemniakoss/mfc)

CLI for Salesforce without plugins that are not needed in CI environments, like plugins for code generation or schema
description.

## Included plugins

- [@oclif/plugin-plugins](https://www.npmjs.com/package/@oclif/plugin-plugins)
- [@salesforce/plugin-apex](https://www.npmjs.com/package/@salesforce/plugin-apex)
- [@salesforce/plugin-auth](https://www.npmjs.com/package/@salesforce/plugin-auth)
- [@salesforce/plugin-community](https://www.npmjs.com/package/@salesforce/plugin-community)
- [@salesforce/plugin-org](https://www.npmjs.com/package/@salesforce/plugin-org)
- [@salesforce/plugin-source](https://www.npmjs.com/package/@salesforce/plugin-source)
- [sfdx-ci-summary-creator](https://www.npmjs.com/package/sfdx-ci-summary-creator)
- [sfdx-metadata-splitter](https://www.npmjs.com/package/sfdx-metadata-splitter)

## Other installed programs

- node
- git
