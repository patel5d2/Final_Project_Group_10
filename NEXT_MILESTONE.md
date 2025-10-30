# Next Milestone Guide - Entity Framework & Database Setup

This guide will help you implement Entity Framework Core and set up your database for the Room Booking System.

---

## 📦 Step 1: Install Required NuGet Packages

Open your project folder in terminal and run:

```bash
cd Final_Project_Group_10

# Install Entity Framework Core
dotnet add package Microsoft.EntityFrameworkCore.SqlServer

# Install EF Core Tools for migrations
dotnet add package Microsoft.EntityFrameworkCore.Tools

# Install EF Core Design package
dotnet add package Microsoft.EntityFrameworkCore.Design
```

**Alternative: Using Visual Studio Package Manager Console:**
```powershell
Install-Package Microsoft.EntityFrameworkCore.SqlServer
Install-Package Microsoft.EntityFrameworkCore.Tools
Install-Package Microsoft.EntityFrameworkCore.Design
```

---

## 🗄️ Step 2: Create Database Context

Create a new folder called **`Data`** and add **`ApplicationDbContext.cs`**:

```csharp
using Final_Project_Group_10.Models;
using Microsoft.EntityFrameworkCore;

namespace Final_Project_Group_10.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Room> Rooms { get; set; }
        public DbSet<Booking> Bookings { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Configure Room entity
            modelBuilder.Entity<Room>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Name).IsRequired().HasMaxLength(100);
                entity.Property(e => e.Location).IsRequired().HasMaxLength(200);
                entity.Property(e => e.Capacity).IsRequired();
                entity.Property(e => e.Description).HasMaxLength(500);
                entity.Property(e => e.IsAvailable).HasDefaultValue(true);
            });

            // Configure Booking entity
            modelBuilder.Entity<Booking>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.UserName).IsRequired().HasMaxLength(100);
                entity.Property(e => e.Purpose).HasMaxLength(500);
                entity.Property(e => e.BookedAt).HasDefaultValueSql("GETDATE()");
                
                // Configure relationship
                entity.HasOne(e => e.Room)
                    .WithMany(r => r.Bookings)
                    .HasForeignKey(e => e.RoomId)
                    .OnDelete(DeleteBehavior.Cascade);
            });

            // Seed initial data
            modelBuilder.Entity<Room>().HasData(
                new Room
                {
                    Id = 1,
                    Name = "Conference Room A",
                    Capacity = 20,
                    Location = "Building 1, Floor 2",
                    IsAvailable = true,
                    Description = "Large conference room with projector and whiteboard"
                },
                new Room
                {
                    Id = 2,
                    Name = "Study Room 101",
                    Capacity = 6,
                    Location = "Library, Floor 1",
                    IsAvailable = true,
                    Description = "Quiet study room perfect for small groups"
                },
                new Room
                {
                    Id = 3,
                    Name = "Lecture Hall B",
                    Capacity = 100,
                    Location = "Building 3, Floor 1",
                    IsAvailable = false,
                    Description = "Large lecture hall with AV equipment"
                },
                new Room
                {
                    Id = 4,
                    Name = "Meeting Room C",
                    Capacity = 10,
                    Location = "Building 2, Floor 3",
                    IsAvailable = true,
                    Description = "Medium-sized meeting room with video conferencing"
                }
            );
        }
    }
}
```

---

## ⚙️ Step 3: Configure Connection String

Edit **`appsettings.json`**:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=(localdb)\\mssqllocaldb;Database=RoomBookingDb;Trusted_Connection=True;MultipleActiveResultSets=true"
  },
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*"
}
```

**For SQL Server Express:**
```json
"DefaultConnection": "Server=localhost\\SQLEXPRESS;Database=RoomBookingDb;Trusted_Connection=True;TrustServerCertificate=True"
```

**For Azure SQL or Remote Server:**
```json
"DefaultConnection": "Server=YOUR_SERVER;Database=RoomBookingDb;User Id=YOUR_USER;Password=YOUR_PASSWORD;TrustServerCertificate=True"
```

---

## 🔧 Step 4: Register DbContext in Program.cs

Edit **`Program.cs`** to add database services:

```csharp
using Final_Project_Group_10.Data;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

// Register DbContext
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
```

---

## 🚀 Step 5: Create and Run Migrations

### Create Initial Migration
```bash
dotnet ef migrations add InitialCreate
```

### Apply Migration to Database
```bash
dotnet ef database update
```

### Verify Migration Success
Check that:
- `Migrations` folder was created
- Database was created in SQL Server
- Tables `Rooms` and `Bookings` exist
- Seed data was inserted

---

## 🔄 Step 6: Update RoomsController to Use Database

Replace the temporary `GetSampleRooms()` method in **`RoomsController.cs`**:

```csharp
using Final_Project_Group_10.Data;
using Final_Project_Group_10.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Final_Project_Group_10.Controllers
{
    public class RoomsController : Controller
    {
        private readonly ApplicationDbContext _context;

        public RoomsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Rooms
        public async Task<IActionResult> Index()
        {
            var rooms = await _context.Rooms.ToListAsync();
            return View(rooms);
        }

        // GET: Rooms/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var room = await _context.Rooms
                .FirstOrDefaultAsync(m => m.Id == id);

            if (room == null)
            {
                return NotFound();
            }

            return View(room);
        }

        // GET: Rooms/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Rooms/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Name,Capacity,Location,Description,IsAvailable")] Room room)
        {
            if (ModelState.IsValid)
            {
                _context.Add(room);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(room);
        }

        // GET: Rooms/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var room = await _context.Rooms.FindAsync(id);
            if (room == null)
            {
                return NotFound();
            }
            return View(room);
        }

        // POST: Rooms/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Name,Capacity,Location,Description,IsAvailable")] Room room)
        {
            if (id != room.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(room);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!RoomExists(room.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(room);
        }

        // GET: Rooms/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var room = await _context.Rooms
                .FirstOrDefaultAsync(m => m.Id == id);
            if (room == null)
            {
                return NotFound();
            }

            return View(room);
        }

        // POST: Rooms/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var room = await _context.Rooms.FindAsync(id);
            if (room != null)
            {
                _context.Rooms.Remove(room);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }

        private bool RoomExists(int id)
        {
            return _context.Rooms.Any(e => e.Id == id);
        }
    }
}
```

---

## ✅ Step 7: Test Your Application

1. **Build the project:**
   ```bash
   dotnet build
   ```

2. **Run the application:**
   ```bash
   dotnet run
   ```

3. **Test in browser:**
   - Navigate to `https://localhost:5001`
   - Click "Rooms" in navigation
   - Verify you see the 4 seeded rooms
   - Click "View Details" on a room
   - Try creating a new room

---

## 🐛 Troubleshooting

### Error: "Cannot connect to database"
- Verify SQL Server is running
- Check connection string matches your SQL Server instance
- For LocalDB, run: `sqllocaldb start mssqllocaldb`

### Error: "Table already exists"
```bash
# Delete database and recreate
dotnet ef database drop
dotnet ef database update
```

### Error: "Build failed"
- Make sure all NuGet packages installed correctly
- Rebuild solution: `dotnet build --no-incremental`

### To see what SQL is generated:
```bash
dotnet ef migrations script
```

---

## 📊 Verify Database Creation

### Using SQL Server Management Studio (SSMS):
1. Connect to `(localdb)\mssqllocaldb`
2. Expand Databases → RoomBookingDb
3. Expand Tables
4. You should see:
   - dbo.Rooms
   - dbo.Bookings
   - dbo.__EFMigrationsHistory

### Using SQL Commands:
```sql
USE RoomBookingDb;
GO

SELECT * FROM Rooms;
SELECT * FROM Bookings;
SELECT * FROM __EFMigrationsHistory;
```

---

## 📝 Git Commits for This Milestone

```bash
# Commit 1: Add EF Core packages
git add Final_Project_Group_10/Final_Project_Group_10.csproj
git commit -m "Add Entity Framework Core NuGet packages"

# Commit 2: Create DbContext
git add Final_Project_Group_10/Data/ApplicationDbContext.cs
git commit -m "Create ApplicationDbContext with Room and Booking entities"

# Commit 3: Configure connection string
git add Final_Project_Group_10/appsettings.json
git commit -m "Add database connection string configuration"

# Commit 4: Register DbContext in Program.cs
git add Final_Project_Group_10/Program.cs
git commit -m "Register DbContext in dependency injection"

# Commit 5: Create migration
git add Final_Project_Group_10/Migrations/
git commit -m "Add initial database migration"

# Commit 6: Update RoomsController
git add Final_Project_Group_10/Controllers/RoomsController.cs
git commit -m "Update RoomsController to use Entity Framework"
```

---

## 🎯 Success Criteria

- [ ] ✅ EF Core packages installed
- [ ] ✅ ApplicationDbContext created
- [ ] ✅ Connection string configured
- [ ] ✅ DbContext registered in Program.cs
- [ ] ✅ Initial migration created
- [ ] ✅ Database created successfully
- [ ] ✅ Seed data appears in database
- [ ] ✅ RoomsController uses database
- [ ] ✅ Application runs without errors
- [ ] ✅ Can view rooms from database
- [ ] ✅ Can create new rooms

---

**Next Steps After This:**
- Implement Bookings functionality
- Add user authentication
- Create booking validation logic
- Add calendar view

Good luck! 🚀
