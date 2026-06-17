Playwright Cargo Scanning App - Test Automation & Allure Reporting

Project Overview

This project demonstrates automated testing for a cargo scanning application using:
- **Playwright Test** - End-to-end testing framework
- **Allure Report** - Beautiful test reporting with analytics
- **Node.js** - JavaScript runtime

Features

- 10+ test cases covering cargo scanning workflows
- Authentication testing
- Dashboard functionality tests
- Scan operations tests
- Reporting & export tests
- Error handling validation
- Performance benchmarks
- Automatic screenshot capture on failures
- Video recording on failures
- Detailed trace logs

Prerequisites

- Node.js 14+ (installed via winget: `winget install OpenJS.NodeJS`)
- Java 11+ for Allure report generation (installed via winget: `winget install EclipseAdoptium.Temurin.21.JDK`)

Installation

1. Install npm dependencies:
   ```
   npm install
   ```

2. Install Playwright browsers:
   ```
   npx playwright install chromium
   ```

Running Tests

Execute all tests:
```
npm test
```

Run tests in headed mode (see browser):
```
npm run test:headed
```

Generate Allure Report

After running tests, generate the Allure report:
```
npm run allure:generate
```

Open the generated report in browser:
```
npm run allure:open
```

The report will include:
- Test execution statistics
- Success/failure trends
- Detailed test steps
- Screenshots from failed tests
- Video playback of test execution
- Trace logs for debugging
- Test timeline

Project Structure

```
??? tests/
?   ??? example.spec.js           # Example tests
?   ??? cargo-scanning.spec.js    # Cargo app test suite
??? playwright.config.js          # Playwright configuration
??? package.json                  # Dependencies and scripts
??? allure-results/              # Generated test results (auto-created)
??? allure-report/               # Generated HTML report (auto-created)
??? README.md                     # This file
```

Test Suites

1. **Authentication Tests** - Login page validation
2. **Dashboard Tests** - Navigation and display
3. **Scan Operations** - Barcode scanning workflows
4. **Reporting** - Report generation and export
5. **Error Handling** - Graceful failure scenarios
6. **Performance** - Load time and response metrics

Customization

Update Test URL

Edit `tests/cargo-scanning.spec.js` and replace `https://example.com` with your actual cargo app URL.

Add More Tests

Create new files in `tests/` directory with `.spec.js` extension:
```
tests/your-feature.spec.js
```

Adjust Timeouts

Edit `playwright.config.js`:
```javascript
timeout: 30_000,  // 30 seconds
```

Parallel Execution

Change `workers` in `playwright.config.js`:
```javascript
workers: 4,  // Run 4 tests in parallel
```

CI/CD Integration

The project is ready for CI/CD pipelines. Results are written to `allure-results/` and can be published to Allure TestOps or other platforms.

Troubleshooting

If browsers not installed:
```
npx playwright install --with-deps
```

If Java not found:
Set JAVA_HOME before running allure:
```powershell
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-21.0.11.10-hotspot"
```

View HTML Report

Open `allure-report/index.html` directly in browser if `allure:open` doesn't work.

Notes

- Default headless mode: set `headless: false` in config for headed mode
- Screenshots saved on failure in `test-results/`
- Videos saved on failure in `test-results/`
- Traces for debugging in `test-results/`
