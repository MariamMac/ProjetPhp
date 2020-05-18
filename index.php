<?php
    session_start(); // Permet de savoir s'il y a un utilisateur (session) s'est connecté sur notre site.

    include('bd/web_voyageDB.php'); // Fichier PHP contenant la connexion à notre BDD
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <link type="text/css" rel="stylesheet" href="index.css">
        <title>Accueil</title>
    </head>

    <body>

        <!--Si on ne détecte pas de session alors on verra les liens ci-dessous-->
        <?php
            if(!isset($_SESSION['id'])){ 
        ?>

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

            <!--Bouton qui mène à la page de connexion-->
            <p id="profil"><a href="index.php">Se connecter</a></p>
  
      </div>


        <!--Espace de connexion ou sinon inscription-->
        <div id="contenu">
            <h1>Accedez au contenu en nous rejoignant !</h1>
            <br>
            <div id="bouton"><a href="connexion.php">Connexion</a></div></br>
            <br>
            <a id="inscrip" href="inscription.php">Je n'ai pas de compte, je m'inscris</a></br>
        </div>


        <!--Sinon s'il y a une session alors on verra les liens ci-dessous-->
        <?php
            }else{
        ?>


        <!--Barre de tâches avec le bouton deconnexion/profil-->

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

        <!--Cadre de connexion-->
        <div id="contenu">
            <h1>Vous avez acces au contenu !</h1>
            <br>
            <div id="bouton"><a href="carte.html">Commencer</a></div></br>
        </div>
        
        <?php
            } 
        ?>
    </body>
</html>