using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using PRN221_Project.Models;

namespace PRN221_Project.Pages.Users
{
    public class DeleteModel : PageModel
    {
        private readonly PRN221_ProjectContext _db;
        public DeleteModel(PRN221_ProjectContext _db)
        {
            this._db=_db;
        }

        [BindProperty]
        public User user { get; set; }

        public IActionResult OnGet(int? id)
        {
            Console.WriteLine(id);
            if (id != null)
            {
                user = _db.Users.SingleOrDefault(p => p.UserId == id);
                var movie = _db.Movies.SingleOrDefault(p => p.MovieId == user.MovieId);
                movie.Quantity = movie.Quantity - 1;
                _db.Users.Remove(user);
                _db.SaveChanges();
            }
            return Page();
        }

        public IActionResult OnPostDelete(int? id)
        {
            Console.WriteLine(id);
            if (id != null)
            {
                user = _db.Users.SingleOrDefault(p => p.UserId == id);
                var movie = _db.Movies.SingleOrDefault(p => p.MovieId == user.MovieId);
                movie.Quantity = movie.Quantity - 1;
                _db.Users.Remove(user);
                _db.SaveChanges();
            }
            return Page();
        }
    }
}
