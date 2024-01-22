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
    
    public partial class Arte
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Arte()
        {
            this.Comentario = new HashSet<Comentario>();
            this.Gosto = new HashSet<Gosto>();
        }
    
        public int ID_Arte { get; set; }
        public string Nome_Arte { get; set; }
        public string Descricao { get; set; }
        public bool Aceite { get; set; }
        public int TipoArte_ID { get; set; }
        public int Conta_ID { get; set; }
    
        public virtual Conta Conta { get; set; }
        public virtual Tipo_de_Arte Tipo_de_Arte { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Comentario> Comentario { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Gosto> Gosto { get; set; }
    }
}
