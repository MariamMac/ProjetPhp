<?php
session_start();

include('bd/web_voyageDB.php');

// S'il n'y a pas de session alors on ne va pas sur cette page
if (!isset($_SESSION['id'])) {
  header('Location: index.php');
  exit;
}

// On récupère l'activite à modifier
if (isset($_GET['step_id'])) {
  $step_id = $_GET['step_id'];
  $_SESSION['step_id'] = $_GET['step_id'];
} else {
  if (isset($_SESSION['step_id'])) {
    $step_id = $_SESSION['step_id'];
  } else {
    echo '<script language=javascript>
          alert(\'Pas d\'étape choisie à modifier choisi\');
        </script> ';
  }
}

if (!empty($_POST)) {
  extract($_POST);
  $valid = true;

  if (isset($_POST['creation_activite'])) {

    $nom = (string) $_POST['nom_activite'];
    $date_debut = $_POST['date_d'];
    $date_fin = $_POST['date_f'];
    $description = addslashes($_POST['description']);
    $price = $_POST['price'];

    if (empty($nom)) {
      $valid = false;
      $er_nom = "Il faut mettre un nom";
    }

    if (empty($date_debut)) {
      $valid = false;
      $er_date_d = "Il faut renseigner une date de début";
    }

    if (empty($date_fin)) {
      $valid = false;
      $er_date_f = "Il faut renseigner une date de fin";
    }

    if ($valid) {
      if(isset($acticity['activity_id'])){
        $DB->query("UPDATE activities SET activity_name='$nom',date_beginning='$date_debut',date_end='$date_fin',description='$description',
        price='$price', step_id='$step_id'
         WHERE activity_id=$activity_id");
      }else{
        $DB->query("INSERT INTO activities (activity_name,date_beginning,date_end,description,price, step_id) VALUES ('$nom','$date_debut','$date_fin','$description','$price', '$step_id')");
      }

      /*Récupération de l'id de l'activité crée*/
      unset($_SESSION['activity_id']) ;
      unset($_SESSION['step_id']) ;
      $confirmation = "Votre activité a bien été modifié !";
    }
  }
}


?>



<!--Script HTML-------------------------------------------------------------------------------------->
<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link type="text/css" rel="stylesheet" href="style.css">
  <title>Créer une nouvelle activité</title>
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
      <img id="logo" src="images/logo web2.png" />
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
          <img id="icone_recherche" src="https://img.icons8.com/dotty/80/000000/search.png" />
        </button>
      </form>
    </div>

    <!--Bouton qui mène à la page de profil-->
    <p id="profil"><a href="profil.php">Mon profil</a></p>

    <!--Bouton qui mène à la page de deconnexion-->
    <p id="deconnexion"> <a href="deconnexion.php">Déconnexion</a></p>
  </div>

  <?php
  if (empty($confirmation)) {
  ?>
    <!--Formulaire : Créer une nouvelle activité-->
    <div id="encart_choix_etape">

      <h1>Ajouter une nouvelle activité</h1>

      <form method="post" action="nouvel_activite.php">
            <p class="p_choix_etape">Nom de l'activité : </p>
            <input id="champ_saisie_nom" class="input_choix_etape" name="nom_activite" type="text" placeholder="nom de l'activité" required>
        <!--Message d'erreur si le nom est vide-->
        <?php
        if (isset($er_nom)) {
        ?>
          <p><?= $er_nom ?></p>
        <?php
        }
        ?>


        <p class="p_choix_etape"> Description ou informations sur votre activité :</p>
        <input class="input_choix_etape" name="description" type="text" placeholder="description de l'activité">
        <!--Pas de vérification, l'utilisateur peut ne rien saisir-->

        <p class="p_choix_etape"> Prix :</p>
        <input class="input_choix_etape" name="price" type="number" placeholder="prix de l'activité">
        <!--Pas de vérification, l'utilisateur peut ne rien saisir-->

        <p class="p_choix_etape">Date de début de l'activité :</p>
        <input class="input_choix_etape" name="date_d" type="date" required>
        <!--Message d'erreur si la date est vide-->
        <?php
        if (isset($er_date_d)) {
        ?>
          <p><?= $er_date_d ?></p>
        <?php
        }
        ?>

        <p class="p_choix_etape">Date de fin de l'activité : </p>
        <input class="input_choix_etape" name="date_f" type="date" required>
        <!--Message d'erreur si la date est vide-->
        <?php
        if (isset($er_date_f)) {
        ?>
          <p><?= $er_date_f ?></p>
        <?php
        }
        ?>
        <br>
        <button type="submit" name="creation_activite" class="button_ajouter_voyage" id="button_crea_voyage">Ajouter cette activité</button>
        <div>
      </form>
    <?php
  } else {
    ?>
      <div class="encart_confirmation">
        <h1 id="confirmation"><?= $confirmation ?></h1>
        <!--Boutons pour rediriger vers l'accueil ou l'activite-->
        <div>
          <a href="carte.html">
            Retourner voir la carte
          </a>
        </div>

        <div>
          <a href="activite_etape.php?step_id=<?=$step_id?>">
            Voir mon étape
          </a>
        </div>
      </div>
    <?php
  }
    ?>
</body>

</html>

