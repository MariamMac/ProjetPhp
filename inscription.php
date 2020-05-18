<?php
    session_start();

    include('bd/web_voyageDB.php'); // Fichier PHP contenant la connexion à notre BDD

    // S'il y a une session alors on ne retourne plus sur cette page
    if (isset($_SESSION['id'])){
        header('Location: index.php'); 
        exit;
    }

    // Si la variable "$_Post" contient des informations alors on les traitres
    if(!empty($_POST)){
        extract($_POST);
        $valid = true;

        // On se place sur le bon formulaire grâce au "name" de la balise "input"
        if (isset($_POST['inscription'])){

            $nom  = htmlentities(trim($nom)); // On récupère le nom
            $prenom = htmlentities(trim($prenom)); // on récupère le prénom
            $mail = htmlentities(strtolower(trim($mail))); // On récupère le mail
            $mdp = trim($mdp); // On récupère le mot de passe 
            $confmdp = trim($confmdp); //  On récupère la confirmation du mot de passe

            //  Vérification du nom
            if(empty($nom)){
                $valid = false;
                $er_nom = ("Le nom d' utilisateur ne peut pas être vide");
            }       

            //  Vérification du prénom
            if(empty($prenom)){
                $valid = false;
                $er_prenom = ("Le prenom d' utilisateur ne peut pas être vide");
            }       

            // Vérification du mail
            if(empty($mail)){
                $valid = false;
                $er_mail = "Le mail ne peut pas être vide";

                // On vérifit que le mail est dans le bon format
            } elseif(!preg_match("/^[a-z0-9\-_.]+@[a-z]+\.[a-z]{2,3}$/i", $mail)){
                $valid = false;
                $er_mail = "Le mail n'est pas valide";

            } else{
                // On vérifit que le mail est disponible
                $req_mail = $DB->query("SELECT mail FROM users WHERE mail = ?",
                    array($mail));

                $req_mail = $req_mail->fetch();

                if ($req_mail['mail'] <> ""){
                    $valid = false;
                    $er_mail = "Ce mail existe déjà";
                }
            }

            // Vérification du mot de passe
            if(empty($mdp)) {
                $valid = false;
                $er_mdp = "Le mot de passe ne peut pas être vide";

            }elseif($mdp != $confmdp){
                $valid = false;
                $er_mdp = "La confirmation du mot de passe ne correspond pas";
            }

            // Si toutes les conditions sont remplies alors on fait le traitement
            if($valid){

                $mdp = crypt($mdp, '$6$rounds=5000$'.$macleapersonnaliseretagardersecret.'$');

                $date_creation_compte = date('Y-m-d H:i:s');

                // On insert nos données dans la table utilisateur
                $DB->insert("INSERT INTO users (nom, prenom, mail, password, created) VALUES 
                    (?, ?, ?, ?, ?)", 
                    array($nom, $prenom, $mail, $mdp, $date_creation_compte));

                header('Location: index.php');
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
        <link type="text/css" rel="stylesheet" href="inscription.css">
        <title>Inscription</title>
    </head>

    <body> 
        <!--Police d'écriture-->
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Nunito&display=swap');
        </style>

        <!--Barre de tâches-->

        <!--Logo : bouton "home"-->
        <div id="barre">
          <a id="nom_site" href="accueil.html">
            <img id="logo" src="images/logo web2.png"/>
            <gf-specimen-header id="header"> Viamicis </gf-specimen-header>
          </a>

            <!--Bouton qui mène à la page de connexion-->
            <!--Bouton qui mène à la page de profil-->
            <p id="profil"><a href="index.php">Se connecter</a></p>
            
        </div>

         <!--Titre du cadre d'inscription-->
        <div id="forminscr">
            <h1>Inscription</h1>

        <!--Formulaire d'inscription-->
        <form method="post">
            
            <!--Nom-->
            <?php
                // S'il y a une erreur sur le nom alors on affiche
                if (isset($er_nom)){
                ?>
                    <p><?= $er_nom ?></p>
                <?php   
                }
            ?>
            <p>Nom</p>
            <input type="text" placeholder="Votre nom" name="nom" value="<?php if(isset($nom)){ echo $nom; }?>" required>   

            <!--Prenom-->
            <?php
                if (isset($er_prenom)){
                ?>
                    <p><?= $er_prenom ?></p>
                <?php   
                }
            ?>
            <p>Prénom</p>
            <input type="text" placeholder="Votre prénom" name="prenom" value="<?php if(isset($prenom)){ echo $prenom; }?>" required>   


            <!--Mail-->
            <?php
                if (isset($er_mail)){
                ?>
                    <p><?= $er_mail ?></p>
                <?php   
                }
            ?>
            <p>Mail</p>
            <input type="email" placeholder="Adresse mail" name="mail" value="<?php if(isset($mail)){ echo $mail; }?>" required>

            <!--Date de naissance-->
            <?php
                if (isset($er_birth)){
                ?>
                    <p><?= $er_birth ?></p>
                <?php   
                }
            ?>
            <p>Date de naissance</p>
            <input type="date" placeholder="Date de naissance" name="birth" value="<?php if(isset($birth)){ echo $birth; }?>" required>

            <!--Mot de passe-->
            <?php
                if (isset($er_mdp)){
                ?>
                    <p><?= $er_mdp ?></p>
                <?php   
                }
            ?>
            <p>Mot de passe</p>
            <input type="password" placeholder="Mot de passe" name="mdp" value="<?php if(isset($mdp)){ echo $mdp; }?>" required>

            <p>Confirmer le mot de passe</p>
            <input type="password" placeholder="Confirmer le mot de passe" name="confmdp" required>

                <br><button type="submit" name="inscription">S'inscrire</button></br>
            </div>
        </form>
    </body>
</html>