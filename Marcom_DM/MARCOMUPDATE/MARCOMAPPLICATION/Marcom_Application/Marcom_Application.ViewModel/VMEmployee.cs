using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marcom_Application.ViewModel
{
    public class VMEmployee
    {
        //company
        public int idcompany { get; set; }
        public string codecompany { get; set; }
        public string namecompany { get; set; }
       //employee
        public int id { get; set; }
        public string employee_number { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public Nullable<int> m_company_id { get; set; }
        public string email { get; set; }
        public string created_by { get; set; }
        public System.DateTime created_date { get; set; }
        
       
    }
}
