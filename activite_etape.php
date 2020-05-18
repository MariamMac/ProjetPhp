<!--Permet de voir les détails du voyage, les différentes étapes, les moyens de transports, inviter des amis, ajouter/supprimer des destinations ou des transports ou des activités-->

<?php
session_start();

include('bd/web_voyageDB.php');

// S'il n'y a pas de session alors on ne va pas sur cette page
if (!isset($_SESSION['id'])) {
    header('Location: index.php');
    exit;
}

// On récupère les informations de l'utilisateur connecté
$afficher_profil = $DB->query(
    "SELECT * FROM users WHERE user_id = ?",
    array($_SESSION['id'])
);

$afficher_profil = $afficher_profil->fetch();

// Si la variable "$_GET" contient des informations alors on les traitres
if (!empty($_GET)) {
    extract($_GET);

    if (isset($_GET['delete_activity']) && isset($_GET['step_id'])) {

        $activity_id = $_GET['delete_activity'];

        // On supprime l'activité !
        $req = $DB->query(
            "DELETE 
                FROM activities
                WHERE activity_id = ?",
            array($activity_id)
        );

        header('Location: activite_etape.php?step_id='.$_GET['step_id']);

    }
}

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
        <a id="nom_site" href="carte.html">
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




    <!--Detail de la destination-->
    <?php
    //Vérification de l'id du voyage voulu
    if (isset($_GET['step_id']) and !empty($_GET['step_id'])) {
        $step_id = (array) (int) $_GET['step_id'];
        //Récupération des informations sur l'étape dans la bdd
        $step = $DB->query('SELECT * FROM steps WHERE step_id LIKE ?', $step_id);
        //Récupération de toutes les étapes du voyage
        $activities = $DB->query('SELECT * FROM activities WHERE step_id LIKE ?', $step_id);
        //Récupération de toutes les activités prévues pour ce voyage
        //A FAIRE
        //Récupération des transports prévu pour cette étape
        //A FAIRE

        //Si il y a des résultats
        if ($step->rowCount() > 0) {
            foreach ($step as $step) {
    ?>
                <div id="encart_details_voyage">
                    <h1>Etape : "<?= $step['step_name'] ?>" </h1>

                    <?php
                    //VERIFICATION DE LA LOCATION
                    //Récupération de la destination
                    $accomodation = $DB->query("SELECT * FROM accomodations WHERE accomodation_id = $step[accomodation_id]");
                    $accomodation = $accomodation->fetch();
                    if ($step['accomodation_id'] == NULL) {
                    ?>
                        <h2>Destination de l'étape non renseignée</h2>
                    <?php
                    } else {
                    ?>
                        <h2>Destionation de l'étape : <?= $accomodation['accomodation_name'] ?></h2>
                    <?php
                    }

                    ?>
                    <?php
                    //Récupération pour chaque voyage de sa date de début et de fin                 
                    $str_date_debut = strftime('%d %B %Y', strtotime($step['date_beginning']));

                    //VERIFICATION DE LA DATE DE DEPART
                    if ($step['date_beginning'] == NULL) {
                    ?>
                        <h3>Date de départ non renseignée</h3>
                    <?php
                    } else {
                    ?>
                        <h3>Date de départ : <?= $str_date_debut ?></h3>
                    <?php
                    }

                    ?>
                    <?php
                    //Récupération pour chaque voyage de sa date de début et de fin
                    $str_date_fin = strftime('%d %B %Y', strtotime($step['date_end']));
                    //VERIFICATION DE LA DATE D'ARRIVEE
                    if ($step['date_end'] == NULL) {
                    ?>
                        <h3>Date d'arrivée non renseignée</h3>
                    <?php
                    } else {
                    ?>
                        <h3>Date d'arrivée : <?= $str_date_fin ?></h3>
                <?php
                    }
                }
                ?>
                <div class="button_detail_voyage">
                    <!--Permet de modifier un voyage-->
                    <a href="redirection_activite.php?step_id=<?= $_GET['step_id'] ?>">
                        Ajouter une activité
                    </a>
                </div>
                <?php

                if ($activities->rowCount() > 0) {
                ?>

                    <h2>Voici toutes les activités de cette étape :</h2>
                    <?php
                    foreach ($activities as $activities) {
                        // //Récupération du nom de chaque activité
                        // $id_destination = (array)(int) $activities['accomodation_id'];
                        // $destination = $DB->query('SELECT * FROM accomodations WHERE accomodations.accomodation_id LIKE ?', $id_destination);
                        // foreach ($destination as $destination) {
                        //Récupération pour chaque voyage de sa date de début et de fin                 
                        $str_date_debut = strftime('%d %B %Y', strtotime($activities['date_beginning']));
                        $str_date_fin = strftime('%d %B %Y', strtotime($activities['date_end']));
                    ?>
                        <ul class="result_recherche">
                            <li id="lieu"><?= $activities['activity_name'] ?></li>
                            <hr>
                            <li id="continent">Date de début : <?= $str_date_debut ?></li>
                            <li id="continent">Date de fin : <?= $str_date_fin ?></li>

                            <li id="description">
                                <p><?= $activities['description'] ?></p>
                            </li>

                            <div class="button_detail_voyage">
                                <!--Permet de modifier un voyage-->
                                <a href="modifier_activite.php?step_id=<?= $activities['step_id'] ?>&activity_id=<?= $activities['activity_id'] ?>">
                                    Modifier
                                </a>
                            </div>

                            <div class="button_detail_voyage" id="button_suppression" onClick="return confirm('Voulez-vous vraiment supprimer cette activité ? Cette action sera irréversible.')">
                                <a href="activite_etape.php?step_id=<?=$_GET['step_id']?>&delete_activity=<?= $activities['activity_id'] ?>">

                                    Supprimer
                                </a>
                            </div>

                        </ul>
                        <?php
                        // }
                        ?>

                    <?php
                    }
                }
                //Si il n'y a pas encore d'activités dans ce cette étape
                else {
                    ?>
                    <h2>Il n'y a aucune activité pour cette étape actuellement.</h2>
        <?php
                }
            }
        }
        ?>

                </div>
</body>

</html>