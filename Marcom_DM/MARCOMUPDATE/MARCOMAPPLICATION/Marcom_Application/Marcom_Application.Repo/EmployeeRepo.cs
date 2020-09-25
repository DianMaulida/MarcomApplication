using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Marcom_Application.Model;
using Marcom_Application.ViewModel;

namespace Marcom_Application.Repo
{
    public class EmployeeRepo
    {
        public static List<master_company> GetDataCompany()
        {
            List<master_company> data = new List<master_company>();
            using (db_marcomEntities db = new db_marcomEntities())
            {
                data = db.master_company.Where(a => a.is_delete == false).ToList();
            }
            return data;
        }
        public static List<VMEmployee> GetAllData()
        {
            List<VMEmployee> dataAll = new List<VMEmployee>();
            using (db_marcomEntities db = new db_marcomEntities())
            {
                dataAll = (from em in db.master_employee
                           join co in db.master_company on em.m_company_id equals co.id
                           where em.is_delete == false
                           select new VMEmployee
                           {
                               id = em.id,
                               employee_number = em.employee_number,
                               first_name = em.first_name,
                               last_name = em.last_name,
                               m_company_id = em.m_company_id,
                               namecompany = co.name,
                               created_by = em.created_by,
                               created_date = em.created_date

                           }).ToList();
            }
            return dataAll;
        }
       public static string CreateData(VMEmployee dataEmployee)
        {
            try
            {
                master_employee employee = new master_employee();
                using (db_marcomEntities db = new db_marcomEntities())
                {

                    employee.employee_number = dataEmployee.employee_number;
                    employee.first_name = dataEmployee.first_name;
                    employee.last_name = dataEmployee.last_name;
                    employee.m_company_id = dataEmployee.m_company_id;
                    employee.email = dataEmployee.email;
                    employee.is_delete = false;
                    employee.created_by = "Administrator";
                    employee.created_date = System.DateTime.Now;

                    db.master_employee.Add(employee);
                    db.SaveChanges();
                }
                return "Berhasil" + dataEmployee.employee_number;
            }
            catch (Exception e)
            {

                return e.Message.ToString();
            }
        }
        public static VMEmployee GetDataById(int id)
        {
            VMEmployee employee = new VMEmployee();
            using (db_marcomEntities db = new db_marcomEntities())
            {
                employee = (from em in db.master_employee
                            join co in db.master_company on em.m_company_id equals co.id
                            where em.is_delete == false && em.id == id

                            select new VMEmployee
                            {
                                id = em.id,
                                employee_number = em.employee_number,
                                first_name = em.first_name,
                                last_name = em.last_name,
                                email = em.email,
                                m_company_id = em.m_company_id,
                                idcompany = co.id,
                                namecompany = co.name,
                                
                            }).FirstOrDefault();
            }
            return employee;
        }

        public static string UpdateData(VMEmployee dataEmployee)
        {
            try
            {
                master_employee employee = new master_employee();
                using (db_marcomEntities db = new db_marcomEntities())
                {
                    employee = db.master_employee.Where(a => a.id == dataEmployee.id).FirstOrDefault();


                    employee.employee_number = dataEmployee.employee_number;
                    employee.first_name = dataEmployee.first_name;
                    employee.last_name = dataEmployee.last_name;
                    employee.email = dataEmployee.email;
                    employee.m_company_id = dataEmployee.m_company_id;
                    employee.is_delete = false;
                    employee.updated_by = "Administrator";
                    employee.updated_date = System.DateTime.Now;
                    db.Entry(employee).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                }
                return "Berhasil";
            }
            catch (Exception e)
            {
                return e.Message.ToString();
            }
        }
        public static string DeleteData(VMEmployee dataEmployee)
        {
            try
            {
                master_employee employee = new master_employee();
                using (db_marcomEntities db = new db_marcomEntities())
                {
                    employee = db.master_employee.Where(a => a.id == dataEmployee.id).FirstOrDefault();
                    employee.is_delete = true;

                    db.Entry(employee).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                }
                return "Berhasil" + employee.employee_number;
            }
            catch (Exception e)
            {

                return e.Message.ToString();
            }
        }
        public static string GetDataNama(string employee_number)
        {
            master_employee data = new master_employee();
            using (db_marcomEntities db = new db_marcomEntities())
            {
                data = db.master_employee.Where(a => a.is_delete == false && a.employee_number == employee_number).FirstOrDefault();
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
