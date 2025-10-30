using System.ComponentModel.DataAnnotations;

namespace Final_Project_Group_10.Models
{
    public class Booking
    {
        public int Id { get; set; }

        [Required]
        public int RoomId { get; set; }

        [Required]
        [StringLength(100)]
        public string UserName { get; set; } = string.Empty;

        [Required]
        public DateTime StartTime { get; set; }

        [Required]
        public DateTime EndTime { get; set; }

        [StringLength(500)]
        public string? Purpose { get; set; }

        public DateTime BookedAt { get; set; } = DateTime.Now;

        public bool IsConfirmed { get; set; } = false;

        // Navigation property
        public Room? Room { get; set; }
    }
}
