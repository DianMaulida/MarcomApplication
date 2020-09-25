using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Marcom_Application.Model;
using Marcom_Application.ViewModel;
namespace Marcom_Application.Repo
{
    public class T_SouvenirRepo
    {
        public static List<VM_T_Souvenir> GetDataEmployee()
        {
            List<VM_T_Souvenir> data = new List<VM_T_Souvenir>();
            using (db_marcomEntities db = new db_marcomEntities())
            {
                data = (from a in db.master_employee
                            where a.is_delete == false
                            select new VM_T_Souvenir
                            {
                                idemployee = a.id,
                                fullname = a.first_name + " " + a.last_name
                            }).ToList();
                
            }
            return data;
        }
        public static List<transaksi_souvenir> GetAllDataTSouvenir()
        {
            List<transaksi_souvenir> ListT_Souvenir = new List<transaksi_souvenir>();
            using (db_marcomEntities db = new db_marcomEntities())
            {
                ListT_Souvenir = db.transaksi_souvenir.Where(a => a.is_delete == false).ToList();
            }
            return ListT_Souvenir;
        }
        public static List<VM_T_Souvenir> GetAllData()
        {
            List<VM_T_Souvenir> dataAll = new List<VM_T_Souvenir>();
            using (db_marcomEntities db = new db_marcomEntities())
            {
                dataAll = (from tso in db.transaksi_souvenir
                           join em in db.master_employee on tso.received_by equals em.id
                           where tso.is_delete == false
                           select new VM_T_Souvenir
                           {
                               id = tso.id,
                               code = tso.code,
                               received_by = tso.received_by,
                               first_name = em.first_name,
                               last_name = em.last_name,
                               received_date = tso.received_date,
                               created_by = tso.created_by,
                               created_date = tso.created_date,

                           }).ToList();
            }
            return dataAll;
        }
        public static string GenerateCode()
        {
            string result = "TRSV" + System.DateTime.Now.ToString("ddMMyy") + "000";
            using (var db = new db_marcomEntities())
            {
                var tsouvenir = db.transaksi_souvenir
                    .OrderByDescending(o => o.id).FirstOrDefault();

                var lastID = tsouvenir.id;
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
      
        public static string SaveAdd(VM_T_Souvenir datatransaksisouvenir,List<Array> mItem, int counter)
        {
            try
            {
                transaksi_souvenir t_souvenir = new transaksi_souvenir();
                transaksi_souvenir_item t_souvenir_item = new transaksi_souvenir_item();
              
                string newCode = GenerateCode();
                using (db_marcomEntities db = new db_marcomEntities())
                {
                    t_souvenir.code = newCode;
                    t_souvenir.type = "Additional";
                    t_souvenir.received_by = datatransaksisouvenir.received_by;
                    t_souvenir.received_date = datatransaksisouvenir.received_date;
                    t_souvenir.note = datatransaksisouvenir.notesouvenir;
                    t_souvenir.is_delete = false;
                    t_souvenir.created_by = "Administrator";
                    t_souvenir.created_date = System.DateTime.Now;
                    t_souvenir.request_by = datatransaksisouvenir.received_by;
                    t_souvenir.request_date = System.DateTime.Now;
                    db.transaksi_souvenir.Add(t_souvenir);
                    db.SaveChanges();
                 
                    //save transaksi souvenir item
                    transaksi_souvenir cekid = db.transaksi_souvenir.OrderByDescending(x => x.id).First();
                    for (var i = 0; i < counter; i++)
                    {
                        Array index1 = mItem[i];
                        String get_mId = String.Format("{0}", index1.GetValue(0));
                        String get_qty = String.Format("{0}", index1.GetValue(1));

                        t_souvenir_item.t_souvenir_id = cekid.id;
                        t_souvenir_item.m_souvenir_id = int.Parse(get_mId);
                        t_souvenir_item.qty = int.Parse(get_qty);
                        t_souvenir_item.note = String.Format("{0}", index1.GetValue(2));
                        t_souvenir_item.is_delete = false;
                        t_souvenir_item.created_date = System.DateTime.Now;

                        db.transaksi_souvenir_item.Add(t_souvenir_item);
                        db.SaveChanges();
                    };
                }
                return "Berhasil" + newCode;
            }
            catch (Exception e)
            {

                return e.Message.ToString();
            }
        }

        public static string CreateData(VM_T_Souvenir datatransaksisouvenir)
        {
            try
            {
                transaksi_souvenir t_souvenir = new transaksi_souvenir();
                string newCode = GenerateCode();
                using (db_marcomEntities db = new db_marcomEntities())
                {
                    t_souvenir.code = newCode;
                    t_souvenir.type = "Additional";
                    t_souvenir.received_by = datatransaksisouvenir.received_by;
                    t_souvenir.received_date = datatransaksisouvenir.received_date;
                    t_souvenir.note = datatransaksisouvenir.notesouvenir;
                    t_souvenir.is_delete = false;
                    t_souvenir.created_by = "Administrator";
                    t_souvenir.created_date = System.DateTime.Now;
                    t_souvenir.request_by = datatransaksisouvenir.received_by;
                    t_souvenir.request_date = System.DateTime.Now;
                    db.transaksi_souvenir.Add(t_souvenir);
                    db.SaveChanges();         
                }
                return "Berhasil" + newCode;
            }
            catch (Exception e)
            {

                return e.Message.ToString();
            }
        }
    }
}
