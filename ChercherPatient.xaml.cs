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
    /// Logique d'interaction pour ChercherPatient.xaml
    /// </summary>
    public partial class ChercherPatient : Window
    {
        Patient dataPatient;
        public ChercherPatient()
        {
            InitializeComponent();
        }

        private void BtnChercher_Click(object sender, RoutedEventArgs e)
        {
            btnAdmissionPatient.IsEnabled = false;
            if (!String.IsNullOrEmpty(txtRecherche.Text.Trim()))
            {
                try
                {
                    int nassRecherche = int.Parse(txtRecherche.Text.Trim());

                    dataPatient = (from p in Login.MedicDataBase.Patients
                                   where p.Nss == nassRecherche
                                   select p).Single();

                    Assurance assurancePatient = (from a in Login.MedicDataBase.Assurances
                                                    where a.IDAssurance == dataPatient.IDAssurance
                                                    select a).Single();

                    if (dataPatient != null)
                    {
                        //  infos general patient
                        txtNom.Text = dataPatient.Nom;
                        txtNss.Text = dataPatient.Nss.ToString();
                        txtPrenom.Text = dataPatient.Prenom;
                        dateNaissance.SelectedDate = dataPatient.DateNaissance;
                        txtTelephone.Text = dataPatient.Telephone;
                        txtAdresse.Text = dataPatient.Adresse;
                        txtVille.Text = dataPatient.Ville;
                        txtCodePostal.Text = dataPatient.CodePostal;
                        txtProvince.Text = dataPatient.Province;

                        //  infos assurance
                        txtNumAssurance.Text = assurancePatient.IDAssurance.ToString();
                        txtCompagnie.Text = assurancePatient.NomCompanie;

                        btnAdmissionPatient.IsEnabled = true;
                    }
                    else
                    {
                        MessageBox.Show("Pas de patient avec le NAS recherché !!");
                    }                    
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Entrer un numéro NAS du patient a recherché !!");
            }
        }

        private void BtnAjouterPatient_Click(object sender, RoutedEventArgs e)
        {
            AjouterPatient ajoutPatient = new AjouterPatient();
            ajoutPatient.ShowDialog();
            this.Close();
        }
        private void BtnAdmissionPatient_Click(object sender, RoutedEventArgs e)
        {
            GestionAdmission gestionAdmission = new GestionAdmission(dataPatient);
            gestionAdmission.ShowDialog();
            this.Close();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            txtRecherche.Focus();
        }
    }
}
