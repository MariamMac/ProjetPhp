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


if (!empty($_POST)) {
    extract($_POST);
    $valid = true;

    if (isset($_POST['modification'])) {

        $nom = htmlentities(trim($nom));
        $prenom = htmlentities(trim($prenom));
        $mail = htmlentities(strtolower(trim($mail)));

        if (empty($nom)) {
            $valid = false;
            $er_nom = "Il faut mettre un nom";
        }

        if (empty($prenom)) {
            $valid = false;
            $er_prenom = "Il faut mettre un prénom";
        }

        if (empty($mail)) {
            $valid = false;
            $er_mail = "Il faut mettre un mail";
        } elseif (!preg_match("/^[a-z0-9\-_.]+@[a-z]+\.[a-z]{2,3}$/i", $mail)) {
            $valid = false;
            $er_mail = "Le mail n'est pas valide";
        } else {
            $req_mail = $DB->query(
                "SELECT mail 
                    FROM users
                    WHERE mail = ?",
                array($mail)
            );

            $req_mail = $req_mail->fetch();

            if ($req_mail['mail'] <> "" && $_SESSION['mail'] != $req_mail['mail']) {
                $valid = false;
                $er_mail = "Ce mail existe déjà";
            }
        }

        if ($valid) {

            $DB->insert(
                "UPDATE users SET prenom = ?, nom = ?, mail = ? 
                    WHERE user_id = ?",
                array($prenom, $nom, $mail, $_SESSION['id'])
            );

            $_SESSION['nom'] = $nom;
            $_SESSION['prenom'] = $prenom;
            $_SESSION['mail'] = $mail;

            header('Location:  profil.php');
            exit;
        }
    }
}

// Si la variable "$_GET" contient des informations alors on les traitres
if (!empty($_GET)) {
    extract($_GET);

    if (isset($_GET['delete_trip'])) {

        $step_id = $_GET['delete_trip'];

        // On supprime l'activité !
        $req = $DB->query(
            "DELETE 
                FROM trips
                WHERE trip_id = ?",
            array($step_id)
        );

        header('Location: profil.php');
    }
}

?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="stylesheet" href="profil.css">
    <title>Mon profil</title>
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


    <!--Affichage et modification du profil de l'utilisateur-->
    <div id="info">
        <h1>Voici le profil de <?= $afficher_profil['nom'] . " " .  $afficher_profil['prenom']; ?></h1>

        <h2>Quelques informations sur vous : </h2>
        <ul>
            <li>Votre mail : <?= $afficher_profil['mail'] ?></li>
            <?php
            $date_creation_compte = strftime('%d %B %Y', strtotime($afficher_profil['created']));
            ?>
            <br>
            <li>Votre compte a été crée le : <?= $date_creation_compte ?></li>
        </ul>

        <br>

        <h2>Suppression du compte</h2>
        <div id="button_suppression" onClick="return confirm('Voulez-vous vraiment supprimer votre compte ? Cette action sera irréversible.')">
            <a href="rgpd.php">
                Je veux supprimer mon compte
            </a>
        </div>
        
        <div id="modform">
            <h2>Modifier votre profil ?</h2>
            <form method="POST">
                <?php
                if (isset($er_nom)) {
                ?>
                    <div><?= $er_nom ?></div>
                <?php
                }
                ?>
                <p>Votre nom</p>
                <input type="text" placeholder="Votre nom" name="nom" value="<?php if (isset($nom)) {
                                                                                    echo $nom;
                                                                                } else {
                                                                                    echo $afficher_profil['nom'];
                                                                                } ?>" required>

                <?php
                if (isset($er_prenom)) {
                ?>
                    <div><?= $er_prenom ?></div>
                <?php
                }
                ?>

                <br>
                <p>Votre prénom</p>
                <input type="text" placeholder="Votre prénom" name="prenom" value="<?php if (isset($prenom)) {
                                                                                        echo $prenom;
                                                                                    } else {
                                                                                        echo $afficher_profil['prenom'];
                                                                                    } ?>" required>

                <?php
                if (isset($er_mail)) {
                ?>
                    <div><?= $er_mail ?></div>
                <?php
                }
                ?>
                <br>
                <p>Votre E-Mail</p>
                <input type="email" placeholder="Adresse mail" name="mail" value="<?php if (isset($mail)) {
                                                                                        echo $mail;
                                                                                    } else {
                                                                                        echo $afficher_profil['mail'];
                                                                                    } ?>" required>

                <br>
                <button type="submit" name="modification">Modifier</button>

            </form>
        </div>

        
    </div>


    <!--Affichage de tous les voyages crées par l'utilisateur connecté-->
    <div id="voyage">

        <?php
        $voyages = $DB->query("SELECT * FROM trips WHERE creator_id = ?", array($_SESSION['id']));

        if ($voyages->rowCount() > 0) {
        ?>
            <h1>Voici tous vos voyages :</h1>
            <?php
            foreach ($voyages as $voyages) {
                //Récupération pour chaque voyage de sa date de début et de fin                 
                $str_date_debut = strftime('%d %B %Y', strtotime($voyages['date_beginning']));
                $str_date_fin = strftime('%d %B %Y', strtotime($voyages['date_end']));
            ?>
                <ul class="result_recherche">
                    <li id="lieu"><?= $voyages['trip_name'] ?></li>
                    <hr>
                    <?php
                    //Affichage de la destination si elle est renseignée
                    if (!empty($voyages['location'])) {
                    ?>
                        <li id="ville"> Ville : <?= $voyages['location'] ?> </li>
                    <?php
                    } else {
                    ?>
                        <li id="ville"> Ville non renseignée</li>
                    <?php
                    }

                    //Affichage de la date de début du voyage si elle est renseignée
                    if (!empty($str_date_debut)) {
                    ?>
                        <li id="continent"> Date de début : <?= $str_date_debut ?> </li>
                    <?php
                    } else {
                    ?>
                        <li id="continent"> Date de début non renseignée </li>
                    <?php
                    }

                    //Affichage de la date de fin du voyage si elle est renseignée
                    if (!empty($str_date_fin)) {
                    ?>
                        <li id="continent"> Date de fin : <?= $str_date_fin ?> </li>
                    <?php
                    } else {
                    ?>
                        <li id="continent"> Date de fin non renseignée </li>
                    <?php
                    }
                    ?>

                    <div class="encart_button_destination">
                        <div class="button_detail_voyage">
                            <!--Permet de voir les détails du voyage, les différentes étapes, les moyens de transports, inviter des amis, ajouter/supprimer des destinations ou des transports ou des activités-->
                            <a href="details_voyage.php?trip_id=<?= $voyages['trip_id'] ?>">
                                Accéder à ce voyage
                            </a>
                        </div>
                        <br>
                        <div class="button_detail_voyage">
                            <!--Permet de modifier un voyage-->
                            <a href="modifier_voyage.php?trip_id=<?= $voyages['trip_id'] ?>">
                                Modifier ce voyage
                            </a>
                        </div>
                        <br>
                        <div class="button_detail_voyage" id="button_suppression" onClick="return confirm('Voulez-vous vraiment supprimer votre voyage ? Cette action sera irréversible.')">
                            <!--Permet de supprimer un voyage-->
                            <a href="profil.php?delete_trip=<?= $voyages['trip_id']?>">
                                Supprimer ce voyage
                            </a>
                        </div>
                    </div>
                </ul>
            <?php
            }
        } else {
            ?>
            <h1>Vos futurs voyages apparaitront ici.</h1>
        <?php
        }
        ?>

        <!--Bouton pour créer un nouveau voyage-->
        <div class="button_nouveau_voyage">
            <a href="nouveau_voyage.php">
                Nouveau voyage
            </a>
        </div>
    </div>
</body>

</html>