# GitHub Actions Setup Guide

## ?? Overview

This project includes two GitHub Actions workflows:
1. **playwright-tests.yml** - Runs Playwright tests and generates Allure reports
2. **publish-report.yml** - Publishes Allure reports to GitHub Pages

## ?? Getting Started

### Prerequisites
- GitHub repository created
- Repository linked to this project
- GitHub Actions enabled (default)

### Step 1: Enable GitHub Pages

1. Go to your repository on GitHub
2. Settings ? Pages
3. Source: Deploy from a branch
4. Branch: gh-pages
5. Save

### Step 2: (Optional) Set Up Slack Notifications

To receive Slack notifications on test failures/success:

1. Create a Slack Webhook:
   - Go to https://api.slack.com/apps
   - Create New App ? From scratch
   - Name: "Playwright Tests"
   - Workspace: Select your workspace
   - Features ? Incoming Webhooks
   - Add New Webhook to Workspace
   - Copy the Webhook URL

2. Add to GitHub Secrets:
   - Repository Settings ? Secrets and variables ? Actions
   - New repository secret
   - Name: `SLACK_WEBHOOK`
   - Value: Paste the webhook URL
   - Save

## ?? Workflow Details

### playwright-tests.yml

**Triggers:**
- Push to `main` or `develop` branches
- Pull Requests to `main` or `develop` branches
- Daily at 8 AM UTC (scheduled)

**Jobs:**
1. Checkout code
2. Setup Node.js 20.x
3. Install dependencies (npm ci)
4. Install Playwright browsers
5. Run tests
6. Setup Java
7. Generate Allure report
8. Upload artifacts:
   - allure-results
   - allure-report
   - playwright-report
   - test-results
9. Publish test report
10. Comment on PR with results (if PR)
11. Send Slack notifications (optional)

**Artifacts Retention:** 30 days

### publish-report.yml

**Triggers:**
- After `playwright-tests.yml` completes
- Manual workflow dispatch

**Jobs:**
1. Download Allure report artifact
2. Publish to GitHub Pages
3. Comment deployment status

## ?? How to Use

### Automatic Execution

Once pushed to GitHub, workflows run automatically on:
- Every push to `main` or `develop`
- Every pull request
- Daily schedule (8 AM UTC)

### Manual Execution

To manually trigger the workflow:

1. GitHub ? Actions
2. Select workflow: "Playwright Tests with Allure Report"
3. Click "Run workflow"
4. Select branch
5. Click green "Run workflow" button

### View Results

#### In GitHub Actions

1. Go to Actions tab
2. Select latest workflow run
3. View logs in real-time
4. Check artifacts section

#### Download Artifacts

1. Actions ? Latest run
2. Scroll to "Artifacts"
3. Download:
   - allure-report-20.x
   - playwright-report-20.x
   - test-results-20.x

#### View Allure Report

**Online (GitHub Pages):**
- URL: `https://<your-username>.github.io/Testing/`

**Locally:**
1. Download `allure-report-20.x` artifact
2. Extract
3. Open `index.html` in browser

## ?? Configuration

### Change Node Version

Edit `.github/workflows/playwright-tests.yml`:
```yaml
matrix:
  node-version: [20.x]  # Change version here
```

### Change Schedule

Edit `.github/workflows/playwright-tests.yml`:
```yaml
schedule:
  - cron: '0 8 * * *'  # Change cron expression
```

### Change Test Branches

Edit `.github/workflows/playwright-tests.yml`:
```yaml
on:
  push:
    branches: [ main, develop ]  # Add/remove branches
  pull_request:
    branches: [ main, develop ]  # Add/remove branches
```

## ?? Workflow Status Badge

Add to your README.md:

```markdown
[![Playwright Tests](https://github.com/<your-username>/Testing/actions/workflows/playwright-tests.yml/badge.svg?branch=main)](https://github.com/<your-username>/Testing/actions)
```

## ?? Secrets & Permissions

### Required Secrets (Optional)
- `SLACK_WEBHOOK` - For Slack notifications

### Required Permissions
All enabled by default in GitHub Actions

## ?? Monitoring

### GitHub Actions Dashboard
- Repository ? Actions tab
- Real-time workflow execution
- Build history
- Performance metrics

### Artifact Storage
- 30-day retention
- Automatic cleanup after retention period
- Manual deletion available

## ?? Troubleshooting

### Tests Fail but Show Success
- Check logs: Actions ? Run details
- Look for test failures in logs
- Check artifacts for detailed reports

### Allure Report Not Generated
- Verify Java is installed (automatic)
- Check logs for Allure errors
- Verify allure-results folder exists

### GitHub Pages Not Publishing
- Verify repository Settings ? Pages
- Ensure gh-pages branch exists
- Check publish-report.yml run logs

### Slack Notifications Not Received
- Verify SLACK_WEBHOOK secret is set
- Check webhook URL is valid
- Look for errors in workflow logs

## ?? Notification Examples

### Success Notification
```
? Playwright Test Suite Passed
Repository: owner/Testing
Branch: main
```

### Failure Notification
```
? Playwright Tests Failed
Repository: owner/Testing
Branch: main
```

## ?? Related Files

- `.github/workflows/playwright-tests.yml` - Main test workflow
- `.github/workflows/publish-report.yml` - Report publishing
- `package.json` - Dependencies and scripts
- `playwright.config.js` - Playwright configuration
- `tests/` - Test files

## ?? Next Steps

1. ? Commit and push to GitHub
2. ? Go to Actions tab
3. ? Watch workflow run
4. ? Download artifacts
5. ? View Allure report
6. ? (Optional) Set up GitHub Pages

## ?? Tips

- Tests run on latest Windows & Ubuntu (configurable)
- Artifacts keep for 30 days
- Workflows are free for public repos
- Can view logs in real-time
- Parallel runs possible with matrix strategy

## ?? Support

For issues, check:
1. GitHub Actions logs
2. This guide's troubleshooting section
3. GitHub Actions documentation: https://docs.github.com/actions
4. Playwright docs: https://playwright.dev
5. Allure docs: https://docs.qameta.io/allure
