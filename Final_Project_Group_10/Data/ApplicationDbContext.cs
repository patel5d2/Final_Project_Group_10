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

            // Seed initial data
            modelBuilder.Entity<Room>().HasData(
                new Room { Id = 1, Name = "Conference Room A", Capacity = 20, Location = "Building 1, Floor 2", IsAvailable = true, Description = "Large conference room with projector and whiteboard" },
                new Room { Id = 2, Name = "Study Room 101", Capacity = 6, Location = "Library, Floor 1", IsAvailable = true, Description = "Quiet study room perfect for small groups" },
                new Room { Id = 3, Name = "Lecture Hall B", Capacity = 100, Location = "Building 3, Floor 1", IsAvailable = true, Description = "Large lecture hall with audio/video equipment" },
                new Room { Id = 4, Name = "Meeting Room C", Capacity = 10, Location = "Building 2, Floor 3", IsAvailable = true, Description = "Meeting room with video conferencing capabilities" },
                new Room { Id = 5, Name = "Workshop Space D", Capacity = 30, Location = "Building 4, Floor 1", IsAvailable = true, Description = "Hands-on workshop space with workbenches" }
            );
        }
    }
}
