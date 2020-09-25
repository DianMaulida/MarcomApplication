using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marcom_Application.ViewModel
{
    public class VM_T_Souvenir
    {
        //tabel transaksi souvenir
        public int id { get; set; }
        public string code { get; set; }
        public string type { get; set; }
        public Nullable<int> t_event_id { get; set; }
        public Nullable<int> request_by { get; set; }
        public Nullable<System.DateTime> request_date { get; set; }
        public Nullable<System.DateTime> request_due_date { get; set; }
        public Nullable<int> approved_by { get; set; }
        public Nullable<System.DateTime> approved_date { get; set; }
        public Nullable<int> received_by { get; set; }
        public Nullable<System.DateTime> received_date { get; set; }
        public Nullable<int> settlement_by { get; set; }
        public Nullable<System.DateTime> settlement_date { get; set; }
        public Nullable<int> settlement_approved_by { get; set; }
        public Nullable<System.DateTime> settlement_approved_date { get; set; }
        public Nullable<int> status { get; set; }
        public string notesouvenir { get; set; }
        public string reject_reason { get; set; }
        public Nullable<bool> is_delete { get; set; }
        public string created_by { get; set; }
        public Nullable<System.DateTime> created_date { get; set; }
        public string updated_by { get; set; }
        public Nullable<System.DateTime> updated_date { get; set; }
        
       // itemsouvenir
        public int t_souvenir_id { get; set; }
        public int m_souvenir_id { get; set; }
        public Nullable<long> qty { get; set; }
        public Nullable<long> qty_settlement { get; set; }
        public string note { get; set; }
        //employee
        public int idemployee { get; set; }
        public string employee_number { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string fullname { get; set; }
        public Nullable<int> m_company_id { get; set; }
        public string email { get; set; }

        public string FullName
        {
            get
            {
                return String.Format("{0} {1}", first_name, last_name);
            }
        }
    }
}
