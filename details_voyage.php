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

    if (isset($_GET['delete_step']) && isset($_GET['trip_id'])) {

        $step_id = $_GET['delete_step'];

        // On supprime l'activité !
        $req = $DB->query(
            "DELETE 
                FROM steps
                WHERE step_id = ?",
            array($step_id)
        );

        header('Location: details_voyage.php?trip_id='. $_GET['trip_id']);
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

    <!--Detail de la destination-->
    <?php
    //Vérification de l'id du voyage voulu
    if (isset($_GET['trip_id']) and !empty($_GET['trip_id'])) {
        $voyage = (array) (int) $_GET['trip_id'];
        $_SESSION['trip_id'] = (int) $_GET['trip_id'];

        //Récupération des informations sur le voyage dans la bdd
        $information = $DB->query('SELECT * FROM trips WHERE trip_id LIKE ?', $voyage);
        //Récupération de toutes les étapes du voyage
        $etape = $DB->query('SELECT * FROM steps WHERE trip_id LIKE ?', $voyage);
        //Récupération de toutes les activités prévues pour ce voyage
        //A FAIRE
        //Récupération des transports prévu pour cette étape
        //A FAIRE

        //Si il y a des résultats
        if ($information->rowCount() > 0) {
            foreach ($information as $information) {
    ?>
                <div id="encart_details_voyage">
                    <h1>Voyage : "<?= $information['trip_name'] ?>" </h1>
                    <?php
                    //VERIFICATION DE LA LOCATION
                    if ($information['location'] == NULL) {
                    ?>
                        <h2>Destionation finale non renseignée</h2>
                    <?php
                    } else {
                    ?>
                        <h2>Destionation finale : <?= $information['location'] ?></h2>
                    <?php
                    }

                    ?>
                    <?php
                    //Récupération pour chaque voyage de sa date de début et de fin                 
                    $str_date_debut = strftime('%d %B %Y', strtotime($information['date_beginning']));

                    //VERIFICATION DE LA DATE DE DEPART
                    if ($information['date_beginning'] == NULL) {
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
                    $str_date_fin = strftime('%d %B %Y', strtotime($information['date_end']));
                    //VERIFICATION DE LA DATE D'ARRIVEE
                    if ($information['date_end'] == NULL) {
                    ?>
                        <h3>Date d'arrivée non renseignée</h3>
                    <?php
                    } else {
                    ?>
                        <h3>Date d'arrivée : <?= $str_date_fin ?></h3>
                    <?php
                    }

                    ?>
                    <div class="button_detail_voyage">
                        <!--Permet de modifier un voyage-->
                        <a href="modifier_voyage.php?trip_id=<?= $information['trip_id'] ?>">
                            Modifier mon voyage
                        </a>
                    </div>
                    <br>
                <?php
            }

            if ($etape->rowCount() > 0) {
                ?>

                    <h2>Voici toutes les étapes de votre voyage :</h2>
                    <?php
                    foreach ($etape as $etape) {
                        //Récupération de la destination de chaque étape
                        $id_destination = (array) (int) $etape['accomodation_id'];
                        $destination = $DB->query('SELECT * FROM accomodations WHERE accomodations.accomodation_id LIKE ?', $id_destination);
                        foreach ($destination as $destination) {
                            //Récupération pour chaque voyage de sa date de début et de fin                 
                            $str_date_debut = strftime('%d %B %Y', strtotime($etape['date_beginning']));
                            $str_date_fin = strftime('%d %B %Y', strtotime($etape['date_end']));
                    ?>
                            <ul class="result_recherche">
                                <li id="lieu"><?= $etape['step_name'] ?></li>
                                <hr>
                                <li id="continent">Date de début : <?= $str_date_debut ?></li>
                                <li id="continent">Date de fin : <?= $str_date_fin ?></li>
                                <br>
                                <li id="ville">
                                    <a href="details.php?id=<?= $destination['accomodation_id'] ?>&iduser=<?= $_SESSION['id'] ?>">
                                        Destination : <?= $destination['accomodation_name'] ?>
                                    </a>
                                </li>

                                <br>

                                <!--Voir une liste avec les noms des activités-->
                                <?php
                                $etape_id = (array) (int) $etape['step_id'];
                                //Récupération de toutes les activités pour cette étape
                                $activities = $DB->query('SELECT * FROM activities WHERE activities.step_id LIKE ?', $etape_id);
                                //Si il y a des résultats
                                if ($activities->rowCount() > 0) {
                                ?>
                                    <p class="list_activities">Voici les activités prévues à cette étape :</p>
                                    <ul class="list_activities">
                                        <?php
                                        foreach ($activities as $activities) {
                                        ?>
                                            <li><?= $activities['activity_name'] ?></li>
                                        <?php
                                        }
                                        ?>
                                    </ul>
                                <?php
                                }
                                //Sinon
                                else {
                                ?>
                                    <p class="list_activities">Il n'y a aucune activité de prévue à cette étape.</p>
                                <?php
                                }

                                ?>

                                <br>

                                <!--Permet de voir des détails sur les activités-->
                                <div class="button_detail_voyage">
                                    <a href="activite_etape.php?step_id=<?= $etape['step_id'] ?>">
                                        Détails des activités
                                    </a>
                                </div>

                                <div class="button_detail_voyage" id="button_suppression" onClick="return confirm('Voulez-vous vraiment supprimer cette étape ? Cette action sera irréversible.')">
                                    <a href="details_voyage.php?trip_id=<?= $_GET['trip_id'] ?>&delete_step=<?= $etape['step_id'] ?>">

                                        Supprimer cette étape
                                    </a>
                                </div>

                            </ul>
                        <?php
                        }
                        ?>

                    <?php
                    }
                }
                //Si il n'y a pas encore d'étapes dans ce voyage
                else {
                    ?>
                    <h2>Il n'y a aucune étape pour ce voyage actuellement.</h2>
                    <h3>Ajoutez-en maintenant : </h3>
                    <div class="button_detail_voyage">
                        <a href="carte.html">
                            Voir la carte
                        </a>
                    </div>
                    <div class="button_detail_voyage">
                        <a href="recherche.php">
                            Rechercher une destination
                        </a>
                    </div>
        <?php
                }
            }
        }
        ?>
        <!--Possibilité d'ajouter une étape en saisie libre-->
        <div class="button_detail_voyage">
            <a href="ajout_etape_libre.php?idtrip=<?= $_SESSION['trip_id'] ?>">
                Ajouter une étape
            </a>
        </div>
                </div>
</body>

</html>