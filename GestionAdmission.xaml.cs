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
    /// Logique d'interaction pour l'espace de gestion des admission retatif a l'interface GestionAdmission.xaml
    /// </summary>
    public partial class GestionAdmission : Window
    {
        private Patient sPatient = null;
        private decimal idAdmission = -1;
        private string[] typeChambres { get; set; }
        public GestionAdmission()
        {
            InitializeComponent();
        }
        /// <summary>
        /// initialisation des element de l'interface
        /// </summary>
        /// <param Patient=le_patient>un objet de type Patient.</param>
        public GestionAdmission(Patient le_patient)
        {
            InitializeComponent();
            sPatient = le_patient;
        }
        /// <summary>
        /// initialisation des element de l'interface
        /// </summary>
        /// <param decimal=ancienne_admission>un decimal representant l'id de l'admission selectionné.</param>
        public GestionAdmission(decimal ancienne_admission)
        {
            InitializeComponent();
            idAdmission = ancienne_admission;
        }

        /// <remarks>
        /// initialisation des informations a afficher dans les champs du formulaire
        /// </remarks>
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            //  initialiser combobox Département
            var listeDepartements = (from dep in Login.MedicDataBase.Departements
                                            select dep.NomDepartement).ToList();
            cboxDepartement.DataContext = listeDepartements;

            //  initialiser combobox Chambre
            var typeChambres = (from type in Login.MedicDataBase.TypeLits
                                select type.Description).ToList();
            cboxChambre.DataContext = typeChambres;

            //  initialiser combobox Medecin
            var listeMedecin = (from m in Login.MedicDataBase.Medecins
                                select m).ToList();
            cboxIDMedecin.DataContext = listeMedecin;

            dateAdmission.SelectedDate = DateTime.Now;

            ///////////////////////////////////////////////////////////////////////////////
            if (ckChirurgie.IsChecked == false)
            {
                dateChirurgie.IsEnabled = false;
            }

            /// <remarks>
            /// permet d'initialiser les informations d'un patient,
            /// pour ne pas avoir a rechercher un patient trouvé precedament.
            /// </remarks>
            if (sPatient != null)
            {
                //  enlever possibilité de vider
                btnVider.IsEnabled = false;

                //  initialisation patient
                txtNss.Text = sPatient.Nss.ToString();
                txtNom.Text = sPatient.Nom.ToString();
                txtPrenom.Text = sPatient.Prenom.ToString();
                dateNaissance.SelectedDate = sPatient.DateNaissance;

                //  bloquer possibilité changement patient
                txtNss.IsEnabled = false;
            }

            /// <remarks>
            /// initialiser les informations d'une admission existante
            /// elle est utilisé pour la modification et l'ajout de services 
            /// </remarks>
            if (idAdmission != -1)
            {
                //  enlever possibilité de vider
                btnVider.IsEnabled = false;

                //  initialisation Lits
                btnAttribuerLit.IsEnabled = false;
                cboxDepartement.IsEnabled = false;
                cboxChambre.IsEnabled = false;

                //  initialisation medecin
                cboxIDMedecin.IsEnabled = false;

                //  bloquer possibilité changement patient, car admission existe déjà
                txtNss.IsEnabled = false;

                //  recuperer les informations utiles grace a IDAdmission et des jointures
                //  Admission, patient, medecin en charge, Lit(departement, chambre)
                var infosAdmission = (from a in Login.MedicDataBase.Admissions
                                      join p in Login.MedicDataBase.Patients on a.Nss equals p.Nss
                                      join m in Login.MedicDataBase.Medecins on a.IDMedecin equals m.IDMedecin
                                      join l in Login.MedicDataBase.Lits on a.NumeroLit equals l.NumeroLit
                                      join dep in Login.MedicDataBase.Departements on l.IDDepartement equals dep.IDDepartement
                                      join ch in Login.MedicDataBase.TypeLits on l.IDType equals ch.IDType
                                      where a.IDAdmission == idAdmission
                                      select new
                                      {
                                          a.DateAdmission,
                                          p.Nss,
                                          p.Nom,
                                          p.Prenom,
                                          p.DateNaissance,
                                          a.ChirurgiePrograme,
                                          a.DateChirurgie,
                                          a.DateConge,
                                          a.Telephone,
                                          a.Televiseur,
                                          m.IDMedecin,
                                          m.NomMedecin,
                                          m.PrenomMedecin,
                                          l.NumeroLit,
                                          l.Occupe,
                                          dep.NomDepartement,
                                          ch.Description
                                      }).SingleOrDefault();

                //  remplire les champs Admission
                txtIDAdmission.Text = idAdmission.ToString();
                dateAdmission.SelectedDate = infosAdmission.DateAdmission;
                ckChirurgie.IsChecked = infosAdmission.ChirurgiePrograme;
                if (ckChirurgie.IsChecked == true)
                {
                    dateChirurgie.SelectedDate = infosAdmission.DateChirurgie;
                }
                if (infosAdmission.DateConge != null) dateConge.SelectedDate = infosAdmission.DateConge;

                //  remplire les champs commodité
                if (infosAdmission.Telephone == true) rbPhoneOui.IsChecked = true;
                if (infosAdmission.Televiseur == true) rbTVOui.IsChecked = true;

                //  remplire les champs patient
                txtNss.Text = infosAdmission.Nss.ToString();
                txtNom.Text = infosAdmission.Nom.ToString();
                txtPrenom.Text = infosAdmission.Prenom.ToString();
                dateNaissance.SelectedDate = infosAdmission.DateNaissance;

                //  remplire les champs medecin
                var leMedecin = (from m in Login.MedicDataBase.Medecins
                                 where m.IDMedecin == infosAdmission.IDMedecin
                                 select m).SingleOrDefault();
                cboxIDMedecin.SelectedItem = leMedecin;
                txtNomMedecin.Text = infosAdmission.NomMedecin.ToString();
                txtPrenomMedecin.Text = infosAdmission.PrenomMedecin.ToString();

                //  remplire les champs Lit
                cboxDepartement.SelectedItem = infosAdmission.NomDepartement;
                cboxChambre.SelectedItem = infosAdmission.Description;
                txtNumLit.Text = infosAdmission.NumeroLit.ToString();
                if (infosAdmission.Occupe == true)
                {
                    lblSituationLit.Content = "Occupé";
                }
                else
                {
                    lblSituationLit.Content = "Liberé";
                }

            }
        }

        private void BtnEnregistrer_Click(object sender, RoutedEventArgs e)
        {
            //  verifier que les champs obligatoires sont non vide
            //  a noter que pour avoir ces champs non modifible manuellement,
            //  d'autres sont sont requis, ce qui garantie que le reste des champs est remplie
            if (!String.IsNullOrEmpty(txtNomMedecin.Text.Trim())
                && !String.IsNullOrEmpty(txtNumLit.Text.Trim()) 
                && !String.IsNullOrEmpty(txtNom.Text.Trim()))
            {
                try
                {
                    //  creation de l'objet Admission qui me sert dans la modification et l'ajout
                    Admission nouvelleAdmission;

                    //  initialisation de l'objet Admission
                    //  differament selon s'il est dèjà existant donc Modification
                    if (idAdmission != -1)
                    {
                        //  creer admission avec information de la BDD "Modification"
                        nouvelleAdmission = (from d in Login.MedicDataBase.Admissions
                                             where d.IDAdmission == idAdmission
                                             select d).SingleOrDefault() as Admission;
                    }
                    //  si l'objet Admission est nouveau donc Ajout
                    else
                    {
                        //  creer nouvelle admission
                        nouvelleAdmission = new Admission();
                    }

                    //  Valeur a Ajouter ou modifier dans l'objet Admission
                    //  partie Admission
                    nouvelleAdmission.DateAdmission = dateAdmission.SelectedDate.Value;
                    nouvelleAdmission.ChirurgiePrograme = ckChirurgie.IsChecked;
                    if (ckChirurgie.IsChecked == true)
                    {
                        nouvelleAdmission.DateChirurgie = dateChirurgie.SelectedDate.Value;
                    }
                    else
                    {
                        nouvelleAdmission.DateChirurgie = null;
                    }

                    //  partie commodité
                    if (rbTVOui.IsChecked == true) nouvelleAdmission.Televiseur = true;
                    else nouvelleAdmission.Televiseur = false;

                    if (rbPhoneOui.IsChecked == true) nouvelleAdmission.Telephone = true;
                    else nouvelleAdmission.Telephone = false;

                    //  partie patient
                    nouvelleAdmission.Nss = int.Parse(txtNss.Text.Trim());

                    //  partie medecin
                    nouvelleAdmission.IDMedecin = (cboxIDMedecin.SelectedItem as Medecin).IDMedecin;

                    //  partie Lit
                    nouvelleAdmission.NumeroLit = int.Parse(txtNumLit.Text.Trim());

                    //  Ajout efectif a la liste si c'est une nouvelle admission
                    if (idAdmission == -1)
                    {
                        Login.MedicDataBase.Admissions.Add(nouvelleAdmission);
                    }


                    //  Metre a jour le lit a occupé
                    Lit litOccupe = (from oc in Login.MedicDataBase.Lits
                                     where oc.NumeroLit == nouvelleAdmission.NumeroLit
                                     select oc).Single();

                    litOccupe.Occupe = true;

                    //  sauvegarder les modification dans la BDD
                    Login.MedicDataBase.SaveChanges();
                    MessageBox.Show("La nouvelle admission à étais ajouter avec succès !");

                    this.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                string messagesErreur = "Informations manquante !!!\n";

                if (String.IsNullOrEmpty(txtNom.Text.Trim()))
                {
                    messagesErreur += " - Aucun patient selectionné ou Nss patient invalide !!! ";
                }

                if (cboxIDMedecin.SelectedIndex < 0)
                {
                    messagesErreur += "\n - Veuillez Attribuer un medecin a ce patient !!";
                }
                if (String.IsNullOrEmpty(txtNumLit.Text.Trim()))
                {
                    messagesErreur += "\n - Veuillez Attribuer un lit a ce patient !!";
                }

                MessageBox.Show(messagesErreur, "Erreur !!", MessageBoxButton.OK, MessageBoxImage.Error);

            }
        }

        private void BtnVider_Click(object sender, RoutedEventArgs e)
        {
            dateNaissance.SelectedDate = null;
            dateConge.SelectedDate = null;
            cboxDepartement.SelectedItem = null;
            cboxIDMedecin.SelectedItem = null;

            txtNss.Text = string.Empty;
            txtNom.Text = string.Empty;
            txtPrenom.Text = string.Empty;
            cboxChambre.Text = string.Empty;
            txtNumLit.Text = string.Empty;
            txtNomMedecin.Text = string.Empty;
            txtPrenomMedecin.Text = string.Empty;

            lblSituationLit.Content = "";

            ckChirurgie.IsChecked = false;
            dateChirurgie.SelectedDate = null;
            dateChirurgie.IsEnabled = false;
            //txtNss.IsEnabled = false;

            //btnAttribuerLit.IsEnabled = true;
        }

        private void BtnAnnuler_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void BtnAttribuerLit_Click(object sender, RoutedEventArgs e)
        {
            if (cboxDepartement.SelectedIndex > -1
                && cboxChambre.SelectedIndex > -1)
            {
                try
                {
                    Departement dep = (from d in Login.MedicDataBase.Departements
                                       where d.NomDepartement == cboxDepartement.SelectedItem.ToString()
                                       select d).Single() as Departement;
                    TypeLit chambre = (from t in Login.MedicDataBase.TypeLits
                                       where t.Description == cboxChambre.SelectedItem.ToString()
                                       select t).Single() as TypeLit;

                    Lit litDispo = (from l in Login.MedicDataBase.Lits
                                    where l.IDDepartement == dep.IDDepartement
                                    where l.IDType == chambre.IDType
                                    where l.Occupe == false
                                    select l).First();
                    if (litDispo != null)
                    {
                        txtNumLit.Text = litDispo.NumeroLit.ToString();
                        MessageBox.Show("Lit Attribué avec succès !");
                        btnAttribuerLit.IsEnabled = false;
                    }
                    else
                    {
                        MessageBox.Show("Aucun lit correspondants aux critères n'est disponible !");
                    }

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                string messagesErreur = "Informations manquante !!!\n";
                if (cboxDepartement.SelectedIndex < 0)
                {
                    messagesErreur += " - Selectionnez un departement !!! ";
                }

                if (cboxChambre.SelectedIndex < 0)
                {
                    messagesErreur += "\n - Selectionnez un type de chambre !!";
                }

                MessageBox.Show(messagesErreur, "Erreur !!", MessageBoxButton.OK, MessageBoxImage.Error);

            }
        }

        private void ckChirurgie_Checked(object sender, RoutedEventArgs e)
        {
            dateChirurgie.IsEnabled = true; 
            
            //cboxDepartement.DataContext = "chirurgie";
        }

        private void ckChirurgie_Unchecked(object sender, RoutedEventArgs e)
        {
            dateChirurgie.IsEnabled = false;
            dateChirurgie.SelectedDate = null;
            /*
            var listeDepartements = (from dep in Login.MedicDataBase.Departements
                                     select dep.NomDepartement).ToList();
            cboxDepartement.DataContext = listeDepartements;*/
        }

        private void BtnVerifierPatient_Click(object sender, RoutedEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtNss.Text.Trim()))
            {
                int nssPatient = int.Parse(txtNss.Text.Trim());
                try
                {
                    //  chercher si le patient existe et le recuperer
                    Patient monPatient = (from p in Login.MedicDataBase.Patients
                                          where p.Nss == nssPatient
                                          select p).SingleOrDefault() as Patient;

                    if (monPatient != null)
                    {
                        //  initialisation patient
                        txtNom.Text = monPatient.Nom.ToString();
                        txtPrenom.Text = monPatient.Prenom.ToString();
                        dateNaissance.SelectedDate = monPatient.DateNaissance;
                    }
                    else
                    {
                        MessageBox.Show("le NSS que vous avez entrer ne corresponds a aucun patient !!\nveuillez réessayer.", "Erreur !!", MessageBoxButton.OK, MessageBoxImage.Error);
                        txtNss.Text = string.Empty;
                        txtNss.Focus();
                    }

                }
                catch (Exception)
                {
                    MessageBox.Show("le NSS est que vous avez entrer ne corresponds a aucun patient !!\nveuillez réessayer.", "Erreur !!", MessageBoxButton.OK, MessageBoxImage.Error);
                    txtNss.Text = string.Empty;
                    txtNss.Focus();
                }

            }
            else
            {
                MessageBox.Show("Veuillez entrer un NSS du patient !!", "Erreur !!", MessageBoxButton.OK, MessageBoxImage.Error);
            }


        }
    }
}
