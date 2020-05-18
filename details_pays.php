<!--Permet de voir les détails du voyage, les différentes étapes, les moyens de transports, inviter des amis, ajouter/supprimer des destinations ou des transports ou des activités-->

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

?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link type="text/css" rel="stylesheet" href="style.css">
        <title>Mon voyage</title>
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

        <!--Detail de la destination-->
	<?php 
		//Vérification de l'id du voyage voulu
	    if (isset($_GET['id'])) {
	    	$pays = (array)(int) $_GET['id'];
	    	//Récupération des informations sur le pays dans la bdd
			$information = $DB->query('SELECT * FROM pays WHERE id LIKE ?', $pays);

			//Si il y a des résultats
			if ($information->rowCount() > 0){
                
                //idée : un lien 'en savoir plus' qui redirige sur google/wiki du pays

                //Affichage des destinations situées dans le pays
                $information = $information->fetch();
                $nom_destination = $information['nom_fr_fr'];      #nom de la destination
                $localisation_destination = $information['continent']; #continent
                $image = $information['lien_img'];                     #lien vers l'image du lieu

            }
            else {
                die ("Ce pays n'est pas présent dans la bdd.");
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
        <p id="localisation_detail">Situé sur le continent : <?= $localisation_destination ?>.</p>

    <br><br>

<?php
    //Récupération des informations de la bdd selon la requête
    $information = $DB->query('SELECT * FROM accomodations WHERE pays LIKE "%'.$nom_destination.'%"');
    //Si il y a des résultats
    if ($information->rowCount() > 0){
?>
        <h1>Voici les destinations situées dans le pays <?=$nom_destination?> : </h1>
<?php
        foreach ($information as $information) {
?>
            <ul class="result_recherche">
                <li id="lieu"> <?= $information['accomodation_name']?> </li>
                <hr>
                <li id="ville"> Ville : <?= $information['location']?> </li>
                <li id="continent"> Continent-Pays : <?= $information['pays']?> </li>
                <div class="encart_button_destination">
                    <div class="button-destination" id="detail">
                        <a href="details.php?id=<?=$information['accomodation_id']?>&iduser=<?=$_SESSION['id']?>">
                        Détails
                        </a>
                    </div>
                    
                    <div class="button-destination" id="ajouter">
                        <a href="ajout.php?iduser=<?=$_SESSION['id']?>&iddestination=<?=$information['accomodation_id']?>">
                        Ajouter
                        </a>
                    </div>
                </div>
            </ul>
<?php
        }
    }
    else {
?>
        <h1>Il n'y a aucune destination situées dans ce pays.</h1>
<?php
    }
?>
    </div>
    </body>
</html>