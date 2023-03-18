using System;
using System.Collections.Generic;

namespace PRN221_Project.Models
{
    public partial class User
    {
        public int UserId { get; set; }
        public string UserName { get; set; } = null!;
        public string Phone { get; set; } = null!;
        public DateTime BookingTime { get; set; }
        public int MovieId { get; set; }
        public int SeatId { get; set; }

        public virtual Movie Movie { get; set; } = null!;
        public virtual Seat Seat { get; set; } = null!;
    }
}
