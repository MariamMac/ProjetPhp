<!--
Projet Web - Site voyages
Script PHP détails d'une destination
-->
<!DOCTYPE html>
<html>
	<head>
	    <!--Encodage-->
	    <meta charset="utf-8">
	    <!--Je sais pas c'est quoi-->
	    <meta name="viewport" content="width=device-width">
	    <!--Titre de l'onglet-->
	    <title>Viamicis - Détails</title>
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
            <p id="profil"><a href="profil.php">Mon profil</a></p>

            <!--Bouton qui mène à la page de deconnexion-->
            <p id="deconnexion"> <a href="deconnexion.php">Déconnexion</a></p>
        </div>


	<!--Présentation des détails de la destination-->
	<!--Connexion à la bdd-->
	<?php
			if (extension_loaded ('PDO')) {
				//Connexion à la bdd
				$serveur = "localhost";
				$nom_utilisateur="root";
				$mdp="";
			  	$database = new PDO("mysql:host=$serveur;dbname=web_voyage",$nom_utilisateur,$mdp);

			  	//Recherche d'une information
				if (isset($_GET['id'], $_GET['iduser']) AND !empty($_GET['id']) AND !empty($_GET['iduser'])) {
					//Récupération de la recherche effectuée
					$id_destination = htmlspecialchars($_GET['id']);
					$id_user = (int) $_GET['iduser'];

					$info_destination = $database->prepare('SELECT * FROM accomodations WHERE accomodation_id= ?');
					$info_destination->execute(array($id_destination));

					if ($info_destination->rowCount() == 1){
						$info_destination = $info_destination->fetch();
						$nom_destination = $info_destination['accomodation_name'];		#nom de la destination
						$description_destination = $info_destination['description'];	#description
						$prix_destination = $info_destination['price'];				#prix
						$localisation_destination = $info_destination['location'];	#ville
						$image = $info_destination['lien_img'];						#lien vers l'image du lieu

					}
					else {
						die ("Cette destination n'existe pas.");
					}
				}
			}
	?>
	<div id="encart-detail">
	<?php
		if ($image!=NULL){
	?>
			<img src="<?=$image?>" id="image_detail">
	<?php
		}
	?>
		<h1 id="nom_detail"><?= $nom_destination ?></h1>
		<p id="localisation_detail">Situé dans la ville de : <?= $localisation_destination ?>.</p>
		<p id="description_detail">Description de la destination : <br> <?= $description_destination ?></p>
	<?php
		if ($prix_destination==NULL){
	?>
		<p id="prix_detail">Prix de la nuit : non reseigné.</p>
	<?php
		}
		else {
	?>
		<p id="prix_detail">Prix de la nuit : <?= $prix_destination ?> €.</p>
	<?php 
		} 
	?>
		<!--Bouton pour ajouter la destination à un voyage-->
		<div class="button_ajout_voyage" id="ajout_voyage">
			<a href="ajout.php?iduser=<?=$id_user?>&iddestination=<?=$id_destination?>">
				Ajouter à un de mes voyages
			</a>
		</div>

		<!--Boutons de like et dislike-->
	<!--
		<a href="like_dislike.php?recherche=<?= $requete?>&type=1&id=<?= $information['accomodation_id']?>">
			<img src="icone_like_heart.png" class="like">
		</a>
		<a href="like_dislike.php?recherche=<?= $requete?>&type=2&id=<?= $information['accomodation_id']?>">
			<img src="icone_dislike_heart.png" class="like">
		</a>

	-->

</body>
</html>