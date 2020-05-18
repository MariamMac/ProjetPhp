<!--
Projet Web - Site voyages
Choix des caratéristiques de l'étape et ajout au voyage
-->

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

	    
	}

	//Récupération des infos saisies
		//Ajout d'une destination à un voyage existant
	if (!empty($_GET) AND isset($_GET['ajout'])){
		if ($_SESSION['existance'] == "true"){
			if (isset($_GET['nom_etape'], $_GET['date_debut_etape'], $_GET['date_fin_etape']) AND !empty($_GET['nom_etape']) 
			  		AND !empty($_GET['date_debut_etape']) 
			  		AND !empty($_GET['date_fin_etape'])){
				//Récupération des informations
				$nom = $_GET['nom_etape'];
				$date_d = $_GET['date_debut_etape'];
				$date_f = $_GET['date_fin_etape'];

				//Ajout à la BDD
				$DB->insert("INSERT INTO steps (step_name, trip_id, date_beginning, date_end, accomodation_id) VALUES 
	                (?, ?, ?, ?, ?)", 
	                array($nom, $_SESSION['trip_id'], $date_d, $date_f, $_SESSION['iddestin']));

				//Affichage message
				$confirmation = "Votre voyage a bien été mis à jour !";
			}
		}
	}
		//Création d'un nouveau voyage puis ajout de la destination
	else if (!empty($_GET) AND isset($_GET['creation'])) {
		if (isset($_GET['nom_voyage'], $_GET['nom_finale'], $_GET['date_debut_voyage'], $_GET['date_fin_voyage']) AND !empty($_GET['nom_voyage']) AND !empty($_GET['nom_finale']) AND !empty($_GET['date_debut_voyage']) AND !empty($_GET['date_fin_voyage'])){

			//Récupération des infos sur le voyage
			$nom = (array) $_GET['nom_voyage'];
			$date_debut = $_GET['date_debut_voyage'];
			$date_fin = $_GET['date_fin_voyage'];
			$ville = (array) $_GET['nom_finale'];

			foreach ($nom as $nom) {
			foreach ($ville as $ville) {
				//Créer un nouveau voyage
				$DB->query("INSERT INTO trips (trip_name,date_beginning,date_end,location,creator_id) VALUES(?,?,?,?,?)", array($nom,$date_debut,$date_fin,$ville,$_SESSION['id']));

				$info_voyage = $DB->query('SELECT * FROM trips WHERE trip_name=?', array($nom));
				foreach ($info_voyage as $info_voyage) {
					$_SESSION['trip_id'] = $info_voyage['trip_id'];
				}
			}
			}

			//Ajouter la destination au voyage
			if (isset($_GET['nom_etape'], $_GET['date_debut_etape'], $_GET['date_fin_etape']) AND !empty($_GET['nom_etape']) 
			  		AND !empty($_GET['date_debut_etape']) 
			  		AND !empty($_GET['date_fin_etape'])){
				
				//Récupération des informations
				$nom_e = $_GET['nom_etape'];
				$date_d_e = $_GET['date_debut_etape'];
				$date_f_e = $_GET['date_fin_etape'];
				
				//Ajout à la BDD
				$DB->insert("INSERT INTO steps (step_name, trip_id, date_beginning, date_end, accomodation_id) VALUES 
	                (?, ?, ?, ?, ?)", 
	                array($nom_e, $_SESSION['trip_id'], $date_d_e, $date_f_e, $_SESSION['iddestin']));
				
				//Affichage message
				$confirmation = "Votre voyage a bien été mis à jour !";	
			}	
			
		}
	}
		//Si on arrive sur la page et qu'on a rien saisi : récupération des infos passés en paramètres
	else {
		$_SESSION['trip_id'] = $_GET['idtrip'];
	    $_SESSION['iddestin'] = $_GET['iddestination'];
	    $_SESSION['existance'] = $_GET['voyage_existant'];
	}

?>
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
            <p id="profil"><a href="profil.php">Mon profil</a></p>

            <!--Bouton qui mène à la page de deconnexion-->
            <p id="deconnexion"> <a href="deconnexion.php">Déconnexion</a></p>
        </div>



	<!--Visualisation de tous les voyages de l'utilisateur-->
	<div id="encart_choix_etape">

<?php
	  	//Tests si les informations envoyées sont correctes
	  	//voyage_exitant passe "true" si le voyage existe déjà, "false" si il faut le créer
	  	if (isset($_GET['voyage_existant'], $_GET['iddestination'], $_GET['idtrip']) AND !empty($_GET['voyage_existant']) AND !empty($_GET['iddestination'])){

	  		//Récupération des informations
	  		$getexistance = $_GET['voyage_existant'];
	  		$getiddestination = (int) $_GET['iddestination'];
	  		$getiduser = (int) $profil['user_id'];
	  		$getidtrip = (int) $_GET['idtrip'];

	  		//Requête
	  		//Les informations sur la destination (accomodation)
	  		$destination = $DB->query('SELECT * FROM accomodations WHERE accomodation_id = ?', array($getiddestination));

	  		//Si la destination existe bien
	  		if ($destination->rowCount()==1) {
		  		//Si on doit ajouter l'étape à un voyage existant
		  		if ($getexistance == "true"){
	?>
					<!--Formulaire pour inscrire toutes les informations concernant l'étape avec la destination choisie-->
					<form method="GET">
						<p class="p_choix_etape">Nom de l'étape : </p>
						<input class="input_choix_etape" type="text" name="nom_etape" placeholder="Nom"><br>

						<p class="p_choix_etape">Date de début : </p>
						<input class="input_choix_etape" type="Date" name="date_debut_etape"><br>

						<p class="p_choix_etape">Date de fin :</p>
						<input class="input_choix_etape" type="Date" name="date_fin_etape"><br>

						<button type="submit" name="ajout" class="button_ajouter_voyage" id="button_crea_voyage">
							Ajouter cette étape
						</button>
					</form>

	<?php
		  		}
		  		//Si on doit créer un nouveau voyage
		  		else if ($getexistance == "false"){
	?>
					<!--Formulaire pour inscrire toutes les informations concernant le voyage avec la destination choisie-->
					<form method="GET" >
						<!--Création d'un nouveau voyage-->
						<h1>Commencons par créer votre voyage !</h1>
						<p class="p_choix_etape">Nom du voyage : </p>
						<input class="input_choix_etape" type="text" name="nom_voyage" placeholder="Nom"><br>

						<p class="p_choix_etape">Nom de la destination finale : </p>
						<input class="input_choix_etape" type="text" name="nom_finale" placeholder="Nom"><br>

						<p class="p_choix_etape">Date de début du voyage : </p>
						<input class="input_choix_etape" type="Date" name="date_debut_voyage"><br>

						<p class="p_choix_etape">Date de fin du voyage :</p>
						<input class="input_choix_etape" type="Date" name="date_fin_voyage"><br><br>


						<!--Création de l'étape-->
						<h1>Ajoutons-y maintenant l'étape sélectionnée précédemment :</h1>
						<p class="p_choix_etape">Nom de l'étape : </p>
						<input class="input_choix_etape" type="text" name="nom_etape" placeholder="Nom"><br>

						<p class="p_choix_etape">Date de début de l'étape : </p>
						<input class="input_choix_etape" type="Date" name="date_debut_etape"><br>

						<p class="p_choix_etape">Date de fin de l'étape :</p>
						<input class="input_choix_etape" type="Date" name="date_fin_etape"><br>

						
						<button type="submit" name="creation" class="button_ajouter_voyage" id="button_crea_voyage">
							Créer ce voyage
						</button>

					</form>
	<?php
	  			}
	  		}
	  	}
	  	else if (isset($confirmation)){
	?>
			<h1 id="confirmation"> <?=$confirmation?> </h1>
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
	<?php
	  	}
	?>


	</div>

</body>
</html>