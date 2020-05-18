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
	    <title>Viamicis - Ajouter une destination</title>
	    <!--Lien vers le CSS-->
		<link href="style.css" rel="stylesheet" type="text/css" />
	</head>

  	<body>
  	<!--Police d'écriture-->
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


	<!--Visualisation de tous les voyages de l'utilisateur-->
	<div id="espace_user_voyage">
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


	  	if (isset($_GET['iddestination']) AND !empty($_GET['iddestination'])){
	  		//Récupération des informations
	  		$getuser = (int) $profil['user_id'];
	  		$getdestination = (int) $_GET['iddestination'];

	  		//Requête à la bdd pour récupérer les informations de tous les voyages de l'utilisateur
	  		$voyages = $DB->query('SELECT * FROM trips WHERE creator_id = ?', array($getuser));

	  		//Vérification si l'utilisateur a des voyages déjà crées
	  		if ($voyages->rowCount()>0) {
	?>
				<p> Voici les voyages que vous avez déjà crées, cliquez sur "ajouter" pour ajouter cette étape au voyage, sinon cliquez "nouveau voyage" pour créez un nouveau voyage avec la destination choisie précédemment : </p>
				<div id="encart_voyage_existant">
	<?php
					foreach ($voyages as $voyages) {
						//Récupération pour chaque voyage de sa date de début et de fin                 
                        $str_date_debut = strftime('%d %B %Y', strtotime($voyages['date_beginning']));
                        $str_date_fin = strftime('%d %B %Y', strtotime($voyages['date_end']));
	?>
						<ul class="result_recherche">
							<li id="lieu"><?= $voyages['trip_name']?></li>
                            <hr>
        <?php
                            //Affichage de la destination si elle est renseignée
                            if (!empty($voyages['location'])){
        ?>
                                <li id="ville"> Ville : <?= $voyages['location']?> </li>
        <?php
                            }
                            else {
        ?>
                                <li id="ville"> Ville non renseignée</li>
        <?php
                            }

                            //Affichage de la date de début du voyage si elle est renseignée
                            if (!empty($str_date_debut)){
        ?>
                                <li id="continent"> Date de début : <?=$str_date_debut?> </li>
        <?php
                            }
                            else {
        ?>
                                <li id="continent"> Date de début non renseignée </li>
        <?php
                            }

                            //Affichage de la date de fin du voyage si elle est renseignée
                            if (!empty($str_date_fin)){
        ?>
                                <li id="continent"> Date de fin : <?=$str_date_fin?> </li>
        <?php
                            }
                            else {
        ?>
                                <li id="continent"> Date de fin non renseignée </li>
        <?php
                            }
        ?>                  
							<div class="encart_button_destination">
								<div class="button_ajout_voyage" id="ajout_voyage">
									<a href="choix_etape.php?voyage_existant=true&iddestination=<?=$getdestination?>&idtrip=<?=$voyages['trip_id']?>">
									Ajouter à ce voyage
									</a>
								</div>
							</div>
						</ul>
						<br>
	<?php
					}
	  		}
	?>		
					
				</div>
			<div id="encart_nouveau_voyage">
		  		<!--On propose à l'utilisateur de créer un nouveau voyage avec cette destination comme steps-->
				<div class="button-destination" id="button_nouveau_voyage">
					<!--Valeur impossible à 99999 pour idtrip car non nécessaire-->
					<a href="choix_etape.php?voyage_existant=false&iddestination=<?=$getdestination?>&idtrip=99999">
					Nouveau Voyage !
					</a>
				</div>
			</div>
	<?php  		
	  	}
	}

	?>
	</div>

</body>
</html>