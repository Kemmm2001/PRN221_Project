using System;
using System.Collections.Generic;

namespace PRN221_Project.Models
{
    public partial class Movie
    {
        public Movie()
        {
            Users = new HashSet<User>();
        }

        public int MovieId { get; set; }
        public string MovieName { get; set; } = null!;
        public int CateId { get; set; }
        public double Time { get; set; }
        public string Description { get; set; } = null!;
        public double Cost { get; set; }
        public int Quantity { get; set; }

        public virtual Category Cate { get; set; } = null!;
        public virtual ICollection<User> Users { get; set; }
    }
}
