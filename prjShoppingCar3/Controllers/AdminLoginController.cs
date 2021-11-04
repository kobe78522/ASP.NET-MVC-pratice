using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using prjShoppingCar3.Models;
using System.Web.Security;

namespace prjShoppingCar3.Controllers
{
    public class AdminLoginController : Controller
    {
        //建立资料库物件db
        dbshoppingCarEntities db = new dbshoppingCarEntities();

        //Get: Home/Login
        public ActionResult Login()
        {
            return View();
        }

        //Post: Home/Login
        [HttpPost]
        public ActionResult Login(string fUserId, string fPwd)
        {
            //依帳密取得會員並指定給member
            var admin = db.tAdmin.Where(m => m.fUserId == fUserId && m.fPwd == fPwd).FirstOrDefault();
            //若member為null,表示會員未註冊
            if (admin == null)
            {
                ViewBag.Message = "帳密錯誤，登入失敗";
                return View();
            }
            //使用Session變數記錄歡迎詞
            Session["Welcome"] = admin.fUserId + "您好,歡迎登入";
            //指定使用者帳號通過驗證(即通過登錄驗證)
            FormsAuthentication.RedirectFromLoginPage(fUserId, true);
            return RedirectToAction("Index", "Admin");
        }
    }
}