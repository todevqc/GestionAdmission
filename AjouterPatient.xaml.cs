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
    /// Logique d'interaction pour AjouterPatient.xaml
    /// </summary>
    public partial class AjouterPatient : Window
    {
        public AjouterPatient()
        {
            InitializeComponent();
            txtNom.Focus();
        }

        private void BtnEnregistrerPatient_Click(object sender, RoutedEventArgs e)
        {
            if (!String.IsNullOrEmpty(txtNss.Text.Trim()) || !String.IsNullOrEmpty(txtNom.Text.Trim())
                || !String.IsNullOrEmpty(txtPrenom.Text.Trim()) || !String.IsNullOrEmpty(txtTelephone.Text.Trim())
                || !String.IsNullOrEmpty(txtAdresse.Text.Trim()) || !String.IsNullOrEmpty(txtVille.Text.Trim())
                || !String.IsNullOrEmpty(txtCodePostal.Text.Trim()) || !String.IsNullOrEmpty(txtProvince.Text.Trim())
                || !String.IsNullOrEmpty(txtNumAssurance.Text.Trim()) || !String.IsNullOrEmpty(txtCompagnie.Text.Trim())
                || (dateNaissance.SelectedDate.Value == null))
            {
                try
                {
                    //  nouveau patient
                    Patient nouveau_Patient = new Patient();

                    nouveau_Patient.Nss = int.Parse(txtNss.Text.Trim());
                    nouveau_Patient.Nom = txtNom.Text.Trim();
                    nouveau_Patient.Prenom = txtPrenom.Text.Trim();
                    nouveau_Patient.DateNaissance = dateNaissance.SelectedDate.Value;
                    nouveau_Patient.Telephone = txtTelephone.Text.Trim();
                    nouveau_Patient.Adresse = txtAdresse.Text.Trim();
                    nouveau_Patient.Ville = txtVille.Text.Trim();
                    nouveau_Patient.CodePostal = txtCodePostal.Text.Trim();
                    nouveau_Patient.Province = txtProvince.Text.Trim();
                    nouveau_Patient.IDAssurance = int.Parse(txtNumAssurance.Text.Trim());

                    //  nouvelle assurance
                    Assurance nouvelle_Assurance = new Assurance();
                    nouvelle_Assurance.IDAssurance = int.Parse(txtNumAssurance.Text.Trim());
                    nouvelle_Assurance.NomCompanie = txtCompagnie.Text.Trim();

                    //  ajouter les nouvelle objets aux listes
                    Login.MedicDataBase.Patients.Add(nouveau_Patient);
                    Login.MedicDataBase.Assurances.Add(nouvelle_Assurance);

                    //  sauvegarder les modification dans la BDD
                    Login.MedicDataBase.SaveChanges();
                    MessageBox.Show("Patient ajouter avec succès !");

                    this.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Toutes les information du formulaire sont obligatoir !!");
            }
        }

        private void BtnViderChamps_Click(object sender, RoutedEventArgs e)
        {
            txtNom.Text = String.Empty;
            txtNss.Text = String.Empty;
            txtPrenom.Text = String.Empty;
            dateNaissance.SelectedDate = null;
            txtTelephone.Text = String.Empty;
            txtAdresse.Text = String.Empty;
            txtVille.Text = String.Empty;
            txtCodePostal.Text = String.Empty;
            txtProvince.Text = String.Empty;
            txtNumAssurance.Text = String.Empty;
            txtCompagnie.Text = String.Empty;
        }

        private void BtnAnnuler_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
