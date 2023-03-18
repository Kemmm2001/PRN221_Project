using Microsoft.AspNetCore.Builder;
using Microsoft.EntityFrameworkCore;
using PRN221_Project.Models;
using System.Linq;
using Microsoft.AspNetCore.Mvc;

var builder = WebApplication.CreateBuilder(args);

//Bo sung service cua ung dung vao Web Container
builder.Services.AddRazorPages();
//Bo sung doi tuong DBContext su dung chung toan project
builder.Services.AddDbContext<PRN221_ProjectContext>(opt =>
    opt.UseSqlServer(builder.Configuration.GetConnectionString("Project_PRN221"))
);
builder.Services.AddSession(opt => { opt.IdleTimeout = TimeSpan.FromMinutes(15); });

builder.Services.AddSignalR();
var app = builder.Build();

//Khai bao viec su dung cac thu vien trong wwwroot
app.UseStaticFiles();
app.UseSession();

//app.UseRouting();
app.MapRazorPages();
app.Run();