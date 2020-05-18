<?php
session_start();

include('bd/web_voyageDB.php');

// S'il n'y a pas de session alors on ne va pas sur cette page
if (!isset($_SESSION['id'])) {
    header('Location: index.php');
    exit;
}

// Si la variable "$_Post" contient des informations alors on les traitres
if (!empty($_POST)) {
    extract($_POST);
    $valid = false;

    if (isset($_POST['delete'])) {

        $mail = htmlentities(strtolower(trim($mail)));
        $mdp = trim($mdp);

        if (empty($mail)) { // Vérification qu'il y est bien un mail de renseigné
            $valid = false;
            $er_mail = "Il faut mettre un mail";
        }

        if (empty($mdp)) { // Vérification qu'il y est bien un mot de passe de renseigné
            $valid = false;
            $er_mdp = "Il faut mettre un mot de passe";
        }

        // On fait une requête pour savoir si le couple mail / mot de passe existe bien car le mail est unique !
        $req = $DB->query(
            "SELECT * 
            FROM users
            WHERE mail = ? AND password = ?",
            array($mail, crypt($mdp, '$6$rounds=5000$' . $macleapersonnaliseretagardersecret . '$'))
        );
        
        $req = $req->fetch();

        // Si on a pas de résultat alors c'est qu'il n'y a pas d'utilisateur correspondant au couple mail / mot de passe
        if ($req == false) {
            $valid = false;
            $er_mail = "Le mail ou le mot de passe est incorrect";
        } else {
            $valid = true;
        }

        // S'il y a un résultat alors on supprime tout
        if ($valid) {

            // On supprime le compte !
            $req = $DB->query(
                "DELETE 
                FROM users
                WHERE mail = ? AND password = ?",
                array($mail, crypt($mdp, '$6$rounds=5000$' . $macleapersonnaliseretagardersecret . '$'))
            );
            
            $req = $req->fetch();

            //destroy session
            session_destroy();

            header('Location: index.php');
            exit;
        }
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

    <!--Logo : bouton "home"-->
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

    <div id="info">
        <h2>RGPD</h2>
        <form method="post">
            <p>Adresse-mail</p>
            <input type="email" placeholder="Adresse mail" name="mail" value="<?php if (isset($mail)) {
                                                                                    echo $mail;
                                                                                } ?>" required>
            <?php
            if (isset($er_mail)) {
            ?>
                <p style="color: red"><?= $er_mail ?></p>
            <?php
            }
            ?>
            <?php
            if (isset($er_mdp)) {
            ?>
                <p style="color: red"><?= $er_mdp ?></p>
            <?php
            }
            ?>
            <p>Entrer votre mot de passe pour confirmer la suppression</p>
            <input type="password" placeholder="Mot de passe" name="mdp" value="<?php if (isset($mdp)) {
                                                                                    echo $mdp;
                                                                                } ?>" required>

            <br />
            <button type="submit" name="delete" onClick="return confirm('Voulez vou vraiment supprimer le compte, l\'action est irreversible?')">
                Supprimer mon compte
            </button>

        </form>
    </div>


</body>

</html>