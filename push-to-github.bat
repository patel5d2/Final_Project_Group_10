@echo off
REM Quick GitHub Push Script
REM This will push your code to GitHub after you create a repository

echo ========================================
echo Push to GitHub - Room Booking System
echo ========================================
echo.
echo Before running this script:
echo 1. Create a repository on GitHub.com
echo 2. Copy the repository URL
echo 3. Have your GitHub credentials ready
echo.
echo Press any key when ready...
pause >nul
echo.

cd /d "C:\Users\user\Desktop\Class server\Final_Project_Group_10"

echo Enter your GitHub username:
set /p username="> "
echo.

echo Enter your repository name (e.g., Final_Project_Group_10):
set /p reponame="> "
echo.

echo Your repository URL will be:
echo https://github.com/%username%/%reponame%.git
echo.
echo Is this correct? (Y/N)
set /p confirm="> "

if /i not "%confirm%"=="Y" (
    echo Cancelled. Please run the script again.
    pause
    exit
)

echo.
echo ========================================
echo Step 1: Checking Git status...
echo ========================================
git status
echo.

echo ========================================
echo Step 2: Adding remote repository...
echo ========================================
git remote add origin https://github.com/%username%/%reponame%.git
echo Remote added successfully!
echo.

echo ========================================
echo Step 3: Renaming branch to main...
echo ========================================
git branch -M main
echo Branch renamed to main!
echo.

echo ========================================
echo Step 4: Pushing to GitHub...
echo ========================================
echo You may be prompted for your GitHub credentials.
echo.
git push -u origin main
echo.

echo ========================================
echo Step 5: Pushing all branches...
echo ========================================
git push --all origin
echo.

echo ========================================
echo SUCCESS! Your code is now on GitHub!
echo ========================================
echo.
echo Repository URL:
echo https://github.com/%username%/%reponame%
echo.
echo Next steps:
echo 1. Visit your repository on GitHub
echo 2. Verify all files are uploaded
echo 3. Check that all branches are visible
echo 4. Take screenshots for your assignment
echo 5. Copy the repository URL for submission
echo.
echo Repository URL for submission:
echo https://github.com/%username%/%reponame%
echo.
pause
