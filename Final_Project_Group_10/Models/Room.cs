using System.ComponentModel.DataAnnotations;

namespace Final_Project_Group_10.Models
{
    public class Room
    {
        public int Id { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; } = string.Empty;

        [Required]
        [Range(1, 500)]
        public int Capacity { get; set; }

        [StringLength(200)]
        public string Location { get; set; } = string.Empty;

        public bool IsAvailable { get; set; } = true;

        [StringLength(500)]
        public string? Description { get; set; }

        // Navigation property for future bookings
        public ICollection<Booking>? Bookings { get; set; }
    }
}
