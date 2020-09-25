using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Marcom_Application.Model;
using Marcom_Application.Repo;
using PagedList;
namespace Marcom_Application.Controllers
{
    public class CompanyController : Controller
    {
        // GET: Company
        public static string DataKosong;
        public ActionResult Index(string CompanyCode, string CompanyName, string searchName, string searchCode, DateTime? searchDate, string searchCreatedby, int? page)
        {
            List<master_company> ListCompany = CompanyRepo.GetAllData();
            ViewBag.CompanyCode = new SelectList(ListCompany, "code", "code", CompanyCode);
            ViewBag.CompanyName = new SelectList(ListCompany, "name", "name", CompanyName);
            ViewBag.CurrentFilter1 = searchDate;
            ViewBag.CurrentFilter2 = searchCreatedby;
            ViewBag.DataKosong = DataKosong;

            if (!string.IsNullOrEmpty(searchName))
            {
                ListCompany = ListCompany.Where(x => x.name == searchName).ToList();
            }
            if (!string.IsNullOrEmpty(searchCode))
            {
                ListCompany = ListCompany.Where(x => x.code == searchCode).ToList();
            }
            if (searchDate != null)
            {
                ListCompany = ListCompany.Where(x => x.created_date.ToString("dd MMMM yyyy") == searchDate.Value.ToString("dd MMMM yyyy")).ToList();
            }
            if (!string.IsNullOrEmpty(searchCreatedby))
            {
                ListCompany = ListCompany.Where(x => x.created_by == searchCreatedby).ToList();
            }
            if (ListCompany.Count == 0)
            {
                DataKosong = "Data tidak ditemukan";
            }
            else
            {
                DataKosong = "";
            }

            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(ListCompany.ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateData(master_company datacompany)
        {
            string result = CompanyRepo.CreateData(datacompany);
            string[] spearator = { "Berhasil" };
            return Json(new { respon = result.Split(spearator, StringSplitOptions.RemoveEmptyEntries) }, JsonRequestBehavior.AllowGet);
            
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            master_company datacompany = CompanyRepo.GetDataById(id);
            return View(datacompany);
        }
        [HttpPost]
        public ActionResult UpdateData(master_company datacompany)
        {
            string result = CompanyRepo.UpdateData(datacompany);
            return Json(new { respon = result }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Delete(int id)
        {
            string result = CompanyRepo.DeleteData(id);
            string[] spearator = { "Berhasil" };
            return Json(new { respon = result.Split(spearator, StringSplitOptions.RemoveEmptyEntries) }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public ActionResult ViewCompany(int id )
        {
            master_company dataview = CompanyRepo.GetDataById(id);
            return View(dataview);
        }
        //cek name sama 
        public JsonResult CheckName(string name)
        {
            return Json(CompanyRepo.GetDataNama(name), JsonRequestBehavior.AllowGet);
        }
    }
}