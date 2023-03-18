using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace PRN221_Project.Pages.Account
{
    public class LogoutModel : PageModel
    {
        public void OnGet()
        {
            //HttpContext.Session.Remove("account");
            //ReturnPage();

        }
        public IActionResult OnPost()
        {
            Console.WriteLine("đã vào");
            return RedirectToPage("/Movies/Add");
        }
    }
}
