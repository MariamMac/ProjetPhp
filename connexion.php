<?php
    session_start();

    include('bd/web_voyageDB.php'); // Fichier PHP contenant la connexion à notre BDD

  // S'il y a une session alors on ne retourne plus sur cette page  
    if (isset($_SESSION['id'])){
        header('Location: carte.html');
        exit;
    }

    // Si la variable "$_Post" contient des informations alors on les traitres
    if(!empty($_POST)){
        extract($_POST);
        $valid = true;

        if (isset($_POST['connexion'])){

            $mail = htmlentities(strtolower(trim($mail)));
            $mdp = trim($mdp);

            if(empty($mail)){ // Vérification qu'il y est bien un mail de renseigné
                $valid = false;
                $er_mail = "Il faut mettre un mail";
            }

            if(empty($mdp)){ // Vérification qu'il y est bien un mot de passe de renseigné
                $valid = false;
                $er_mdp = "Il faut mettre un mot de passe";
            }

            // On fait une requête pour savoir si le couple mail / mot de passe existe bien car le mail est unique !
            $req = $DB->query("SELECT * 
                FROM users
                WHERE mail = ? AND password = ?",
                array($mail, crypt($mdp, '$6$rounds=5000$'.$macleapersonnaliseretagardersecret.'$')));
            //array($mail, crypt($mdp, "$6$rounds=5000$macleapersonnaliseretagardersecret$"
            $req = $req->fetch();

            // Si on a pas de résultat alors c'est qu'il n'y a pas d'utilisateur correspondant au couple mail / mot de passe
            if ($req['user_id']==null){
                $valid = false;
                $er_mail = "Le mail ou le mot de passe est incorrect";
            }

            // S'il y a un résultat alors on va charger la SESSION de l'utilisateur en utilisateur les variables $_SESSION
            if ($valid){

                $_SESSION['id'] = $req['user_id']; // id de l'utilisateur unique pour les requêtes futures
                $_SESSION['nom'] = $req['nom'];
                $_SESSION['prenom'] = $req['prenom'];
                $_SESSION['mail'] = $req['mail'];

                header('Location: carte.html');
                exit;
            }   
        }
    }
?>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link type="text/css" rel="stylesheet" href="connexion.css">
        <title>Connexion</title>
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

        <!--Titre du cadre de connexion-->
        <div id="registration">
            <h1>Se connecter</h1>
        
            <!--Formulaire de connexion-->
            <form method="post">

                <?php
                    if (isset($er_mail)){
                ?>
                    <div><?= $er_mail ?></div>
                <?php   
                    }
                ?>
                <p>Adresse-mail</p>
                <input type="email" placeholder="Adresse mail" name="mail" value="<?php if(isset($mail)){ echo $mail; }?>" required>

                <?php
                    if (isset($er_mdp)){
                ?>
                    <div><?= $er_mdp ?></div>
                <?php   
                    }
                ?>
                <p>Mot de passe</p>
                <input type="password" placeholder="Mot de passe" name="mdp" value="<?php if(isset($mdp)){ echo $mdp; }?>" required>

                <br><button type="submit" name="connexion" id="button_connexion">Se connecter</button></br>



            </form>
        </div>
    </body>
</html>