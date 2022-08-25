using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Projeto
{
    public partial class Cadastro : Form
    {
        public Cadastro()
        {
            InitializeComponent();
        }

        private void btnCadastro_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text == "" ^ txtNome.Text == "" ^ txtSenha.Text == "" ^ txtTelefone.Text == "" ^ (rbtnCliente.Checked == false && rbtnFuncionario.Checked == false) ^ rbtnFuncionario.Checked == true)
            {
                MessageBox.Show("Insira os dados");
            }
            else
            {
                MessageBox.Show("Bom trabalho parça, agora dá um login pra gente ganhar dinheiro!!!!!");

            }
        }
    }
}
