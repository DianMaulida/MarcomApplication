﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Marcom_Application.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class db_marcomEntities : DbContext
    {
        public db_marcomEntities()
            : base("name=db_marcomEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<master_company> master_company { get; set; }
        public virtual DbSet<master_product> master_product { get; set; }
        public virtual DbSet<master_souvenir> master_souvenir { get; set; }
        public virtual DbSet<master_unit> master_unit { get; set; }
        public virtual DbSet<master_employee> master_employee { get; set; }
        public virtual DbSet<transaksi_event> transaksi_event { get; set; }
        public virtual DbSet<master_role> master_role { get; set; }
        public virtual DbSet<transaksi_souvenir_item> transaksi_souvenir_item { get; set; }
        public virtual DbSet<transaksi_souvenir> transaksi_souvenir { get; set; }
    }
}