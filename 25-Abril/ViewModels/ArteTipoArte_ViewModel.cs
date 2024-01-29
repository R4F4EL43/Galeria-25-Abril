using _25_Abril.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _25_Abril.ViewModels
{
    public class ArteTiposArte_ViewModel
    {
        public Arte Arte { get; set; }
        public IEnumerable<string> Tipos { get; set; }
        public Tipo_de_Arte Tipo { get; set; }
    }
}
