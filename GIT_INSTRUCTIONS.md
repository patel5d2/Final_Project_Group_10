# Git Commit Instructions for Milestone Documentation

## 📸 Git Commands to Complete Your Milestone

Follow these steps to create the required commits and branches for your milestone documentation.

---

## Step 1: Initialize Git Repository (If Not Done)

```bash
cd "C:\Users\user\Desktop\Class server\Final_Project_Group_10"
git init
git add .
git commit -m "Initial commit: ASP.NET Core MVC project setup"
```

---

## Step 2: Create Additional Commits

### Commit 1: Add Home Controller
```bash
git add Final_Project_Group_10/Controllers/HomeController.cs
git add Final_Project_Group_10/Views/Home/
git commit -m "Add HomeController with Index, Privacy, and Error actions"
```

### Commit 2: Add Rooms Controller and Models
```bash
git add Final_Project_Group_10/Controllers/RoomsController.cs
git add Final_Project_Group_10/Models/Room.cs
git add Final_Project_Group_10/Models/Booking.cs
git commit -m "Add RoomsController and Room/Booking models"
```

### Commit 3: Add Room Views
```bash
git add Final_Project_Group_10/Views/Rooms/
git commit -m "Add Room views (Index, Details, Create)"
```

### Commit 4: Update Home Page and Navigation
```bash
git add Final_Project_Group_10/Views/Home/Index.cshtml
git add Final_Project_Group_10/Views/Shared/_Layout.cshtml
git commit -m "Update homepage and add Rooms navigation link"
```

### Commit 5: Add Documentation
```bash
git add README.md
git add DATABASE_DESIGN.md
git commit -m "Add comprehensive README and database design documentation"
```

---

## Step 3: Create Feature Branches

### Create and work on feature/rooms branch
```bash
# Create the branch
git branch feature/rooms

# Switch to the branch
git checkout feature/rooms

# Make a change (e.g., edit RoomsController.cs comments)
# Then commit
git add Final_Project_Group_10/Controllers/RoomsController.cs
git commit -m "Enhance RoomsController with additional comments"

# Switch back to main
git checkout main
```

### Create feature/auth branch (for future authentication)
```bash
git branch feature/auth
```

### Create develop branch
```bash
git branch develop
```

---

## Step 4: View Your Branches

```bash
git branch
```

Expected output:
```
  develop
  feature/auth
  feature/rooms
* main
```

---

## Step 5: View Commit History

```bash
git log --oneline --graph --all
```

This will show all your commits and branches in a nice visual format.

---

## Step 6: Push to GitHub

### Create a new repository on GitHub first, then:

```bash
# Add GitHub remote
git remote add origin https://github.com/YOUR_USERNAME/Final_Project_Group_10.git

# Push main branch
git push -u origin main

# Push all branches
git push --all origin
```

---

## 📋 Verification Checklist

Before submitting your milestone, verify:

- [ ] ✅ At least **4 commits** made
  ```bash
  git log --oneline
  ```

- [ ] ✅ At least **2 branches** created (besides main)
  ```bash
  git branch
  ```

- [ ] ✅ **2 controllers** exist
  - HomeController.cs
  - RoomsController.cs

- [ ] ✅ **Multiple views** created
  - Home/Index.cshtml
  - Home/Privacy.cshtml
  - Rooms/Index.cshtml (need to create manually)
  - Rooms/Details.cshtml (need to create manually)
  - Rooms/Create.cshtml (need to create manually)

- [ ] ✅ Project builds successfully
  ```bash
  dotnet build
  ```

- [ ] ✅ Project runs without errors
  ```bash
  dotnet run
  ```

---

## 🎯 Screenshot Requirements

Take screenshots of the following for your submission:

### 1. Git Commit History
```bash
git log --oneline
```
📸 Screenshot showing at least 4 commits

### 2. Git Branches
```bash
git branch
```
📸 Screenshot showing multiple branches

### 3. GitHub Repository
📸 Screenshot of your GitHub repository page showing:
- Repository name
- Branches dropdown showing all branches
- Recent commits

### 4. Project Structure
📸 Screenshot of your Solution Explorer showing:
- Controllers folder with HomeController and RoomsController
- Models folder with Room and Booking models
- Views folder with Home and Rooms subfolders

### 5. Running Application
```bash
dotnet run
```
📸 Screenshots of:
- Homepage (localhost:5001)
- Rooms listing page
- Room details page

---

## 🚀 Quick Reference Commands

### Check Status
```bash
git status
```

### View Branches
```bash
git branch -a
```

### Switch Branches
```bash
git checkout BRANCH_NAME
```

### View Remote
```bash
git remote -v
```

### Pull Latest Changes
```bash
git pull origin main
```

### See Differences
```bash
git diff
```

---

## 📝 Suggested Commit Messages

Use clear, descriptive commit messages:

✅ Good examples:
- "Add RoomsController with CRUD operations"
- "Create Room and Booking models with validation"
- "Update navigation to include Rooms link"
- "Add comprehensive README documentation"

❌ Bad examples:
- "update"
- "fix"
- "changes"
- "asdf"

---

## 🔧 Troubleshooting

### If you get "not a git repository" error:
```bash
git init
```

### If you need to undo last commit:
```bash
git reset --soft HEAD~1
```

### If you want to see what changed in a commit:
```bash
git show COMMIT_HASH
```

### If you accidentally committed to wrong branch:
```bash
git reset --soft HEAD~1
git stash
git checkout correct-branch
git stash pop
git commit -m "Your message"
```

---

**Remember:** Commit early, commit often! Each meaningful change should be a separate commit.

Good luck with your milestone submission! 🎉
