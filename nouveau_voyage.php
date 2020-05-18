<?php
session_start();

    include('bd/web_voyageDB.php'); 

    // S'il n'y a pas de session alors on ne va pas sur cette page
    if (!isset($_SESSION['id'])){
        header('Location: index.php'); 
        exit;
    }

    // On récupère les informations de l'utilisateur connecté
    $afficher_profil = $DB->query("SELECT * FROM users WHERE user_id = ?",
        array($_SESSION['id']));

    $afficher_profil = $afficher_profil->fetch();

    if(!empty($_POST)){
        extract($_POST);
        $valid = true;

        if (isset($_POST['creation_voyage'])){

            $nom = addslashes($_POST['nom_voyage']);
            $date_debut = $_POST['date_d'];
            $date_fin = $_POST['date_f'];
            $ville = $_POST['destination_finale'];

            if(empty($nom)){
                $valid = false;
                $er_nom = "Il faut mettre un nom";
            }

            if(empty($date_debut)){
                $valid = false;
                $er_date_d = "Il faut renseigner une date de début";
            }

            if(empty($date_fin)){
                $valid = false;
                $er_date_f = "Il faut renseigner une date de fin";
            }  

            if ($valid){
                $DB->query("INSERT INTO trips (trip_name,date_beginning,date_end,location,creator_id) VALUES ('$nom','$date_debut','$date_fin','$ville',$_SESSION[id])");
                /*Récupération de l'id du voyage crée*/
                $info_voyage = $DB->query('SELECT * FROM trips WHERE trip_name=?', array($nom));
                foreach ($info_voyage as $info_voyage) {
                  $_SESSION['trip_id'] = $info_voyage['trip_id'];
                }
                /*Message de confirmation*/
                $confirmation = "Votre voyage a bien été crée !";
            }   
        }
    }
    

?>


<!--Script HTML----------------------------------------------------------------->
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link type="text/css" rel="stylesheet" href="style.css">
        <title>Créer un nouveau voyage</title>
    </head>

    <body>
      <!--Police d'écriture-->
      <style>
            @import url('https://fonts.googleapis.com/css2?family=Nunito&display=swap');
      </style>

      <!--Barre de tâches-->
      <div id="barre">
        <!--Logo et nom du site-->
        <a id="nom_site" href="accueil.html">
            <img id="logo" src="images/logo web2.png"/>
          <gf-specimen-header id="header"> Viamicis </gf-specimen-header>
        </a>

        <!--Menu déroulant qui permet l'accès à des pages d'informations-->
          <div id="dropdown">
            <button id="boutonmenuprincipal">Où, quand et comment partir?</button>
              <div id="dropdown-child">
                <a href="periodeideal.html">Selon votre période</a>
                <a href="budget.html">Selon votre bugdet</a>
              </div>
          </div>

        <!--Barre de recherche-->
        <div id="box">
          <form action="recherche.php" method="GET">
            <input id="texte_recherche" type="search" name="recherche" placeholder="Rechercher...">
            <button type="submit" id="bouton_recherche">
              <img id="icone_recherche" src="https://img.icons8.com/dotty/80/000000/search.png"/>
            </button>
          </form>
        </div>

        <!--Bouton qui mène à la page de profil-->
          <p id="profil"><a href="profil.php">Mon profil</a></p>

          <!--Bouton qui mène à la page de deconnexion-->
          <p id="deconnexion"> <a href="deconnexion.php">Déconnexion</a></p>
    </div>

<?php
      if (empty($confirmation)){
?>
      <!--Formulaire : Créer un nouveau voyage-->
      <div id="encart_choix_etape">
      <form method="POST">
          <p class="p_choix_etape"> Nom du voyage :</p>
          <input class="input_choix_etape" name="nom_voyage" type="test" placeholder="nom du voyage" required>
          <!--Message d'erreur si le nom est vide-->
<?php
          if (isset($er_nom)){
?>
            <p><?=$er_nom?></p>
<?php
          }
?>
          <p class="p_choix_etape"> Destination finale :</p>
          <input class="input_choix_etape" name="destination_finale" type="test" placeholder="nom du voyage" required>
          <!--Pas de vérification, l'utilisateur peut ne rien saisir-->

          <p class="p_choix_etape">Date de début du voyage :</p>
          <input class="input_choix_etape" name="date_d" type="date" required>
          <!--Message d'erreur si la date est vide-->
<?php
          if (isset($er_date_d)){
?>
            <p><?=$er_date_d?></p>
<?php
          }
?>

          <p class="p_choix_etape">Date de fin du voyage : </p>
          <input class="input_choix_etape" name="date_f" type="date" required>
          <!--Message d'erreur si la date est vide-->
<?php
          if (isset($er_date_f)){
?>
            <p><?=$er_date_f?></p>
<?php
          }
?>
          <br>
            <div class="button_ajouter_voyage">
                <a href="">
                  Ajouter un ami à ce voyage
                </a>
            </div>
            <br>
            <button type="submit" name="creation_voyage" class="button_ajouter_voyage" id="button_crea_voyage">Créer ce voyage !</button>
          
      </form>
    </div>
<?php
      }
      else {
?>
        
        <div class="encart_confirmation">
            <h1 id="confirmation"><?=$confirmation?></h1>
            <!--Boutons pour rediriger vers l'accueil ou le voyage-->
            <div>
              <a href="carte.html">
              Retourner voir la carte
              </a>
            </div>

            <div>
              <a href="details_voyage.php?trip_id=<?=$_SESSION['trip_id']?>">
              Voir mon voyage
              </a>
            </div>
        </div>
<?php
      }
?>
</body>
</html>