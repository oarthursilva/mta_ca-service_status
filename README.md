# mta_bs-status_overview_cmd

- [mta_bs-status_overview_cmd](#mta_bs-status_overview_cmd)
    - [Start a CAP server](#start-a-cap-server)
    - [Generate comma-separated values (CSV) templates](#generate-comma-separated-values-csv-templates)
    - [Troubleshooting](#troubleshooting)


### Start a CAP server

```
cds watch
```

### Generate comma-separated values (CSV) templates

```
cds add data
```

### Add an SAP HANA Cloud client to your application

```
cds add hana --for production
```

- @cap-js/hana

### Configure the SAP Authorization and Trust Management service

```
cds add xsuaa --for production
```

The statements adds the `SAP Authorization and Trust Management` service (including the `"@sap/xssec": "^x"` dependency and the `cds.requires` [production] profile `"auth": "xsuaa"`) to the package.json file of the project.

- @sap/xssec

### Troubleshooting

- https://github.com/nodejs/node-gyp#installation