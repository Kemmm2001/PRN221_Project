using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace PRN221_Project.Pages.Account
{
    public class LoginModel : PageModel
    {

        public void OnGet()
        {

        }
        public IActionResult OnPost()
        {
            string Name = Request.Form["User"];
            string password = Request.Form["password"];

            if (string.IsNullOrEmpty(Name) || string.IsNullOrEmpty(password))
            {
                ViewData["Message"] = "Tài Khoản hoặc Mật Khẩu không được để trống";
                return Page();
            }
            else
            {
                if (Name.Equals("user"))
                {
                    if (!password.Equals("user"))
                    {
                        ViewData["Message"] = "Mật Khẩu Không đúng";
                    }
                    else
                    {
                        HttpContext.Session.SetString("account", "user");
                        return RedirectToPage("/index");
                    }

                }
                else if (Name.Equals("admin"))
                {
                    if (!password.Equals("admin"))
                    {
                        ViewData["Message"] = "Mật Khẩu Không đúng";
                    }
                    else
                    {
                        HttpContext.Session.SetString("account", "admin");
                        return RedirectToPage("/index");
                    }
                }
                else
                {
                    ViewData["Message"] = "Tài Khoản Không đúng";
                }
            }
            return Page();
        }
       
    }
}
