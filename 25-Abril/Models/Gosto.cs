//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace _25_Abril.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Gosto
    {
        public int ID_Gosto { get; set; }
        public int Conta_ID { get; set; }
        public int Arte_ID { get; set; }
        public System.DateTime Data { get; set; }
    
        public virtual Arte Arte { get; set; }
        public virtual Conta Conta { get; set; }
    }
}
