using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Marcom_Application.Model;
using Marcom_Application.ViewModel;

namespace Marcom_Application.Repo
{
    public class RoleRepo
    {
        public static List<master_role> GetAllData()
        {
            List<master_role> ListRole = new List<master_role>();
            using (db_marcomEntities db = new db_marcomEntities()) 
            {
                ListRole = db.master_role.Where(a => a.is_delete == false).ToList();
            }
            return ListRole;
        }
        //code generated
        public static string GenerateCode()
        {
            string result = "RO00";
            using (var db = new db_marcomEntities())
            {
                var role = db.master_role
                    .OrderByDescending(o => o.id).FirstOrDefault();

                var lastID = role.id;
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
        public static string CreateData(master_role datarole)
        {
            try
            {
                master_role role = new master_role();
                string newCode = GenerateCode();
                using (db_marcomEntities db = new db_marcomEntities())
                {

                    role.code = newCode;
                    role.name = datarole.name;
                    role.description = datarole.description;
                    role.is_delete = false;
                    role.created_by = "Administrator";
                    role.created_date = System.DateTime.Now;
                    db.master_role.Add(role);
                    db.SaveChanges();
                }
                return "Berhasil" + newCode;
            }
            catch (Exception e)
            {
                return e.Message.ToString();
            }
        }
        public static master_role GetDataById(int id)
        {
            master_role role = new master_role();
            using (db_marcomEntities db = new db_marcomEntities())
            {
                role = db.master_role.Where(a => a.id == id).FirstOrDefault();
            }
            return role;
        }
        //update data
        public static string UpdateData(master_role datarole)
        {
            try
            {
                master_role role = new master_role();
                using (db_marcomEntities db = new db_marcomEntities())
                {
                    role = db.master_role.Where(a => a.id == datarole.id).FirstOrDefault();
                    role.name = datarole.name;
                    role.description = datarole.description;
                    role.is_delete = false;
                    role.updated_by = "Administrator";
                    role.updated_date = System.DateTime.Now;
        
                    db.Entry(role).State = System.Data.Entity.EntityState.Modified;
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
                master_role datarole = new master_role();
                using (db_marcomEntities db = new db_marcomEntities())
                {
                    datarole = db.master_role.Where(a => a.id == id).FirstOrDefault();
                    datarole.is_delete = true;

                    db.Entry(datarole).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                }
                return "Berhasil" + datarole.code;
            }
            catch (Exception e)
            {

                return e.Message.ToString();
            }
        }
        public static string GetDataNama(string name)
        {
            master_role data = new master_role();
            using (db_marcomEntities db = new db_marcomEntities())
            {
                data = db.master_role.Where(a => a.is_delete == false && a.name == name).FirstOrDefault();
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
