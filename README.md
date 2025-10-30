# Room Booking System
## Final Project - Group 10

A comprehensive web application for managing room reservations built with ASP.NET Core MVC and Entity Framework Core.

## Features

### ✨ Core Functionality
- **Room Management**: Create, view, edit, and delete rooms
- **Booking System**: Book rooms with conflict detection
- **Real-time Availability**: Check room availability instantly
- **User-Friendly Interface**: Modern, responsive design with Bootstrap 5
- **Conflict Detection**: Automatic checking for booking conflicts
- **Booking Management**: View, confirm, and cancel bookings

### 🎯 Room Features
- Room name, location, and capacity tracking
- Detailed room descriptions
- Availability status management
- View upcoming bookings per room

### 📅 Booking Features
- Select available rooms from dropdown
- Date and time selection
- Purpose/description for bookings
- Automatic confirmation
- Booking history tracking
- Cancel bookings easily

## Tech Stack

- **Framework**: ASP.NET Core 8.0 MVC
- **Database**: SQL Server (LocalDB)
- **ORM**: Entity Framework Core 9.0
- **Frontend**: Bootstrap 5 + Bootstrap Icons
- **Language**: C# 12.0

## Getting Started

### Prerequisites
- .NET 8.0 SDK or later
- Visual Studio 2022 or VS Code
- SQL Server LocalDB (included with Visual Studio)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/patel5d2/Final_Project_Group_10>
cd Final_Project_Group_10
```

2. Navigate to the project directory:
```bash
cd Final_Project_Group_10
```

3. Restore dependencies:
```bash
dotnet restore
```

4. Apply database migrations:
```bash
dotnet ef database update
```

5. Run the application:
```bash
dotnet run
```

6. Open your browser and navigate to:
```
https://localhost:5001
```
or
```
http://localhost:5000
```

## Database

The application uses SQL Server LocalDB with the following tables:

### Rooms Table
- Id (Primary Key)
- Name
- Location
- Capacity
- Description
- IsAvailable

### Bookings Table
- Id (Primary Key)
- RoomId (Foreign Key)
- UserName
- StartTime
- EndTime
- Purpose
- BookedAt
- IsConfirmed

The database is automatically seeded with 5 sample rooms on first run.

## Usage Guide

### Managing Rooms

1. **View Rooms**: Click "Rooms" in the navigation bar
2. **Add Room**: Click "Add New Room" button
3. **Edit Room**: Click "Edit" on any room card
4. **Delete Room**: Click "Delete" on any room card
5. **View Details**: Click "Details" to see room information and bookings

### Making Bookings

1. **New Booking**: Click "New Booking" in navigation or "Book a Room" on home page
2. **Select Room**: Choose from available rooms dropdown
3. **Enter Details**: Fill in your name, start time, end time, and purpose
4. **Submit**: Click "Create Booking"
5. **Confirmation**: System checks for conflicts and confirms booking

### Managing Bookings

1. **View Bookings**: Click "Bookings" in navigation
2. **View Details**: Click "Details" on any booking
3. **Cancel Booking**: Click "Cancel" or "Delete" button

## Features Highlights

### Conflict Detection
The system automatically prevents double-booking by checking:
- Overlapping start times
- Overlapping end times
- Complete time range overlaps

### Responsive Design
- Mobile-friendly interface
- Card-based layouts
- Modern UI with Bootstrap 5
- Bootstrap Icons integration

### User Experience
- Intuitive navigation
- Clear action buttons
- Form validation
- Success/error messages
- Status badges for bookings

## Development

### Adding Migrations
```bash
dotnet ef migrations add MigrationName
dotnet ef database update
```

### Running in Development
```bash
dotnet watch run
```

## Future Enhancements

Potential features for future versions:
- User authentication and authorization
- Email notifications
- Calendar view for bookings
- Recurring bookings
- Room photos/images
- Advanced search and filtering
- Export bookings to PDF/Excel
- Room equipment tracking
- Multiple language support

## Contributors
👥 Team Members
Group 10
Member 1 - Dharmin Patel
Member 2 - Shamak Patel
Member 3 - Levi Okoye

**Happy Booking! 🎉**
