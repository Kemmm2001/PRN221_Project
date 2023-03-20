using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using PRN221_Project.Models;

namespace PRN221_Project.Pages.Movies
{
    public class AddModel : PageModel
    {
        private readonly PRN221_ProjectContext _context;

        public AddModel(PRN221_ProjectContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            ViewData["CateId"] = new SelectList(_context.Categories, "CateId", "CateName");
            return Page();
        }

        [BindProperty]
        public Movie Movie { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            //if (!ModelState.IsValid)
            //{
            //    return Page();
            //}

            _context.Movies.Add(Movie);
            await _context.SaveChangesAsync();

            return RedirectToPage("/Index");
        }
    }
}
