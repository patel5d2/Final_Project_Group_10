using Final_Project_Group_10.Models;
using Microsoft.AspNetCore.Mvc;

namespace Final_Project_Group_10.Controllers
{
    public class RoomsController : Controller
    {
        // GET: Rooms
        public IActionResult Index()
        {
            // Placeholder: Display list of all rooms
            // TODO: Fetch from database using Entity Framework
            var rooms = GetSampleRooms();
            return View(rooms);
        }

        // GET: Rooms/Details/5
        public IActionResult Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            // Placeholder: Get room by ID
            // TODO: Fetch from database using Entity Framework
            var room = GetSampleRooms().FirstOrDefault(r => r.Id == id);

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
        public IActionResult Create(Room room)
        {
            if (ModelState.IsValid)
            {
                // TODO: Add room to database
                return RedirectToAction(nameof(Index));
            }
            return View(room);
        }

        // Temporary method to provide sample data
        private List<Room> GetSampleRooms()
        {
            return new List<Room>
            {
                new Room { Id = 1, Name = "Conference Room A", Capacity = 20, Location = "Building 1, Floor 2", IsAvailable = true },
                new Room { Id = 2, Name = "Study Room 101", Capacity = 6, Location = "Library, Floor 1", IsAvailable = true },
                new Room { Id = 3, Name = "Lecture Hall B", Capacity = 100, Location = "Building 3, Floor 1", IsAvailable = false },
                new Room { Id = 4, Name = "Meeting Room C", Capacity = 10, Location = "Building 2, Floor 3", IsAvailable = true }
            };
        }
    }
}
