using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using prjShoppingCar3.Models;
using System.Web.Security;

namespace prjShoppingCar3.Controllers
{
    public class HomeController : Controller
    {
        //建立资料库物件db
        dbshoppingCarEntities db = new dbshoppingCarEntities();

        public ActionResult Index()
        {
            //取得所有产品并放入products
            var products = db.tProduct.OrderByDescending(m => m.fId).ToList();
            return View(products);
        }

        public ActionResult Detail(string fPId)
        {

            var dtl = db.tProduct.Where(m => m.fPId == fPId).FirstOrDefault();
            return View(dtl);
        }

        [HttpPost]
        public ActionResult Detail(tProduct products)
        {
            if (ModelState.IsValid)
            {
                var temp = db.tProduct.Where(m => m.fPId == products.fPId).FirstOrDefault();
                temp.fName = products.fName;
                temp.fImg = products.fImg;
                temp.fPrice = products.fPrice;
                temp.fQuantity = products.fQuantity;
                temp.fContent = products.fContent;
            }
            return View(products);
        }

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
            var member = db.tMember.Where(m => m.fUserId == fUserId && m.fPwd == fPwd).FirstOrDefault();
            //若member為null,表示會員未註冊
            if (member == null)
            {
                ViewBag.Message = "帳密錯誤，登入失敗";
                return View();
            }
            //使用Session變數記錄歡迎詞
            Session["Welcome"] = member.fName + "您好,歡迎登入";
            //指定使用者帳號通過驗證(即通過登錄驗證)
            FormsAuthentication.RedirectFromLoginPage(fUserId, true);
            return RedirectToAction("Index", "Member");
        }

        //Get:Home/Register
        public ActionResult Register()
        {
            return View();
        }

        //Post:Home/Register
        [HttpPost]
        public ActionResult Register(tMember pMember)
        {
            //若模型沒有通過驗證則顯示目前的View
            if (ModelState.IsValid == false)
            {
                return View();
            }

            //依帳號取得會員並指定給member
            var member = db.tMember.Where(m => m.fUserId == pMember.fUserId).FirstOrDefault();

            //若member為null，代表會員未註冊
            if (member == null)
            {
                //將會員紀錄新增到tMember資料夾
                db.tMember.Add(pMember);
                db.SaveChanges();
                //執行Home控制器的Login動作方法
                return RedirectToAction("Login");
            }
            ViewBag.Message = "此帳號已有人使用，註冊失敗";
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}