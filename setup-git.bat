@echo off
REM Git Setup and Commit Script for Room Booking System
REM Run this script to initialize Git and create multiple commits

echo ========================================
echo Git Setup for Room Booking System
echo ========================================
echo.

cd /d "C:\Users\user\Desktop\Class server\Final_Project_Group_10"

echo Step 1: Initialize Git repository...
git init
echo.

echo Step 2: Check status...
git status
echo.

echo Step 3: Create .gitignore file...
(
echo bin/
echo obj/
echo .vs/
echo *.user
echo *.suo
echo *.cache
echo .vscode/
echo appsettings.Development.json
) > .gitignore
echo .gitignore created!
echo.

echo Step 4: Commit 1 - Initial project setup
git add Final_Project_Group_10.sln
git add Final_Project_Group_10/Final_Project_Group_10.csproj
git add Final_Project_Group_10/Program.cs
git add Final_Project_Group_10/appsettings.json
git add .gitignore
git commit -m "Initial commit: ASP.NET Core MVC project setup"
echo.

echo Step 5: Commit 2 - Add HomeController and views
git add Final_Project_Group_10/Controllers/HomeController.cs
git add Final_Project_Group_10/Models/ErrorViewModel.cs
git add Final_Project_Group_10/Views/Home/
git add Final_Project_Group_10/Views/Shared/
git add Final_Project_Group_10/Views/_ViewImports.cshtml
git add Final_Project_Group_10/Views/_ViewStart.cshtml
git commit -m "Add HomeController with Index, Privacy, and Error actions"
echo.

echo Step 6: Commit 3 - Add RoomsController and Models
git add Final_Project_Group_10/Controllers/RoomsController.cs
git add Final_Project_Group_10/Models/Room.cs
git add Final_Project_Group_10/Models/Booking.cs
git commit -m "Add RoomsController and Room/Booking models with validation"
echo.

echo Step 7: Commit 4 - Update views and navigation
git add Final_Project_Group_10/Views/Home/Index.cshtml
git add Final_Project_Group_10/Views/Shared/_Layout.cshtml
git commit -m "Update homepage design and add Rooms navigation link"
echo.

echo Step 8: Commit 5 - Add documentation files
git add README.md
git add DATABASE_DESIGN.md
git add GIT_INSTRUCTIONS.md
git commit -m "Add comprehensive project documentation (README, DB Design, Git guide)"
echo.

echo Step 9: Commit 6 - Add additional documentation
git add NEXT_MILESTONE.md
git add PROJECT_SUMMARY.md
git add MANUAL_STEPS_REQUIRED.md
git add QUICK_START.md
git commit -m "Add milestone guides and quick start documentation"
echo.

echo Step 10: Create feature branches
git branch develop
git branch feature/rooms
git branch feature/database
echo Branches created: develop, feature/rooms, feature/database
echo.

echo Step 11: View commit history
git log --oneline --graph --all
echo.

echo Step 12: View all branches
git branch -a
echo.

echo ========================================
echo Git setup complete!
echo ========================================
echo.
echo Total commits: 6
echo Total branches: 4 (main, develop, feature/rooms, feature/database)
echo.
echo Next steps:
echo 1. Create Views\Rooms folder and add view files
echo 2. Commit the view files: git add Views/Rooms/ && git commit -m "Add Room views"
echo 3. Create GitHub repository
echo 4. Add remote: git remote add origin YOUR_GITHUB_URL
echo 5. Push to GitHub: git push -u origin main && git push --all
echo.
pause
