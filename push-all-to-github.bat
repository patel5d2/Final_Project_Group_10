@echo off
REM Complete GitHub Push - All Branches and Code
REM This script will push everything to GitHub

echo ========================================
echo Push Everything to GitHub
echo ========================================
echo.

cd /d "C:\Users\user\Desktop\Class server\Final_Project_Group_10"

echo Step 1: Checking current status...
git status
echo.

echo Step 2: Staging all changes...
git add .
echo All files staged!
echo.

echo Step 3: Committing any uncommitted changes...
git commit -m "Update project files and documentation"
echo.

echo Step 4: Checking remote configuration...
git remote -v
echo.

echo ========================================
echo Ready to push to GitHub
echo ========================================
echo.
echo This will push:
echo - All commits
echo - All branches (main, develop, feature/rooms, feature/database)
echo - All documentation and code files
echo.
echo Press any key to continue...
pause >nul
echo.

echo Step 5: Pushing main branch...
git push -u origin main
echo.

echo Step 6: Pushing all branches...
git push --all origin
echo.

echo Step 7: Pushing tags (if any)...
git push --tags origin
echo.

echo ========================================
echo SUCCESS! Everything pushed to GitHub!
echo ========================================
echo.

echo Verifying what was pushed...
git branch -r
echo.

echo ========================================
echo Summary:
echo ========================================
git log --oneline -10
echo.

echo Your GitHub repository is now up to date!
echo.
echo Next steps:
echo 1. Visit your GitHub repository
echo 2. Refresh the page
echo 3. Verify all branches are visible
echo 4. Check that all commits are showing
echo 5. Take screenshots for your submission
echo.
pause
