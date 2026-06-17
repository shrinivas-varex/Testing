# CI/CD Configuration & Deployment Guide

## ?? Overview

This project includes automated CI/CD pipelines that:
- ? Run tests automatically on push/PR
- ? Generate Allure reports
- ? Store test results
- ? Publish reports to GitHub Pages
- ? Send notifications
- ? Run on schedule

## ?? Workflow Files

### `.github/workflows/playwright-tests.yml`
**Main Test Execution Workflow**

Triggers:
- Push to main/develop
- Pull requests
- Daily schedule (8 AM UTC)

Runs:
- Node.js 20.x
- Windows Latest

Actions:
1. Checkout code
2. Setup Node.js
3. Install dependencies
4. Install Playwright browsers
5. Run tests
6. Setup Java
7. Generate Allure report
8. Upload artifacts
9. Publish test report
10. Comment on PR
11. Send Slack notifications

### `.github/workflows/publish-report.yml`
**Report Publishing Workflow**

Triggers:
- After tests complete
- Manual dispatch

Actions:
1. Download artifacts
2. Publish to GitHub Pages
3. Comment status

## ?? Deployment Steps

### Step 1: Initialize Git Repository

```powershell
cd your-project-directory
git init
```

### Step 2: Add GitHub Remote

```powershell
git remote add origin https://github.com/shrinivas-varex/Testing.git
git branch -M main
```

### Step 3: Commit and Push

```powershell
git add .
git commit -m "Initial commit: Playwright + Allure framework"
git push -u origin main
```

### Step 4: Enable GitHub Pages

1. Go to repository Settings
2. Pages ? Source: Deploy from branch
3. Branch: gh-pages
4. Save

### Step 5: Monitor Workflows

1. Go to Actions tab
2. Watch workflows execute
3. Download artifacts

## ?? Workflow Execution

### First Run

```
Timeline:
1. Push to main ? workflow triggers
2. Tests run (~30 seconds)
3. Allure report generated (~10 seconds)
4. Artifacts uploaded
5. GitHub Pages deployed
```

### Subsequent Runs

Same process repeats for every push/PR/scheduled time

## ?? Results & Artifacts

### Available Artifacts

After each run, download:
- **allure-report-20.x** - Beautiful HTML report
- **playwright-report-20.x** - Playwright reporter
- **test-results-20.x** - Raw test results
- **allure-results-20.x** - Allure result data

### Artifact Retention

Default: 30 days
- Change in workflow YAML if needed:
  ```yaml
  retention-days: 90  # Change number
  ```

### GitHub Pages URL

```
https://<username>.github.io/Testing/
```

## ?? Configuration Options

### Change Workflow Schedule

Edit `.github/workflows/playwright-tests.yml`:

```yaml
schedule:
  - cron: '0 8 * * *'  # Default: Daily 8 AM UTC
```

Cron examples:
- `'0 * * * *'` - Every hour
- `'0 8 * * MON'` - Every Monday at 8 AM
- `'0 0 * * *'` - Daily at midnight
- `'*/30 * * * *'` - Every 30 minutes

### Change Node Version

```yaml
matrix:
  node-version: [20.x]  # Change here
```

Available: 18.x, 20.x, 21.x

### Change Test Branches

```yaml
on:
  push:
    branches: [ main, develop, staging ]
  pull_request:
    branches: [ main, develop ]
```

### Add Parallel Testing

```yaml
strategy:
  matrix:
    node-version: [18.x, 20.x, 21.x]
    os: [ubuntu-latest, windows-latest]
```

## ?? Secrets Management

### Slack Notifications (Optional)

1. Create Slack Webhook:
   - https://api.slack.com/apps ? Create App
   - Incoming Webhooks ? Add New
   - Copy Webhook URL

2. Add to GitHub Secrets:
   - Repository Settings ? Secrets ? New secret
   - Name: `SLACK_WEBHOOK`
   - Value: Webhook URL

3. Workflow automatically sends notifications

### GitHub Token

- Automatically provided by GitHub
- Used for: uploading artifacts, publishing reports
- No manual setup needed

## ?? Monitoring & Notifications

### GitHub Actions UI

- Real-time workflow execution
- Live logs
- Artifact download
- Status badges

### Slack Notifications (if configured)

- ? Success notifications
- ? Failure notifications
- Quick links to workflow runs

### Email Notifications

- Default: GitHub sends emails
- Can configure in repository settings

## ?? Workflow Status Badge

Add to README.md:

```markdown
[![Playwright Tests](https://github.com/shrinivas-varex/Testing/actions/workflows/playwright-tests.yml/badge.svg?branch=main)](https://github.com/shrinivas-varex/Testing/actions/workflows/playwright-tests.yml)
```

## ?? Common Scenarios

### Run Tests After Push

1. Make changes to test files
2. `git add .`
3. `git commit -m "Update tests"`
4. `git push origin main`
5. Workflow automatically runs
6. Check Actions tab for results

### Manually Trigger Workflow

1. GitHub ? Actions tab
2. Select "Playwright Tests with Allure Report"
3. "Run workflow" ? Select branch ? "Run workflow"

### View Failed Tests

1. Actions ? Latest run
2. Click run details
3. View "Run Playwright tests" step
4. Scroll through logs
5. Download artifacts for more details

### Download Test Reports

1. Actions ? Latest run
2. Scroll to "Artifacts" section
3. Download desired artifact
4. Extract and open index.html

### Debug Test Failure

1. Download allure-report artifact
2. Open allure-report/index.html
3. Check failed test details
4. View screenshots/videos
5. Review trace logs

## ?? Continuous Integration Flow

```
Code Changes
    ?
Git Push to GitHub
    ?
Workflow Triggered
    ?
[Checkout] ? [Setup Node] ? [Install Dependencies]
    ?
[Install Browsers] ? [Run Tests] ? [Setup Java]
    ?
[Generate Report] ? [Upload Artifacts]
    ?
[GitHub Pages] ? [Slack Notification]
    ?
Reports Available
```

## ?? Performance Optimization

### Speed Up Builds

1. Use `npm ci` instead of `npm install`
   - ? Already configured

2. Cache dependencies:
   ```yaml
   - uses: actions/setup-node@v4
     with:
       cache: 'npm'  # ? Already enabled
   ```

3. Run tests in parallel:
   ```yaml
   strategy:
     matrix:
       test-suite: [auth, dashboard, scanning]
   ```

### Reduce Artifact Size

1. Change retention days:
   ```yaml
   retention-days: 14  # Default: 30
   ```

2. Exclude unnecessary files in .gitignore

## ?? Troubleshooting

### Workflow Not Triggering

**Check:**
1. Repository settings ? Actions enabled
2. Branch protection rules
3. Workflow file in `.github/workflows/`
4. YAML syntax valid

**Solution:**
```powershell
# Validate YAML syntax
npm install -g yamllint
yamllint .github/workflows/
```

### Tests Failing in Actions but Pass Locally

**Check:**
1. Different Node version
2. Environment variables
3. Playwright browser version
4. Missing dependencies

**Solution:**
```powershell
# Use same Node version locally
nvm install 20
nvm use 20
npm test
```

### Artifacts Not Uploading

**Check:**
1. Artifacts path correct
2. Files exist after tests
3. Permissions correct

**Solution:**
```yaml
# Verify path in workflow
- name: Upload Allure report
  if: always()
  uses: actions/upload-artifact@v4
  with:
    path: allure-report  # Verify directory exists
```

### GitHub Pages Not Publishing

**Check:**
1. Settings ? Pages enabled
2. Branch set to gh-pages
3. Publish report workflow ran

**Solution:**
1. Go to Settings ? Pages
2. Ensure "Deploy from a branch" selected
3. Select gh-pages branch
4. Save and wait 1-2 minutes

## ?? Related Documentation

- `GITHUB_ACTIONS_SETUP.md` - Setup guide
- `GITHUB_PUSH_GUIDE.md` - How to push code
- `.github/workflows/playwright-tests.yml` - Main workflow
- `.github/workflows/publish-report.yml` - Publishing workflow

## ?? Next Steps

1. ? Commit code locally
2. ? Push to GitHub
3. ? Go to Actions tab
4. ? Monitor first run
5. ? Download artifacts
6. ? Enable GitHub Pages
7. ? View Allure report online

## ?? Best Practices

- ? Commit frequently
- ? Use meaningful commit messages
- ? Monitor workflow runs
- ? Download and review reports
- ? Update tests for new features
- ? Keep dependencies updated
- ? Archive old reports

## ?? Support

- GitHub Actions: https://docs.github.com/actions
- Playwright: https://playwright.dev
- Allure: https://docs.qameta.io/allure

---

**Ready?** Follow GITHUB_PUSH_GUIDE.md to push your code!
