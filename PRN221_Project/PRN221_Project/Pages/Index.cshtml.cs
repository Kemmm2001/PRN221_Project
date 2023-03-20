using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using PRN221_Project.Models;

namespace PRN221_Project.Pages
{
    public class IndexModel : PageModel
    {
        private readonly PRN221_ProjectContext DB;


        public IndexModel(PRN221_ProjectContext DB)
        {
            this.DB = DB;
        }

        [BindProperty]
        public List<Movie> movies { get; set; }

        [ViewData]
        public List<Category> cate { get; set; }

        [ViewData]
        public List<Movie> list { get; set; }

        public void OnGet()
        {
            string acount = HttpContext.Session.GetString("account");
            var ListMovies = DB.Movies.Include("Cate").ToList();
            if (acount != null)
            {
                ViewData["acount"] = acount;
            }
            list = ListMovies;
            //movies = DB.Movies.ToList();
            cate = DB.Categories.ToList();
        }
        public void OnPost()
        {
            int cateId = int.Parse(Request.Form["cateId"]);
            var ListMovies = DB.Movies.Include("Cate").Where(x => x.CateId == cateId).ToList();
            if (cateId == 0)
            {
                ListMovies = DB.Movies.Include("Cate").ToList();
            }
            list = ListMovies;
            cate = DB.Categories.ToList();
            ViewData["id"] = cateId;
        }
        public void OnPostSearch()
        {

            string search = Request.Form["search"].ToString();
            var ListMovies = DB.Movies.Include("Cate").Where(x => x.MovieName.Contains(search)).ToList();
            list = ListMovies;
            cate = DB.Categories.ToList();
            ViewData["searchName"] = search;
        }
        public IActionResult OnPostLogout()
        {
            var ListMovies = DB.Movies.Include("Cate").ToList();
            list = ListMovies;
            cate = DB.Categories.ToList();
            HttpContext.Session.Remove("account");
            return Page();
        }
        public IActionResult OnPostDelete(int id)
        {
            List<User> user = new List<User>();
            Movie movie = new Movie();
            movie = DB.Movies.Where((x) => x.MovieId == id).FirstOrDefault();
            user = DB.Users.Where(x => x.MovieId == id).ToList();
            DB.Users.RemoveRange(user);
            DB.Movies.Remove(movie);
            DB.SaveChanges();         
            return RedirectToPage("/Index");
        }
    }
}
