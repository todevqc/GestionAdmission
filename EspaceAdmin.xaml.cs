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
    /// Logique d'interaction pour EspaceAdmin.xaml
    /// </summary>
    public partial class EspaceAdmin : Window
    {
        public EspaceAdmin()
        {
            InitializeComponent();
        }

        private void BtnAjouterMedecin_Click(object sender, RoutedEventArgs e)
        {
            if (!String.IsNullOrEmpty(txtNomMedecin.Text.Trim()) || !String.IsNullOrEmpty(txtPrenomMedecin.Text.Trim()))
            {
                Medecin un_med = new Medecin();
                un_med.NomMedecin = txtNomMedecin.Text.Trim();
                un_med.PrenomMedecin = txtPrenomMedecin.Text.Trim();
                try
                {
                    Login.MedicDataBase.Medecins.Add(un_med);
                    Login.MedicDataBase.SaveChanges();
                    MessageBox.Show("Medecin ajouté avec succes!");

                    // rechargement de la liste des medecins
                    var refresh = from m in Login.MedicDataBase.Medecins
                                  select m;

                    dg_admin_space.DataContext = refresh.ToList();
                    //  remise a zero des champs
                    txtNomMedecin.Text = String.Empty;
                    txtPrenomMedecin.Text = String.Empty;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Pour ajouter un nouveau medecin\nVous devez entrer son nom et prénom !");
            }
        }

        private void BtnModifierMedecin_Click(object sender, RoutedEventArgs e)
        {
            if (!String.IsNullOrEmpty(txtNomMedecin.Text.Trim()) || !String.IsNullOrEmpty(txtPrenomMedecin.Text.Trim()))
            {
                string nom = txtNomMedecin.Text.Trim();
                string prenom = txtPrenomMedecin.Text.Trim();

                Medecin sMedecin = dg_admin_space.SelectedItem as Medecin;

                /*
                    Demander confirmation avant modification
                */
                string messageAvertissement = "Voulez vous vraiment modifier\nles informations de ce medecin ?";
                MessageBoxResult result = MessageBox.Show(messageAvertissement, "Attention !!", MessageBoxButton.OKCancel, MessageBoxImage.Warning);

                if (result == MessageBoxResult.OK)
                {
                    Medecin medecinModifier = (from m in Login.MedicDataBase.Medecins
                                               where m.IDMedecin == sMedecin.IDMedecin
                                               select m).Single();

                    medecinModifier.NomMedecin = nom;
                    medecinModifier.PrenomMedecin = prenom;                    

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
            else
            {
                MessageBox.Show("Vous devez entrer le nom et prénom du médecin !");
            }

            // rechargement de la liste des medecins
            var refresh = from m in Login.MedicDataBase.Medecins
                        select m;

            dg_admin_space.DataContext = refresh.ToList(); 
            //  remise a zero des champs
            txtNomMedecin.Text = String.Empty;
            txtPrenomMedecin.Text = String.Empty;
            //  
            btnModifierMedecin.IsEnabled = false;
            btnAjouterMedecin.IsEnabled = true;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            // chargement de la liste des medecins
            var query = from m in Login.MedicDataBase.Medecins
                        select m;

            dg_admin_space.DataContext = query.ToList();
            dg_admin_space.CanUserAddRows = false;
        }

        private void dg_admin_space_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Medecin sMedecin = dg_admin_space.SelectedItem as Medecin;
            txtNomMedecin.Text = sMedecin.NomMedecin;
            txtPrenomMedecin.Text = sMedecin.PrenomMedecin;

            btnModifierMedecin.IsEnabled = true;
            btnAjouterMedecin.IsEnabled = false;
        }

        private void BtnVider_Click(object sender, RoutedEventArgs e)
        {
            txtNomMedecin.Text = string.Empty;
            txtPrenomMedecin.Text = string.Empty;

            btnModifierMedecin.IsEnabled = false;
            btnAjouterMedecin.IsEnabled = true;

        }

        private void BtnDeconnexion_Click(object sender, RoutedEventArgs e)
        {
            Login espaceLogin = new Login();
            espaceLogin.Show(); ;
            this.Close();
        }
    }
}
