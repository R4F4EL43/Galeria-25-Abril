using _25_Abril.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _25_Abril.ViewModels
{
    public class ArteComentarios_ViewModel
    {
        public Arte Arte { get; set; }
        public List<Comentario> Comentarios { get; set; }
    }
}
