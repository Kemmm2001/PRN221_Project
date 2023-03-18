using System;
using System.Collections.Generic;

namespace PRN221_Project.Models
{
    public partial class Category
    {
        public Category()
        {
            Movies = new HashSet<Movie>();
        }

        public int CateId { get; set; }
        public string CateName { get; set; } = null!;

        public virtual ICollection<Movie> Movies { get; set; }
    }
}
