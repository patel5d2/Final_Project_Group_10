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
git clone <your-repo-url>
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

## Project Structure

```
Final_Project_Group_10/
├── Controllers/
│   ├── HomeController.cs
│   ├── RoomsController.cs
│   └── BookingsController.cs
├── Data/
│   └── ApplicationDbContext.cs
├── Models/
│   ├── Room.cs
│   ├── Booking.cs
│   └── ErrorViewModel.cs
├── Views/
│   ├── Home/
│   │   ├── Index.cshtml
│   │   └── Privacy.cshtml
│   ├── Rooms/
│   │   ├── Index.cshtml
│   │   ├── Create.cshtml
│   │   ├── Edit.cshtml
│   │   ├── Details.cshtml
│   │   └── Delete.cshtml
│   ├── Bookings/
│   │   ├── Index.cshtml
│   │   ├── Create.cshtml
│   │   ├── Details.cshtml
│   │   └── Delete.cshtml
│   └── Shared/
│       ├── _Layout.cshtml
│       └── Error.cshtml
├── Migrations/
└── wwwroot/
```

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

Group 10


**Happy Booking! 🎉**
