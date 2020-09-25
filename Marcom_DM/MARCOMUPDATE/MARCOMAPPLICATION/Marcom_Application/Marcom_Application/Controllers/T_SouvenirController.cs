using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Marcom_Application.Model;
using Marcom_Application.Repo;
using Marcom_Application.ViewModel;
using PagedList;

namespace Marcom_Application.Controllers
{
    public class T_SouvenirController : Controller
    {
        // GET: T_Souvenir
        public static string DataKosong;
        public ActionResult Index(string searchCode, int? searchReceivedBy, string ReceivedBy, string searchCreatedby, DateTime? searchCreatedDate, DateTime? searchReceivedDate, int? page)
        {
            List<VM_T_Souvenir> ListT_Souvenir = T_SouvenirRepo.GetAllData();
            ViewBag.CurrentFilter1 = searchCode;
            ViewBag.ReceivedBy = new SelectList(ListT_Souvenir, "received_by", "first_name", ReceivedBy);
            ViewBag.CurrentFilter2 = searchCreatedby;
            ViewBag.CurrentFilter3 = searchCreatedDate;
            ViewBag.CurrentFilter4 = searchReceivedDate;
            ViewBag.DataKosong = DataKosong;
            if (!string.IsNullOrEmpty(searchCode))
            {
                ListT_Souvenir = ListT_Souvenir.Where(x => x.code == searchCode).ToList();
            }
            if (searchReceivedBy != null)
            {
                ListT_Souvenir = ListT_Souvenir.Where(x => x.received_by == searchReceivedBy).ToList();
            }
            if (searchReceivedDate != null)
            {
                ListT_Souvenir = ListT_Souvenir.Where(x => x.received_date.Value.ToString("dd MMMM yyyy") == searchReceivedDate.Value.ToString("dd MMMM yyyy")).ToList();
            }
            if (searchCreatedDate != null)
            {
                ListT_Souvenir = ListT_Souvenir.Where(x => x.created_date.Value.ToString("dd MMMM yyyy") == searchCreatedDate.Value.ToString("dd MMMM yyyy")).ToList();
            }
            if (!string.IsNullOrEmpty(searchCreatedby))
            {
                ListT_Souvenir = ListT_Souvenir.Where(x => x.created_by == searchCreatedby).ToList();
            }
            if (ListT_Souvenir.Count == 0)
            {
                DataKosong = "Data tidak ditemukan";
            }
            else
            {
                DataKosong = "";
            }

            int pageSize = 3;
            int pageNumber = (page ?? 1);
            return View(ListT_Souvenir.ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult Save()
        {
            ViewBag.ListEmployee = T_SouvenirRepo.GetDataEmployee();
            return View();
        }
        [HttpPost]
        public ActionResult SaveAdd(VM_T_Souvenir datatransaksisouvenir, List<Array> mItem, int counter)
        {
            string result = T_SouvenirRepo.SaveAdd(datatransaksisouvenir, mItem, counter);
            string[] spearator = { "Berhasil" };
            return Json(new { respon = result.Split(spearator, StringSplitOptions.RemoveEmptyEntries) }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.ListEmployee = T_SouvenirRepo.GetDataEmployee();
            return View();
        }
        [HttpPost]
        public ActionResult CreateData(VM_T_Souvenir datatransaksisouvenir)
        {
            string result = T_SouvenirRepo.CreateData(datatransaksisouvenir);
            string[] spearator = { "Berhasil" };
            return Json(new { respon = result.Split(spearator, StringSplitOptions.RemoveEmptyEntries) }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public ActionResult Edit()
        {
            return View();
        }
        [HttpPost]
        public ActionResult UpdateData()
        {
            return View();
        }
        [HttpGet]
        public ActionResult View_T_Souvenir()
        {
            return View();
        }
    }
}