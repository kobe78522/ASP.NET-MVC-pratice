using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using prjShoppingCar3.Models;
using System.Web.Security;

namespace prjShoppingCar3.Controllers
{
    [Authorize]
    public class AdminController : Controller
    {
        //建立可存取dbShoppingCar.mdf資料庫的dbShoppingCarEntities類別物件db
        dbshoppingCarEntities db = new dbshoppingCarEntities();

        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult OrderList()
        {
            var order = db.tOrder.ToList();
            return View(order);
        }

        public ActionResult OrderDT()
        {
            var orderDT = db.tOrderDetail.ToList();
            return View(orderDT);
        }

        // GET: Edit
        public ActionResult Edit(string fOrderGuid)
        {
            var order = db.tOrder.Where(m => m.fOrderGuid == fOrderGuid).FirstOrDefault();
            return View(order);
        }

        // Post: Edit
        [HttpPost]
        public ActionResult Edit(tOrder orderList)
        {
            if (ModelState.IsValid)
            {
                var temp = db.tOrder.Where(m => m.fOrderGuid == orderList.fOrderGuid).FirstOrDefault();

                temp.fReceiver = orderList.fReceiver;
                temp.fEmail = orderList.fEmail;
                temp.fAddress = orderList.fAddress;
                db.SaveChanges();
                return RedirectToAction("OrderList");
            }
            return View(orderList);
        }

        public ActionResult Delete(string fOrderGuid, string forderDTGuid)
        {
            var order = db.tOrder.Where(m => m.fOrderGuid == fOrderGuid).FirstOrDefault();
            db.tOrder.Remove(order);
            var orderDetail = db.tOrderDetail.Find();
            db.tOrderDetail.Remove(orderDetail);
            db.SaveChanges();
            return RedirectToAction("OrderList");
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();  //登出
            return RedirectToAction("Login", "AdminLogin");
        }


    }
}