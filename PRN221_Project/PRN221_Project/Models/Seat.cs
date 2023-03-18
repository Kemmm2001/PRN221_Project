using System;
using System.Collections.Generic;

namespace PRN221_Project.Models
{
    public partial class Seat
    {
        public Seat()
        {
            Users = new HashSet<User>();
        }

        public int SeatId { get; set; }
        public string SeatName { get; set; } = null!;

        public virtual ICollection<User> Users { get; set; }
    }
}
