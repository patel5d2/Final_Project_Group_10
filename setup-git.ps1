# PowerShell Git Setup Script
# Run this in PowerShell to set up Git with frequent commits

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Git Setup for Room Booking System" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Set-Location "C:\Users\user\Desktop\Class server\Final_Project_Group_10"

# Step 1: Initialize Git
Write-Host "Step 1: Initializing Git repository..." -ForegroundColor Yellow
git init
Write-Host ""

# Step 2: Create .gitignore
Write-Host "Step 2: Creating .gitignore file..." -ForegroundColor Yellow
@"
bin/
obj/
.vs/
*.user
*.suo
*.cache
.vscode/
appsettings.Development.json
"@ | Out-File -FilePath ".gitignore" -Encoding UTF8
Write-Host ".gitignore created!" -ForegroundColor Green
Write-Host ""

# Commit 1: Initial project setup
Write-Host "Commit 1: Initial project setup" -ForegroundColor Yellow
git add Final_Project_Group_10.sln
git add Final_Project_Group_10/Final_Project_Group_10.csproj
git add Final_Project_Group_10/Program.cs
git add Final_Project_Group_10/appsettings.json
git add .gitignore
git commit -m "Initial commit: ASP.NET Core MVC project setup"
Write-Host "✓ Committed!" -ForegroundColor Green
Write-Host ""

# Commit 2: HomeController
Write-Host "Commit 2: Add HomeController and views" -ForegroundColor Yellow
git add Final_Project_Group_10/Controllers/HomeController.cs
git add Final_Project_Group_10/Models/ErrorViewModel.cs
git add Final_Project_Group_10/Views/Home/
git add Final_Project_Group_10/Views/Shared/
git add Final_Project_Group_10/Views/_ViewImports.cshtml
git add Final_Project_Group_10/Views/_ViewStart.cshtml
git commit -m "Add HomeController with Index, Privacy, and Error actions"
Write-Host "✓ Committed!" -ForegroundColor Green
Write-Host ""

# Commit 3: RoomsController and Models
Write-Host "Commit 3: Add RoomsController and Models" -ForegroundColor Yellow
git add Final_Project_Group_10/Controllers/RoomsController.cs
git add Final_Project_Group_10/Models/Room.cs
git add Final_Project_Group_10/Models/Booking.cs
git commit -m "Add RoomsController and Room/Booking models with validation"
Write-Host "✓ Committed!" -ForegroundColor Green
Write-Host ""

# Commit 4: Update views
Write-Host "Commit 4: Update views and navigation" -ForegroundColor Yellow
git add Final_Project_Group_10/Views/Home/Index.cshtml
git add Final_Project_Group_10/Views/Shared/_Layout.cshtml
git commit -m "Update homepage design and add Rooms navigation link"
Write-Host "✓ Committed!" -ForegroundColor Green
Write-Host ""

# Commit 5: Documentation part 1
Write-Host "Commit 5: Add core documentation" -ForegroundColor Yellow
git add README.md
git add DATABASE_DESIGN.md
git add GIT_INSTRUCTIONS.md
git commit -m "Add comprehensive project documentation (README, DB Design, Git guide)"
Write-Host "✓ Committed!" -ForegroundColor Green
Write-Host ""

# Commit 6: Documentation part 2
Write-Host "Commit 6: Add additional documentation" -ForegroundColor Yellow
git add NEXT_MILESTONE.md
git add PROJECT_SUMMARY.md
git add MANUAL_STEPS_REQUIRED.md
git add QUICK_START.md
git add setup-git.bat
git add setup-git.ps1
git commit -m "Add milestone guides and quick start documentation"
Write-Host "✓ Committed!" -ForegroundColor Green
Write-Host ""

# Create branches
Write-Host "Creating feature branches..." -ForegroundColor Yellow
git branch develop
git branch feature/rooms
git branch feature/database
Write-Host "✓ Branches created: develop, feature/rooms, feature/database" -ForegroundColor Green
Write-Host ""

# Show results
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Commit History:" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
git log --oneline --graph --all
Write-Host ""

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "All Branches:" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
git branch -a
Write-Host ""

Write-Host "========================================" -ForegroundColor Green
Write-Host "Git setup complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Summary:" -ForegroundColor White
Write-Host "  Total commits: 6" -ForegroundColor White
Write-Host "  Total branches: 4 (main, develop, feature/rooms, feature/database)" -ForegroundColor White
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "  1. Create Views\Rooms folder and add view files" -ForegroundColor White
Write-Host "  2. Commit the view files:" -ForegroundColor White
Write-Host "     git add Final_Project_Group_10/Views/Rooms/" -ForegroundColor Gray
Write-Host "     git commit -m 'Add Room views (Index, Details, Create)'" -ForegroundColor Gray
Write-Host "  3. Create GitHub repository" -ForegroundColor White
Write-Host "  4. Add remote: git remote add origin YOUR_GITHUB_URL" -ForegroundColor Gray
Write-Host "  5. Push to GitHub: git push -u origin main && git push --all" -ForegroundColor Gray
Write-Host ""
