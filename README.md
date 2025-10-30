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
  - Member 1 - Dharmin Patel
  - Member 2 - Shamak Patel
  - Member 3 - Levi Okoye
