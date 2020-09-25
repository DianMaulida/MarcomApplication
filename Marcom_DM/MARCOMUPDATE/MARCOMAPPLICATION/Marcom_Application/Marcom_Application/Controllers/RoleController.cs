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
    public class RoleController : Controller
    {
        // GET: Role
        public static string DataKosong;
        public ActionResult Index(string RoleCode, string RoleName, string searchName, string searchCode, DateTime? searchDate, string searchCreatedby, int? page)
        {
            List<master_role> ListRole = RoleRepo.GetAllData();
            ViewBag.RoleCode = new SelectList(ListRole, "code", "code", RoleCode);
            ViewBag.RoleName = new SelectList(ListRole, "name", "name", RoleName);
            ViewBag.CurrentFilter1 = searchDate;
            ViewBag.CurrentFilter2 = searchCreatedby;
            ViewBag.DataKosong = DataKosong;

            if (!string.IsNullOrEmpty(searchName))
            {
                ListRole = ListRole.Where(x => x.name == searchName).ToList();
            }
            if (!string.IsNullOrEmpty(searchCode))
            {
                ListRole = ListRole.Where(x => x.code == searchCode).ToList();
            }
            if (searchDate != null)
            {
                ListRole = ListRole.Where(x => x.created_date.ToString("dd MMMM yyyy") == searchDate.Value.ToString("dd MMMM yyyy")).ToList();
            }
            if (!string.IsNullOrEmpty(searchCreatedby))
            {
                ListRole = ListRole.Where(x => x.created_by == searchCreatedby).ToList();
            }
            if (ListRole.Count == 0)
            {
                DataKosong = "Data tidak ditemukan";
            }
            else
            {
                DataKosong = "";
            }

            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(ListRole.ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateData(master_role datarole)
        {
            string result = RoleRepo.CreateData(datarole);
            string[] spearator = { "Berhasil" };
            return Json(new { respon = result.Split(spearator, StringSplitOptions.RemoveEmptyEntries) }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            master_role datarole = RoleRepo.GetDataById(id);
            return View(datarole);
        }
        [HttpPost]
        public ActionResult UpdateData(master_role datarole)
        {
            string result = RoleRepo.UpdateData(datarole);
            return Json(new { respon = result }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public ActionResult View(int id)
        {
            master_role dataview = RoleRepo.GetDataById(id);
            return View(dataview);
        }
        public ActionResult Delete (int id)
        {
            string result = CompanyRepo.DeleteData(id);
            string[] spearator = { "Berhasil" };
            return Json(new { respon = result.Split(spearator, StringSplitOptions.RemoveEmptyEntries) }, JsonRequestBehavior.AllowGet);
        }
        //cek name sama 
        public JsonResult CheckName(string name)
        {
            return Json(RoleRepo.GetDataNama(name), JsonRequestBehavior.AllowGet);
        }
    }
}