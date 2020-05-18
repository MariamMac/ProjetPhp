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
	    <title>Viamicis - Recherche</title>
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
			<a id="nom_site" href="carte.html">
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


	<!--Div espace de recherche - Affichage des résultats-->
	<div id="espace_result_recherche">
		<?php
			
    		session_start(); // Permet de savoir s'il y a un utilisateur (session) c'est connecté sur notre site.

    		include('bd/web_voyageDB.php'); // Fichier PHP contenant la connexion à notre BDD

		 		
				//id de l'utilisateur connecté sur la page
				$id_user = $_SESSION['id'];

				//Recherche d'une information
				if (isset($_GET['recherche']) AND !empty($_GET['recherche'])) {
					//Récupération de la recherche effectuée
					$requete = htmlspecialchars($_GET['recherche']);
					//Pour séparer chaque mot saisi et les mettre dans un tableau
					//$tab_req = explode(' ', $requete);

					//Récupération des informations de la bdd selon la requête
					$information = $DB->query('SELECT * FROM accomodations WHERE pays LIKE "%'.$requete.'%"');
					//Si il y a des résultats
					if ($information->rowCount() > 0){
		?>
						<h1>Voici les destinations situé dans le lieu "<?= $requete?>" : </h1>
		<?php
						foreach ($information as $information) {
							//Affichage seulement si la destination n'est pas une création d'un utilisateur
							if ($information['saisie_user']==null){
		?>
							<ul class="result_recherche">
								<li id="lieu"> <?= $information['accomodation_name']?> </li>
								<hr>
								<li id="ville"> Ville : <?= $information['location']?> </li>
								<li id="continent"> Continent-Pays : <?= $information['pays']?> </li>
								<div class="encart_button_destination">
									<div class="button-destination" id="detail">
										<a href="details.php?id=<?=$information['accomodation_id']?>&iduser=<?=$id_user?>">
										Détails
										</a>
									</div>
									
									<div class="button-destination" id="ajouter">
										<!--iduser A REMPLACER PAR LE VRAI ID DE L'UTILISATEUR CONNECTE-->
										<a href="ajout.php?iduser=<?=$id_user?>&iddestination=<?=$information['accomodation_id']?>">
										Ajouter
										</a>
									</div>
								</div>
							</ul>
		<?php
						}
						}
					}
					//Si il n'y a aucun résultat pour la requête
					else {
						//On essaie de chercher avec les noms des destinations
						$information = $DB->query('SELECT * FROM accomodations WHERE accomodation_name LIKE "%'.$requete.'%"');
						if ($information->rowCount() > 0){
							//Affichage seulement si la destination n'est pas une création d'un utilisateur
							if ($information['saisie_user']==null){
		?>
							<h1>Voici les destinations comportant "<?= $requete?>" : </h1>
		<?php
							foreach ($information as $information){
		?>
							<ul class="result_recherche">
								<li id="lieu"> <?= $information['accomodation_name']?> </li>
								<hr>
								<li id="ville"> Ville : <?= $information['location']?> </li>
								<li id="continent"> Continent-Pays : <?= $information['pays']?> </li>
								<div class="encart_button_destination">
									<div class="button-destination" id="detail">
										<a href="details.php?id=<?=$information['accomodation_id']?>&iduser=<?=$id_user?>">
										Détails
										</a>
									</div>
									
									<div class="button-destination" id="ajouter">
										<a href="ajout.php?iduser=<?=$id_user?>&iddestination=<?=$information['accomodation_id']?>">
										Ajouter
										</a>
									</div>
								</div>
							</ul>

		<?php
							}
						}
						}
						//On essaie avec les noms des villes
						else {
		
							//On essaie de chercher avec les noms des destinations
							$information = $DB->query('SELECT * FROM accomodations WHERE location LIKE "%'.$requete.'%"');
							if ($information->rowCount() > 0){
								//Affichage seulement si la destination n'est pas une création d'un utilisateur
								if ($information['saisie_user']==null){
		?>
								<h1>Voici les destinations situées dans la ville "<?= $requete?>" : </h1>
		<?php
								foreach ($information as $information){
		?>
									<ul class="result_recherche">
										<li id="lieu"> <?= $information['accomodation_name']?> </li>
										<hr>
										<li id="ville"> Ville : <?= $information['location']?> </li>
										<li id="continent"> Continent-Pays : <?= $information['pays']?> </li>
										<div class="encart_button_destination">
											<div class="button-destination" id="detail">
												<a href="details.php?id=<?=$information['accomodation_id']?>&iduser=<?=$id_user?>">
												Détails
												</a>
											</div>
											
											<div class="button-destination" id="ajouter">
												<a href="ajout.php?iduser=<?=$id_user?>&iddestination=<?=$information['accomodation_id']?>">
												Ajouter
												</a>
											</div>
										</div>
									</ul>

		<?php
								}
							}
							}


							//Il n'y a pas de résultats
							else {
		?>
								<h1>Aucun résultat trouvé pour : <?= $requete?>. </h1>	
		<?php				
							}
						}
						
					}
				}
			
		
		?>
		<br>
		<hr>
		<br>



		<!--Recherche dans la table pays ------------------------------------------------------- -->

		<?php
				//Recherche d'une information
				if (isset($_GET['recherche']) AND !empty($_GET['recherche'])) {
					//Récupération de la recherche effectuée
					$requete = htmlspecialchars($_GET['recherche']);
					//Pour séparer chaque mot saisi et les mettre dans un tableau
					//$tab_req = explode(' ', $requete);

					//Récupération des informations de la bdd selon la requête
					
					$information = $DB->query('SELECT * FROM pays WHERE continent LIKE "%'.$requete.'%"');
					//Si il y a des résultats
					if ($information->rowCount() > 0){
		?>
						<h1>Voici les pays situé sur le continent "<?= $requete?>" : </h1>
		<?php
						foreach ($information as $information) {
		?>
							<ul class="result_recherche">
								<li id="lieu"> <?= $information['nom_fr_fr']?> </li>
								<hr>
								<li id="continent"> Continent-Pays : <?= $information['continent']?> </li>
								<div class="encart_button_destination">
									<div class="button-destination" id="detail">
										<a href="details_pays.php?id=<?=$information['id']?>">
										Détails
										</a>
									</div>
								</div>
							</ul>
		<?php
						}
					}
					//On essaie avec les noms des villes
					else {
						$information = $DB->query('SELECT * FROM pays WHERE nom_fr_fr LIKE "%'.$requete.'%"');
						//On essaie de chercher avec les noms des destinations
						
						if ($information->rowCount() > 0){
		?>
							<h1>Voici les pays correspondant à la recherche "<?= $requete?>" : </h1>
		<?php
							foreach ($information as $information){
		?>
								<ul class="result_recherche">
									<li id="lieu"> <?= $information['nom_fr_fr']?> </li>
									<hr>
									<li id="continent"> Continent-Pays : <?= $information['continent']?> </li>
									<div class="encart_button_destination">
										<div class="button-destination" id="detail">
											<a href="details_pays.php?id=<?=$information['id']?>">
											Détails
											</a>
										</div>
									</div>
								</ul>

		<?php
							}
						}

						//Il n'y a pas de résultats
						else {
		?>
							<h1>Aucun pays correspondant à : <?= $requete?>. </h1>	

		<?php				
						}
					}
						
				}			
		
		?>

	</div>

</body>

</html>