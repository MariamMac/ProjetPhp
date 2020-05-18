<!--
Projet Web - Site voyages
Script PHP de recherche
-->
<!DOCTYPE html>
<html>
	<head>
	    <!--Encodage-->
	    <meta charset="utf-8">
	    <!--Je sais pas c'est quoi-->
	    <meta name="viewport" content="width=device-width">
	    <!--Titre de l'onglet-->
	    <title>Viamicis - Ajouter une étape</title>
	    <!--Lien vers le CSS-->
		<link href="style.css" rel="stylesheet" type="text/css" />
	</head>

  	<body>
  	<!--Police d'écriture-->
  	<style>
		@import url('https://fonts.googleapis.com/css2?family=Nunito&display=swap');
	</style>

    <!--Barre de navigation-->
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
      <p id="profil"><a href="index.php">Se connecter</a></p>

    </div>

<?php 
		if (extension_loaded ('PDO')) {
			session_start();

	    include('bd/web_voyageDB.php'); 

	    // S'il n'y a pas de session alors on ne va pas sur cette page
	    if (!isset($_SESSION['id'])){
	        header('Location: index.php'); 
	        exit;
	    }
	    // On récupère les informations de l'utilisateur connecté
	    $profil = $DB->query("SELECT * FROM users WHERE user_id = ?",
	        array($_SESSION['id']));

	    $profil = $profil->fetch();

		  	//Tests si les informations envoyées sont correctes
		  	//voyage_exitant passe "true" si le voyage existe déjà, "false" si il faut le créer
		  	if (isset($_GET['nom_etape'], $_GET['date_debut_etape'], $_GET['date_fin_etape']) 
		  		AND !empty($_GET['nom_etape']) 
		  		AND !empty($_GET['date_debut_etape']) 
		  		AND !empty($_GET['date_fin_etape'])){

		  		//Récupération des informations
				$nom = $_GET['nom_etape'];
				$date_d = $_GET['date_debut_etape'];
				$date_f = $_GET['date_fin_etape'];

				//Ajout à la BDD
				$DB->insert("INSERT INTO steps (step_name, trip_id, mail, password, created) VALUES 
                    (?, ?, ?, ?, ?)", 
                    array($nom, $prenom, $mail, $mdp, $date_creation_compte));

?>
					<p>Votre étape a été ajouté à votre voyage !</p>
<?php
	  		}
	  	}
?>

</body>
</html>