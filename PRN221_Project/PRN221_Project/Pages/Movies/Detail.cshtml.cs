using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PRN221_Project.Models;

namespace PRN221_Project.Pages.Movies
{
    public class DetailModel : PageModel
    {
        private readonly PRN221_ProjectContext _db;
        public DetailModel(PRN221_ProjectContext _db)
        {
            this._db=_db;
        }
        [BindProperty]
        public Movie movie { get; set; }
        [BindProperty]
        public List<User> users { get; set; }
        [BindProperty]
        public User user { get; set; }
        public IActionResult OnGet(int? id)
        {
            if (id != null)
            {
                movie =  _db.Movies.Include(p => p.Cate).SingleOrDefault(p => p.MovieId == id);
                ViewData["CategoryId"] = new SelectList(_db.Categories, "CateId", "CateName");
                users = _db.Users.Include(u => u.Seat).Where(u => u.MovieId == id).ToList();
            }
            return Page();
        }

        public IActionResult OnPost()
        {
            var movie1 = _db.Movies.SingleOrDefault(p => p.MovieId == movie.MovieId);
            movie1.MovieName = movie.MovieName;
            movie1.CateId = movie.Cate.CateId;
            movie1.Cost = movie.Cost;
            movie1.Quantity = movie.Quantity;
            movie1.Description = movie.Description;
            movie1.Time = movie.Time;
            _db.SaveChanges();
            movie =  _db.Movies.Include(p => p.Cate).SingleOrDefault(p => p.MovieId == movie.MovieId);
            ViewData["CategoryId"] = new SelectList(_db.Categories, "CateId", "CateName");
            users = _db.Users.Include(u => u.Seat).Where(u => u.MovieId == movie.MovieId).ToList();
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
            movie =  _db.Movies.Include(p => p.Cate).SingleOrDefault(p => p.MovieId == user.MovieId);
            ViewData["CategoryId"] = new SelectList(_db.Categories, "CateId", "CateName");
            users = _db.Users.Include(u => u.Seat).Where(u => u.MovieId == user.MovieId).ToList();
            return Page();
        }
    }
}
