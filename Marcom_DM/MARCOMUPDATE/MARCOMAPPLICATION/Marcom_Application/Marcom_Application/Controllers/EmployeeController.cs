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
    public class EmployeeController : Controller
    {
        // GET: Employee
        public static string DataKosong;
        public ActionResult Index(string searchCode, string CompanyCode, string searchName, string searchCompanyCode, DateTime? searchDate, string searchCreatedby, int? page)
        {
            List<VMEmployee> ListEmployee = EmployeeRepo.GetAllData();
            ViewBag.CompanyCode = new SelectList(ListEmployee, "namecompany", "namecompany", CompanyCode);
            ViewBag.CurrentFilter1 = searchCode;
            ViewBag.CurrentFilter2 = searchName;
            ViewBag.CurrentFilter3 = searchDate;
            ViewBag.CurrentFilter4 = searchCreatedby;
            ViewBag.DataKosong = DataKosong;
            if (!string.IsNullOrEmpty(searchName))
            {
                ListEmployee = ListEmployee.Where(x => x.first_name == searchName && x.last_name == searchName).ToList();
            }
            if (!string.IsNullOrEmpty(searchCode))
            {
                ListEmployee = ListEmployee.Where(x => x.employee_number == searchCode).ToList();
            }
            if (!string.IsNullOrEmpty(searchCompanyCode))
            {
                ListEmployee = ListEmployee.Where(x => x.namecompany == searchCompanyCode).ToList();
            }
            if (searchDate != null)
            {
                ListEmployee = ListEmployee.Where(x => x.created_date.ToString("dd MMMM yyyy") == searchDate.Value.ToString("dd MMMM yyyy")).ToList();
            }
            if (!string.IsNullOrEmpty(searchCreatedby))
            {
                ListEmployee = ListEmployee.Where(x => x.created_by == searchCreatedby).ToList();
            }
            if (ListEmployee.Count == 0)
            {
                DataKosong = "Data tidak ditemukan";
            }
            else
            {
                DataKosong = "";
            }

            int pageSize = 3;
            int pageNumber = (page ?? 1);
            return View(ListEmployee.ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.ListJenisCompany = EmployeeRepo.GetDataCompany();
            return View();
        }
        [HttpPost]
        public ActionResult CreateData(VMEmployee dataEmployee)
        {
            string result = EmployeeRepo.CreateData(dataEmployee);
            string[] spearator = { "Berhasil" };
            return Json(new { respon = result.Split(spearator, StringSplitOptions.RemoveEmptyEntries) }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            ViewBag.ListJenisCompany = EmployeeRepo.GetDataCompany();
            VMEmployee dataEmployee = EmployeeRepo.GetDataById(id);
            return View(dataEmployee);
        }
        [HttpPost]
        public ActionResult UpdateData(VMEmployee dataemployee)
        {
            string result = EmployeeRepo.UpdateData(dataemployee);
            return Json(new { respon = result }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public  ActionResult View(int id)
        {
            ViewBag.ListJenisCompany = EmployeeRepo.GetDataCompany();
            VMEmployee dataEmployee = EmployeeRepo.GetDataById(id);
            return View(dataEmployee);
        }
        public ActionResult Delete(VMEmployee dataEmployee)
        {
            string result = EmployeeRepo.DeleteData(dataEmployee);
            string[] spearator = { "Berhasil" };
            return Json(new { respon = result.Split(spearator, StringSplitOptions.RemoveEmptyEntries) }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult CheckName(string name)
        {
            return Json(EmployeeRepo.GetDataNama(name), JsonRequestBehavior.AllowGet);
        }
    }
}