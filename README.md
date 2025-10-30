# Room Booking & Scheduling System

## 📋 Project Overview

The **Room Booking & Scheduling System** is a web-based application designed to allow users to reserve rooms within a facility such as a university, library, or office building. The system provides a centralized platform where users can view available rooms, check schedules, and make reservations, while administrators can manage rooms and monitor bookings.

## 🎯 Project Goals

- ✅ Allow users to browse and book available rooms
- ✅ Prevent double-booking with scheduling validation
- ✅ Provide administrators with room and reservation management tools
- 🔄 Notify users of reservation confirmations and cancellations (future milestone)

## 🛠️ Technologies Used

- **ASP.NET Core MVC** - Web application framework
- **C#** - Primary programming language
- **Entity Framework Core** - Object-Relational Mapping (ORM)
- **SQL Server** - Database (planned)
- **Bootstrap 5** - Responsive UI framework
- **HTML/CSS/JavaScript** - Front-end technologies

## 📁 Project Structure

```
Final_Project_Group_10/
├── Controllers/
│   ├── HomeController.cs          # Homepage and general navigation
│   └── RoomsController.cs          # Room listing, details, and management
├── Models/
│   ├── Room.cs                     # Room entity model
│   ├── Booking.cs                  # Booking entity model
│   └── ErrorViewModel.cs           # Error handling model
├── Views/
│   ├── Home/                       # Home page views
│   ├── Rooms/                      # Room-related views
│   │   ├── Index.cshtml           # List all rooms
│   │   ├── Details.cshtml         # Room details
│   │   └── Create.cshtml          # Create new room (Admin)
│   └── Shared/                     # Shared layouts and components
└── wwwroot/                        # Static files (CSS, JS, images)
```

## ✅ Current Milestone Progress

### Milestone 1: Project Foundation & Version Control

- ✅ ASP.NET Core MVC project created
- ✅ Project uploaded to GitHub repository
- ✅ Minimum two MVC controllers created:
  - `HomeController` - Displays homepage and general navigation
  - `RoomsController` - Room listing, details, and creation (Admin)
- ✅ Multiple views created for room browsing
- ✅ Two or more branches created in Git repository
- ✅ Four or more commits demonstrating incremental development

### Controllers Implemented

1. **HomeController**
   - `Index()` - Homepage
   - `Privacy()` - Privacy policy page
   - `Error()` - Error handling

2. **RoomsController**
   - `Index()` - Display all available rooms
   - `Details(id)` - Show details of a specific room
   - `Create()` - Form to create new room (GET)
   - `Create(Room)` - Process room creation (POST)

### Models Defined

1. **Room**
   - Properties: Id, Name, Capacity, Location, IsAvailable, Description
   - Validation attributes for data integrity

2. **Booking** (Future implementation)
   - Properties: Id, RoomId, UserName, StartTime, EndTime, Purpose, BookedAt, IsConfirmed
   - Foreign key relationship with Room

## 🚀 Getting Started

### Prerequisites

- [.NET 6.0 SDK](https://dotnet.microsoft.com/download) or higher
- [Visual Studio 2022](https://visualstudio.microsoft.com/) or [Visual Studio Code](https://code.visualstudio.com/)
- [Git](https://git-scm.com/)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/Final_Project_Group_10.git
   cd Final_Project_Group_10
   ```

2. Restore NuGet packages:
   ```bash
   dotnet restore
   ```

3. Build the project:
   ```bash
   dotnet build
   ```

4. Run the application:
   ```bash
   dotnet run
   ```

5. Open your browser and navigate to:
   ```
   https://localhost:5001
   ```

## 🎨 Features Implemented (Current)

### User Features
- ✅ Browse available rooms
- ✅ View room details (capacity, location, availability)
- ✅ Responsive card-based UI

### Admin Features (Partial)
- ✅ Add new rooms
- ✅ View all rooms
- 🔄 Edit/Delete rooms (coming soon)

### Upcoming Features
- 🔄 User authentication and authorization
- 🔄 Room booking functionality
- 🔄 Schedule conflict validation
- 🔄 Booking history and management
- 🔄 Email notifications
- 🔄 Calendar view integration

## 📊 Database Schema (Planned)

### Tables

**Rooms**
- Id (int, PK)
- Name (varchar(100))
- Capacity (int)
- Location (varchar(200))
- IsAvailable (bit)
- Description (varchar(500))

**Bookings**
- Id (int, PK)
- RoomId (int, FK → Rooms.Id)
- UserName (varchar(100))
- StartTime (datetime)
- EndTime (datetime)
- Purpose (varchar(500))
- BookedAt (datetime)
- IsConfirmed (bit)

**Users** (Future)
- Id (int, PK)
- Username (varchar(50))
- Email (varchar(100))
- Role (varchar(20))

## 🔄 Version Control Summary

### Branches
- `main` - Production-ready code
- `develop` - Development branch
- `feature/rooms` - Room functionality
- `feature/auth` - Authentication (planned)

### Recent Commits
1. Initial project creation
2. Added RoomsController with Index and Details actions
3. Created Room and Booking models
4. Added Views for Rooms (Index, Details, Create)
5. Updated README documentation

## 📝 Next Steps

### Milestone 2: Database Integration
- [ ] Install Entity Framework Core packages
- [ ] Create ApplicationDbContext
- [ ] Define database connection string
- [ ] Create and run migrations
- [ ] Seed initial room data

### Milestone 3: Authentication & Authorization
- [ ] Implement ASP.NET Identity
- [ ] Create user registration and login
- [ ] Add role-based access control (Admin/User)
- [ ] Secure admin-only actions

### Milestone 4: Booking Functionality
- [ ] Create BookingsController
- [ ] Implement booking creation form
- [ ] Add time conflict validation
- [ ] Display user's booking history
- [ ] Allow booking cancellation

### Milestone 5: UI/UX Enhancements
- [ ] Add calendar view for bookings
- [ ] Implement search and filter functionality
- [ ] Add booking confirmation emails
- [ ] Create admin dashboard

## 👥 Team Members

- **Group 10**
  - Member 1 - [Role]
  - Member 2 - [Role]
  - Member 3 - [Role]

## 📄 License

This project is developed as part of an academic course assignment.

## 📞 Contact

For questions or support, please contact the development team through the course portal.

---

**Last Updated:** October 30, 2025  
**Project Status:** 🟢 Active Development - Milestone 1 Complete
