using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Projet_Integrateur_ToufikDahmani
{
    /// <summary>
    /// Logique d'interaction pour EspaceMedecin.xaml
    /// </summary>
    public partial class EspaceMedecin : Window
    {
        public EspaceMedecin()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            var infosPatient    = (from p in Login.MedicDataBase.Patients
                                  join a in Login.MedicDataBase.Admissions on p.Nss equals a.Nss
                                  join l in Login.MedicDataBase.Lits on a.NumeroLit equals l.NumeroLit
                                  join dep in Login.MedicDataBase.Departements on l.IDDepartement equals dep.IDDepartement
                                  select new
                                  {
                                      a.IDAdmission,
                                      a.DateAdmission,
                                      p.Nss,
                                      p.Nom,
                                      p.Prenom,
                                      p.DateNaissance,
                                      a.ChirurgiePrograme,
                                      a.DateChirurgie,
                                      a.DateConge,
                                      l.NumeroLit,
                                      l.Occupe,
                                      dep.NomDepartement
                                  }).ToList();


            dg_medecin_space.DataContext = infosPatient;
            dg_medecin_space.CanUserAddRows = false;
        }

        private void BtnDonnerConge_Click(object sender, RoutedEventArgs e)
        {
            decimal idAdmission = decimal.Parse(((Button)sender).CommandParameter.ToString());
            /*
                    Demander confirmation avant modification
                */
            string messageAvertissement = "Voulez vous vraiment donner congé a ce patient ?";
            MessageBoxResult result = MessageBox.Show(messageAvertissement, "Attention !!", MessageBoxButton.OKCancel, MessageBoxImage.Warning);

            if (result == MessageBoxResult.OK)
            {
                Lit litALiberer = (from l in Login.MedicDataBase.Lits
                                   join a in Login.MedicDataBase.Admissions on l.NumeroLit equals a.NumeroLit
                                   where a.IDAdmission == idAdmission
                                   select l).Single();

                Admission dateChange = (from a in Login.MedicDataBase.Admissions
                                        where a.IDAdmission == idAdmission
                                        select a).Single();
                if (litALiberer.Occupe == true)
                {
                    litALiberer.Occupe = false;
                    dateChange.DateConge = DateTime.Today;

                    try
                    {
                        Login.MedicDataBase.SaveChanges();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }

                }
            }
        }

        private void BtnDeconnexion_Click(object sender, RoutedEventArgs e)
        {
            Login espaceLogin = new Login();
            espaceLogin.Show(); ;
            this.Close();
        }
    }
}