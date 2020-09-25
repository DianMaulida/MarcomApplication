using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Marcom_Application.Model;

namespace Marcom_Application.Repo
{
    public class CompanyRepo
    {
        public static List<master_company> GetAllData()
        {
            List<master_company> ListCompany = new List<master_company>();
            using ( db_marcomEntities db = new db_marcomEntities())
            {
                ListCompany = db.master_company.Where(a => a.is_delete == false).ToList();
            }
            return ListCompany;
        }
        //code generated
        public static string GenerateCode()
        {
            string result = "CP00";
            using (var db = new db_marcomEntities())
            {
                var company = db.master_company
                    .OrderByDescending(o => o.id).FirstOrDefault();

                var lastID = company.id;
                var newCode = lastID + 1;

                if (newCode < 10)
                {
                    result += "0" + newCode;
                }
                else
                {
                    result += newCode; //maks 99
                }
            }
            return result;
        }
        //tambah master company
        public static string CreateData(master_company datacompany)
        {
            try
            {
                master_company company = new master_company();
                string newCode = GenerateCode();
                using (db_marcomEntities db = new db_marcomEntities())
                {

                    company.code = newCode;
                    company.name = datacompany.name;
                    company.address = datacompany.address;
                    company.phone = datacompany.phone;
                    company.email = datacompany.email;
                    company.is_delete = false;
                    company.created_by = "Administrator";
                    company.created_date = System.DateTime.Now;

                    db.master_company.Add(company);
                    db.SaveChanges();
                }
                return "Berhasil" + newCode;
            }
            catch (Exception e)
            {

                return e.Message.ToString();
            }
        }
        public static master_company GetDataById(int id)
        {
            master_company company = new master_company();
            using (db_marcomEntities db = new db_marcomEntities())
            {
                company = db.master_company.Where(a => a.id == id).FirstOrDefault();
            }
            return company;
        }
        //update data
        public static string UpdateData(master_company datacompany)
        {
            try
            {
                master_company company = new master_company();
                using (db_marcomEntities db = new db_marcomEntities())
                {
                    company = db.master_company.Where(a => a.id == datacompany.id).FirstOrDefault();
                    company.name = datacompany.name;
                    company.address = datacompany.address;
                    company.phone = datacompany.phone;
                    company.email = datacompany.email;
                    company.is_delete = false;
                    company.updated_by = "Administrator";
                    company.updated_date = System.DateTime.Now;

                    db.Entry(company).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                }
                return "Berhasil";
            }
            catch (Exception e)
            {
                return e.Message.ToString();
            }
        }
        //deletedata
        public static string DeleteData(int id)
        {
            try
            {
                master_company datacompany = new master_company ();
                using (db_marcomEntities db = new db_marcomEntities())
                {
                    datacompany = db.master_company.Where(a => a.id == id).FirstOrDefault();
                    datacompany.is_delete = true;

                    db.Entry(datacompany).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                }
                return "Berhasil" + datacompany.code;
            }
            catch (Exception e)
            {

                return e.Message.ToString();
            }
        }
        public static string GetDataNama(string name)
        {
            master_company data = new master_company();
            using (db_marcomEntities db = new db_marcomEntities())
            {
                data = db.master_company.Where(a => a.is_delete == false && a.name == name).FirstOrDefault();
            }
            if (data != null)
            {
                return "ada";
            }
            else
            {
                return "tidak ada";
            }
        }
    }
}
