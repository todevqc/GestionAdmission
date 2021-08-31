using System;
using System.Collections.Generic;
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
    /// Logique d'interaction pour EspacePrepose.xaml
    /// </summary>
    public partial class EspacePrepose : Window
    {
        public EspacePrepose()
        {
            InitializeComponent();
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            RefreshListAdmission();
            dg_admissions_space.CanUserAddRows = false;
        }

        private void BtnChercherPatient_Click(object sender, RoutedEventArgs e)
        {
            ChercherPatient espaceRecherche = new ChercherPatient();
            espaceRecherche.ShowDialog();
        }

        private void BtnAjouterPatient_Click(object sender, RoutedEventArgs e)
        {
            AjouterPatient ajoutPatient= new AjouterPatient();
            ajoutPatient.ShowDialog();
        }

        private void BtnDetails_Click(object sender, RoutedEventArgs e)
        {
            decimal idAdmission = decimal.Parse(((Button)sender).CommandParameter.ToString());

            GestionAdmission gestionAdmission = new GestionAdmission(idAdmission);
            gestionAdmission.ShowDialog();
            // rechargement de la liste des Admission
            RefreshListAdmission();
        }

        private void BtnAdmission_Click(object sender, RoutedEventArgs e)
        {
            GestionAdmission gestionAdmission = new GestionAdmission();
            gestionAdmission.ShowDialog();
            // rechargement de la liste des Admission
            RefreshListAdmission();
        }

        private void BtnDeconnexion_Click(object sender, RoutedEventArgs e)
        {
            Login espaceLogin = new Login();
            espaceLogin.Show(); ;
            this.Close();
        }

        public void RefreshListAdmission()
        {
            var lesAdmission = (from ad in Login.MedicDataBase.Admissions
                        join p in Login.MedicDataBase.Patients on ad.Nss equals p.Nss
                        select new
                        {
                            ad.IDAdmission,
                            ad.ChirurgiePrograme,
                            p.Nss,
                            p.Nom,
                            p.Prenom,
                            p.DateNaissance,
                            ad.DateConge,
                            ad.DateAdmission
                        }).ToList();
            dg_admissions_space.DataContext = lesAdmission;
        }
    }
}
