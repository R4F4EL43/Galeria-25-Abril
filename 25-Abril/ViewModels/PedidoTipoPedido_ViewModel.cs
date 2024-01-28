using _25_Abril.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _25_Abril.ViewModels
{
    public class PedidoTipoPedido_ViewModel
    {
        public List<PedidosAdmin> Pedidos { get; set; }
        public List<TipoPedido> Tipos { get; set; }
    }
}
