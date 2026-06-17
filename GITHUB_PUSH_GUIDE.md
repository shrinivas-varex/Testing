# Push to GitHub Repository Guide

## ?? Prerequisites

Before pushing to GitHub, ensure you have:
- Git installed: https://git-scm.com/download/win
- GitHub account created
- Repository created: https://github.com/shrinivas-varex/Testing.git

## ?? Step-by-Step Guide

### Step 1: Verify Git Installation

```powershell
git --version
```

If not installed, download from: https://git-scm.com/download/win

### Step 2: Configure Git (First Time Only)

```powershell
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Step 3: Initialize Git Repository

Navigate to your project directory and run:

```powershell
cd C:\path\to\your\project

# Check if git is already initialized
git status

# If not initialized, initialize it:
git init
```

### Step 4: Add Remote Repository

```powershell
# Add the remote URL
git remote add origin https://github.com/shrinivas-varex/Testing.git

# Verify remote was added
git remote -v
```

### Step 5: Add All Files

```powershell
# Add all files
git add .

# Verify files to be committed
git status
```

### Step 6: Create Initial Commit

```powershell
git commit -m "Initial commit: Playwright + Allure test automation framework"
```

### Step 7: Create Main Branch (if needed)

```powershell
# Check current branch
git branch

# Create and switch to main branch
git branch -M main
```

### Step 8: Push to GitHub

```powershell
# Push to GitHub
git push -u origin main

# Or if using main branch created locally:
git push origin main
```

### Step 9: Enter GitHub Credentials

- **Method 1: Personal Access Token (Recommended)**
  1. Go to GitHub ? Settings ? Developer settings ? Personal access tokens ? Tokens (classic)
  2. Generate new token
  3. Select scopes: repo (full control), workflow
  4. Copy token
  5. When prompted, paste token as password

- **Method 2: SSH Key**
  1. Generate SSH key: `ssh-keygen -t rsa -b 4096`
  2. Add to GitHub SSH keys
  3. Use SSH URL: `git@github.com:shrinivas-varex/Testing.git`

## ? Verification

After pushing, verify on GitHub:

```
1. Go to: https://github.com/shrinivas-varex/Testing
2. Verify all files are there
3. Check if workflows are visible in Actions tab
```

## ?? Regular Updates

To push future changes:

```powershell
# 1. Check status
git status

# 2. Add changes
git add .

# 3. Commit
git commit -m "Description of changes"

# 4. Push
git push origin main
```

## ?? After First Push

Once pushed to GitHub:

1. **Workflows Activate Automatically**
   - Go to Actions tab
   - Workflows start running
   - Monitor in real-time

2. **Check Workflow Results**
   - Actions ? Latest run
   - View logs
   - Download artifacts

3. **View Test Reports**
   - Download allure-report artifact
   - Open index.html in browser

## ?? All-in-One Command

If you want to do everything at once (after git init):

```powershell
git remote add origin https://github.com/shrinivas-varex/Testing.git
git add .
git commit -m "Initial commit: Playwright + Allure framework"
git branch -M main
git push -u origin main
```

## ?? Troubleshooting

### Error: "fatal: 'origin' does not appear to be a 'git' repository"

**Solution:** Remove and re-add remote:
```powershell
git remote remove origin
git remote add origin https://github.com/shrinivas-varex/Testing.git
```

### Error: "Authentication failed"

**Solution:** Use Personal Access Token
1. GitHub ? Settings ? Developer settings ? Personal access tokens
2. Generate token with `repo` and `workflow` scopes
3. Use token as password when prompted

### Error: "Please tell me who you are"

**Solution:** Configure Git user:
```powershell
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Files Not Showing on GitHub

**Solution:** Check .gitignore
```powershell
# Verify files were added
git status

# If files are ignored, update .gitignore
# Then add again
git add .
git commit -m "Update"
git push
```

## ?? Quick Commands Reference

```powershell
# Check repository status
git status

# View commit history
git log --oneline

# View remote URL
git remote -v

# Change remote URL
git remote set-url origin <new-url>

# View branches
git branch -a

# Create new branch
git checkout -b feature-branch

# Switch to main
git checkout main

# Delete branch
git branch -d feature-branch
```

## ?? Success Indicators

? All files uploaded to GitHub
? Workflows visible in Actions tab
? Allure report published (if configured)
? Tests running on every push
? Artifacts available for download

## ?? Need Help?

- Git Documentation: https://git-scm.com/doc
- GitHub Help: https://docs.github.com
- Personal Access Token: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token

---

**Ready?** Follow steps 1-8 above and your project will be on GitHub!
