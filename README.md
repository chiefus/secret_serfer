# Secret Serfer

## Short Description
The main goal of this action is to search sensitive data in a current commit files.
</br>
This solution is based on usage truffleHog3 with custom rule files (rules.yml).

## How to use

### Example 1: Current directory

```
jobs:
  build-and-test:
    runs-on: ubuntu-latest         
    steps:
      - name: Code Checkout
        uses: actions/checkout@v2

      - name: Secret Demo
        uses: chiefus/secret_serfer@v0.1.0
        with:
          targets: "./"
```


### Example 2: With test results publishing and uploading
```

jobs:
  build-and-test:
    runs-on: ubuntu-latest
          
    steps:
      - name: Code Checkout
        uses: actions/checkout@v2

      - name: Secret Demo
        uses: chiefus/secret_serfer@v0.1.0
        with:
          targets: "./"
          report: report.xml

      - name: Upload Unit Test Results
        if: always()
        uses: actions/upload-artifact@v2
        with:
          name: Unit Test Results
          path: report.xml
        
      - name: Publish Unit Test Results
        if: always()
        uses: EnricoMi/publish-unit-test-result-action@v1.7
        with:
          check_name: Unit Test Results
          github_token: ${{ secrets.GITHUB_TOKEN }}
          files: report.xml
```

### Example 3: Exclude entropy
```

jobs:
  build-and-test:
    runs-on: ubuntu-latest
          
    steps:
      - name: Code Checkout
        uses: actions/checkout@v2

      - name: Secret Demo
        uses: chiefus/secret_serfer@v0.1.0
        with:
          targets: "./"
          args: "--no-entropy"
```


### Example 4: Exclude some regexp rules
(List of used rules is in file rules.yml.)
```

jobs:
  build-and-test:
    runs-on: ubuntu-latest
          
    steps:
      - name: Code Checkout
        uses: actions/checkout@v2

      - name: Secret Demo
        uses: chiefus/secret_serfer@v0.1.0
        with:
          targets: "./code"
          args: "--no-entropy"
          exclude_rules: "Artifactory_API_Token Authorization_Bearer"
```

### Example 5: Supress output, result will be passed or failed without extra information
```

jobs:
  build-and-test:
    runs-on: ubuntu-latest
          
    steps:
      - name: Code Checkout
        uses: actions/checkout@v2

      - name: Secret Demo
        uses: chiefus/secret_serfer@v0.1.0
        with:
          targets: "./"
          args: "--no-entropy"
          suppress_output: true
```