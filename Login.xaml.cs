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
    /// Logique d'interaction pour Login.xaml
    /// </summary>
    public partial class Login : Window
    {
        private static NLHDataBaseEntities medicDataBase;

        public static NLHDataBaseEntities MedicDataBase { get => medicDataBase; set => medicDataBase = value; }

        public Login()
        {
            InitializeComponent();
            MedicDataBase = new NLHDataBaseEntities();
            txtUtilisateur.Focus();
        }

        private void BtnConnexion_Click(object sender, RoutedEventArgs e)
        {
            // Récupération des valeurs saisies par l'utilisateur en lettres minuscules.
            string utilisateur = txtUtilisateur.Text.Trim().ToLower().Trim();
            string motPasse = txtMotPasse.Password.Trim().ToLower().Trim();
            if (!String.IsNullOrEmpty(utilisateur) && !String.IsNullOrEmpty(motPasse))
            {

                //verification si l'utilisateur est un Admin
                if ((utilisateur == "admin") && (motPasse == "admin"))
                {
                    EspaceAdmin espaceAdmin = new EspaceAdmin();
                    espaceAdmin.Show();
                    this.Close();
                }
                //verification si l'utilisateur est un Medecin
                else if ((utilisateur == "med") && (motPasse == "med"))
                {
                    EspaceMedecin espaceMedecin = new EspaceMedecin();
                    espaceMedecin.Show(); ;
                    this.Close();
                }
                //verification si l'utilisateur est un Préposé
                else if ((utilisateur == "prepo") && (motPasse == "prepo"))
                {
                    EspacePrepose espacePrepose = new EspacePrepose();
                    espacePrepose.Show(); ;
                    this.Close();
                }
                else
                {
                    MessageBox.Show("ERREUR : \nNom d'utilisateur et/ou mot de passe invalides !!!",
                    "Attention",
                    MessageBoxButton.OK,
                    MessageBoxImage.Error);

                    //vider les champs et redonner le focus
                    txtUtilisateur.Text = String.Empty;
                    txtMotPasse.Password = String.Empty;
                    txtUtilisateur.Focus();
                }
            }
            else
            {
                MessageBox.Show("Saisissez un nom d'utilisateur et un mot de passe.",
                "Attention",
                MessageBoxButton.OK,
                MessageBoxImage.Information);
                // Nous redonnons le focus à l'élément txtUtilisateur.
                txtUtilisateur.Focus();
            }
        }

        private void BtnAnnuler_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult reponse = MessageBox.Show("Désirez-vous réellement quitter cette application ? ",
                "Attention", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (reponse == MessageBoxResult.Yes)
            {
                Application.Current.Shutdown();
            }
        }
    }
}
