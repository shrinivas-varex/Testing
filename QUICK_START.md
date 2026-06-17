# Getting Started - Quick Guide

## ? Quick Start (Assume Node.js & Java Already Installed)

### 1. Install Dependencies
```powershell
npm install
npx playwright install chromium
```

### 2. Run Tests
```powershell
npm test
```

### 3. Generate & View Report
```powershell
# Set Java environment
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-21.0.11.10-hotspot"
$env:PATH += ";C:\Program Files\nodejs;$env:JAVA_HOME\bin"

# Generate report
npm run allure:generate

# Open report
npm run allure:open
```

---

## ?? Complete Setup (Fresh Machine)

### Step 1: Install Node.js
```powershell
winget install OpenJS.NodeJS
```

### Step 2: Install Java
```powershell
winget install EclipseAdoptium.Temurin.21.JDK
```

### Step 3: Configure Environment (One-time)
```powershell
# Add Node.js to PATH
$env:PATH += ";C:\Program Files\nodejs"

# Add Java to PATH (optional but recommended)
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-21.0.11.10-hotspot"
$env:PATH += ";$env:JAVA_HOME\bin"
```

### Step 4: Install Project Dependencies
```powershell
npm install
npx playwright install chromium
```

### Step 5: Run Tests
```powershell
npm test
```

### Step 6: Generate Report
```powershell
npm run allure:generate
```

### Step 7: View Report
```powershell
npm run allure:open
```

---

## ?? Test Scenarios

### Cargo Scanning Application Tests

The project includes 16 test cases organized by feature:

#### 1. **Authentication** (2 tests)
- Validates login page loads
- Verifies login form is displayed

#### 2. **Dashboard** (2 tests)
- Navigates after login
- Displays cargo list

#### 3. **Scan Operations** (3 tests)
- Allows barcode scanning
- Shows scan results
- Updates cargo status

#### 4. **Reporting** (3 tests)
- Generates daily reports
- Exports to PDF
- Shows statistics

#### 5. **Error Handling** (2 tests)
- Handles invalid barcodes
- Handles network timeouts

#### 6. **Performance** (2 tests)
- Dashboard loads in <5 seconds
- User actions respond in <1 second

#### 7. **Examples** (2 tests)
- Tests example.com functionality

---

## ?? Configuration

### Update Your Application URL

**File**: `tests/cargo-scanning.spec.js`

Find this line:
```javascript
await page.goto('https://example.com');
```

Replace with your cargo app URL:
```javascript
await page.goto('https://your-cargo-app.com');
```

### Adjust Test Timeout

**File**: `playwright.config.js`

```javascript
timeout: 30_000,  // milliseconds (currently 30 seconds)
```

### Run Tests in Headed Mode

```powershell
npm run test:headed
```

### Run Single Test File

```powershell
$env:PATH += ";C:\Program Files\nodejs"
npx playwright test tests/cargo-scanning.spec.js
```

### Run Specific Test

```powershell
$env:PATH += ";C:\Program Files\nodejs"
npx playwright test --grep "should allow scanning cargo barcode"
```

---

## ?? Allure Report Features

When you open the report at `http://127.0.0.1:PORT`, you'll see:

### Overview Tab
- Total tests run
- Pass/fail counts
- Execution time
- Test health

### Test Cases Tab
- Individual test details
- Pass/fail status
- Execution time
- Steps taken
- Logs and attachments

### Graphs Tab
- Pass/fail trends
- Timeline view
- Category breakdown
- Duration statistics

### Attachments Tab
- Screenshots from failures
- Video recordings
- Trace logs
- API response logs

---

## ?? Project Structure

```
playwright-project/
?
??? tests/
?   ??? example.spec.js              # Example tests
?   ??? cargo-scanning.spec.js       # Main test suite
?
??? playwright.config.js             # Framework configuration
??? package.json                     # Dependencies
??? README.md                        # Full documentation
??? PROJECT_SUMMARY.md               # Execution summary
?
??? allure-results/                  # Raw test data (auto-generated)
?   ??? *.result.json               # Individual test results
?   ??? *.container.json            # Test group data
?   ??? *.attachment               # Screenshots/videos
?
??? allure-report/                   # HTML report (auto-generated)
?   ??? index.html                  # Open this in browser
?   ??? assets/                     # Styles and scripts
?   ??? data/                       # Report data
?
??? test-results/                    # Playwright artifacts
    ??? screenshots/                # Failed test screenshots
    ??? videos/                     # Failed test recordings
```

---

## ?? Common Commands

```powershell
# Install everything
npm install && npx playwright install chromium

# Run all tests
npm test

# Run tests in headed mode
npm run test:headed

# Generate Allure report
npm run allure:generate

# Open Allure report
npm run allure:open

# View Playwright HTML report
npx playwright show-report
```

---

## ? Verification Checklist

After setup, verify:
- [ ] All 16 tests pass
- [ ] Allure results folder created (`allure-results/`)
- [ ] Allure report folder created (`allure-report/`)
- [ ] `allure-report/index.html` exists
- [ ] Report opens in browser without errors
- [ ] Test statistics show 16 passed

---

## ?? Troubleshooting

### Tests won't run
```powershell
# Ensure Node.js is in PATH
$env:PATH += ";C:\Program Files\nodejs"
node --version
npm --version
```

### Playwright browsers not found
```powershell
npx playwright install chromium
```

### Allure report won't generate
```powershell
# Ensure Java is in PATH
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-21.0.11.10-hotspot"
java -version
```

### Port already in use
```powershell
# Kill process on port 64622
Get-Process | Where-Object {$_.ProcessName -like "*node*"} | Stop-Process
```

---

## ?? Documentation Links

- **Playwright**: https://playwright.dev/docs
- **Allure**: https://docs.qameta.io/allure
- **Allure Playwright**: https://github.com/applitools/allure-playwright

---

## ?? Tips & Tricks

1. **Keep tests organized** - Use describe blocks to group related tests
2. **Use meaningful names** - Test names should describe what they test
3. **Add waits** - Use `waitForNavigation()` for page transitions
4. **Capture logs** - Use `test.info().attach()` for custom logs
5. **Run locally first** - Test all scripts locally before CI/CD

---

**Last Updated**: 2024
**Status**: ? Ready to Use
