using _25_Abril.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _25_Abril.ViewModels
{
    public class Admin_ViewModel
    {
        public List<Arte> Artes { get; set; }
        public List<Tipo_de_Arte> Tipos { get; set; }
        public List<Conta> Contas { get; set; }        
        public List<FavArtes> FavArtes { get; set; }
        public string tipo { get; set; }
    }
}
