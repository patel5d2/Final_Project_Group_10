# Database Design - Room Booking & Scheduling System

## Entity Relationship Diagram (ERD)

### Tables Overview

This document describes the database schema for the Room Booking & Scheduling System.

---

## 📊 Database Tables

### 1. **Rooms** Table

Stores information about available rooms in the facility.

| Column Name   | Data Type      | Constraints                    | Description                          |
|---------------|----------------|--------------------------------|--------------------------------------|
| Id            | INT            | PRIMARY KEY, IDENTITY(1,1)     | Unique room identifier               |
| Name          | NVARCHAR(100)  | NOT NULL                       | Room name (e.g., "Conference Room A")|
| Capacity      | INT            | NOT NULL, CHECK (Capacity > 0) | Maximum number of people             |
| Location      | NVARCHAR(200)  | NOT NULL                       | Building and floor information       |
| IsAvailable   | BIT            | NOT NULL, DEFAULT 1            | Availability status                  |
| Description   | NVARCHAR(500)  | NULL                           | Optional room description            |

**Indexes:**
- Primary Key on `Id`
- Non-clustered index on `IsAvailable` for filtering

---

### 2. **Bookings** Table

Stores all room reservations made by users.

| Column Name   | Data Type      | Constraints                    | Description                          |
|---------------|----------------|--------------------------------|--------------------------------------|
| Id            | INT            | PRIMARY KEY, IDENTITY(1,1)     | Unique booking identifier            |
| RoomId        | INT            | NOT NULL, FOREIGN KEY          | Reference to Rooms table             |
| UserName      | NVARCHAR(100)  | NOT NULL                       | Name of person booking the room      |
| StartTime     | DATETIME2      | NOT NULL                       | Booking start date/time              |
| EndTime       | DATETIME2      | NOT NULL                       | Booking end date/time                |
| Purpose       | NVARCHAR(500)  | NULL                           | Reason for booking                   |
| BookedAt      | DATETIME2      | NOT NULL, DEFAULT GETDATE()    | When the booking was made            |
| IsConfirmed   | BIT            | NOT NULL, DEFAULT 0            | Confirmation status                  |

**Constraints:**
- `CHECK (EndTime > StartTime)` - Ensures valid time range
- Foreign Key: `RoomId` REFERENCES `Rooms(Id)` ON DELETE CASCADE

**Indexes:**
- Primary Key on `Id`
- Non-clustered index on `RoomId`
- Non-clustered index on `StartTime, EndTime` for conflict checking

---

### 3. **Users** Table (Future Implementation)

Stores user account information for authentication.

| Column Name    | Data Type      | Constraints                    | Description                          |
|----------------|----------------|--------------------------------|--------------------------------------|
| Id             | INT            | PRIMARY KEY, IDENTITY(1,1)     | Unique user identifier               |
| Username       | NVARCHAR(50)   | NOT NULL, UNIQUE               | User login name                      |
| Email          | NVARCHAR(100)  | NOT NULL, UNIQUE               | User email address                   |
| PasswordHash   | NVARCHAR(256)  | NOT NULL                       | Hashed password                      |
| Role           | NVARCHAR(20)   | NOT NULL, DEFAULT 'User'       | User role (Admin/User)               |
| CreatedAt      | DATETIME2      | NOT NULL, DEFAULT GETDATE()    | Account creation date                |
| IsActive       | BIT            | NOT NULL, DEFAULT 1            | Account active status                |

**Indexes:**
- Primary Key on `Id`
- Unique index on `Username`
- Unique index on `Email`

---

## 🔗 Relationships

### One-to-Many Relationships

1. **Rooms ↔ Bookings**
   - One room can have many bookings
   - Each booking belongs to exactly one room
   - `Bookings.RoomId` → `Rooms.Id` (Foreign Key)

2. **Users ↔ Bookings** (Future)
   - One user can make many bookings
   - Each booking belongs to exactly one user
   - `Bookings.UserId` → `Users.Id` (Foreign Key)

---

## 📐 ERD Diagram (Text Representation)

```
┌─────────────────────┐
│      ROOMS          │
├─────────────────────┤
│ Id (PK)            │
│ Name               │
│ Capacity           │
│ Location           │
│ IsAvailable        │
│ Description        │
└──────────┬──────────┘
           │
           │ 1:N
           │
           ▼
┌─────────────────────┐
│     BOOKINGS        │
├─────────────────────┤
│ Id (PK)            │
│ RoomId (FK)        │───────┐
│ UserName           │       │
│ StartTime          │       │
│ EndTime            │       │
│ Purpose            │       │
│ BookedAt           │       │
│ IsConfirmed        │       │
└─────────────────────┘       │
                              │
                              │
                    ┌─────────▼─────────┐
                    │      USERS        │ (Future)
                    ├───────────────────┤
                    │ Id (PK)          │
                    │ Username         │
                    │ Email            │
                    │ PasswordHash     │
                    │ Role             │
                    │ CreatedAt        │
                    │ IsActive         │
                    └───────────────────┘
```

---

## 🔍 Business Rules

1. **Room Availability**
   - A room can only be booked if `IsAvailable = true`
   - Rooms can be marked unavailable for maintenance

2. **Booking Conflicts**
   - No overlapping bookings for the same room
   - Validation: Check if any existing booking overlaps with requested time range
   - Query: `WHERE RoomId = @RoomId AND NOT (EndTime <= @StartTime OR StartTime >= @EndTime)`

3. **Booking Duration**
   - `EndTime` must be greater than `StartTime`
   - Minimum booking duration: 30 minutes (to be implemented)
   - Maximum booking duration: 8 hours (to be implemented)

4. **User Permissions** (Future)
   - **Users** can:
     - View available rooms
     - Create their own bookings
     - View/cancel their own bookings
   - **Admins** can:
     - Manage all rooms (CRUD)
     - View all bookings
     - Cancel any booking
     - Manage user accounts

---

## 🗄️ Sample Queries

### Check Room Availability
```sql
SELECT * FROM Rooms 
WHERE IsAvailable = 1 
  AND Capacity >= @RequiredCapacity
  AND Id NOT IN (
    SELECT RoomId FROM Bookings 
    WHERE NOT (EndTime <= @StartTime OR StartTime >= @EndTime)
  )
```

### Get User's Booking History
```sql
SELECT b.*, r.Name as RoomName, r.Location 
FROM Bookings b
INNER JOIN Rooms r ON b.RoomId = r.Id
WHERE b.UserName = @UserName
ORDER BY b.StartTime DESC
```

### Get Room Schedule for a Day
```sql
SELECT * FROM Bookings
WHERE RoomId = @RoomId
  AND CAST(StartTime AS DATE) = @Date
ORDER BY StartTime
```

---

## 📝 Notes for Implementation

### Phase 1 (Current Milestone)
- ✅ Define models in C# (Room, Booking)
- 🔄 Install Entity Framework Core packages
- 🔄 Create DbContext class
- 🔄 Configure connection string
- 🔄 Generate migrations

### Phase 2 (Next Milestone)
- Add User authentication with ASP.NET Identity
- Implement role-based authorization
- Add UserId foreign key to Bookings table

### Phase 3 (Future)
- Add audit fields (CreatedBy, ModifiedBy, ModifiedAt)
- Implement soft delete for bookings
- Add booking status enum (Pending, Confirmed, Cancelled)

---

**Database Design Version:** 1.0  
**Last Updated:** October 30, 2025  
**Created By:** Group 10 Development Team
