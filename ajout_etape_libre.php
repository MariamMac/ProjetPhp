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


    //Pour l'ajout de la destination
    if (isset($_GET['nom_destination'], $_GET['ville_destination'], $_GET['pays_destination']) 
        AND !empty($_GET['nom_destination']) 
        AND !empty($_GET['ville_destination'])
        AND !empty($_GET['pays_destination'])) {

        //Récupération des infos
        $nom_d = $_GET['nom_destination'];
        $ville_d = $_GET['ville_destination'];
        $pays_d = $_GET['pays_destination'];
        $description = $_GET['description_destination'];
        $type = $_GET['type_lieu_destination'];
        $prix = $_GET['prix_destination'];
        $value_saisie_user = (boolean) true;

        //Insertion dans la bdd
        $DB ->insert("INSERT INTO accomodations (accomodation_name,location,pays,description,type,price,saisie_user)
            VALUES (?,?,?,?,?,?,?)",
            array($nom_d,$ville_d,$pays_d,$description,$type,$prix,$value_saisie_user)
            );

        $confirmation_destination = "Votre destination a bien été crée !"; 

        //Récupération de l'id de la destination crée
        $info_destination = $DB->query('SELECT * FROM accomodations WHERE accomodation_name=?', array($nom_d));
        foreach ($info_destination as $info_destination) {
            $destination_id = $info_destination['accomodation_id'];
        }


        //Pour l'ajout de l'étape au voyage
        if (isset($_GET['nom_etape'], $_GET['date_d'], $_GET['date_f']) AND !empty($_GET['nom_etape']) AND !empty($_GET['date_d']) AND !empty($_GET['date_f'])){
            
            //Récupération des informations
            $nom_e = $_GET['nom_etape'];
            $date_d_e = $_GET['date_d'];
            $date_f_e = $_GET['date_f'];
            
            //Ajout à la BDD
            $DB->insert("INSERT INTO steps (step_name, trip_id, date_beginning, date_end, accomodation_id) VALUES (?, ?, ?, ?, ?)", 
                array($nom_e, $_SESSION['trip_id'], $date_d_e, $date_f_e, $destination_id));
            
            //Récupération de l'id de l'étape crée
            $info_etape = $DB->query('SELECT * FROM steps WHERE step_name=?', array($nom_e));
            foreach ($info_etape as $info_etape) {
                $step_id = $info_etape['step_id'];
            }

            //Affichage message
            $confirmation = "Votre voyage a bien été mis à jour !"; 
        } 
    }
    //Si on arrive sur la page et qu'on a rien saisi : récupération des infos passés en paramètres
    else {
        $_SESSION['trip_id'] = (int) $_GET['idtrip'];
    }

?>

<!----------------------------------------------------------------------------------------------------->

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

        <?php
        if (empty($confirmation) AND empty($confirmation_destination)) {
            ?>

            <div id="encart_choix_etape">
                <h1>Création d'une étape</h1>

                <h2>Je veux choisir une destination déjà existante :</h2>

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

            <br>
            <hr>
            <br>
            <!--Formulaire pour laisser le choix à l'utilisateur d'ajouter une activité existante ou une nouvelle activité-->
            <h2>Je veux créer ma propre étape :</h2>
            <h3>Quelques informations sur le lieu :</h3>
            <form method="GET">
                <p class="p_choix_etape"> Nom de la destination :</p>
                <input class="input_choix_etape" name="nom_destination" type="text" placeholder="Destination" required>
                
                <p class="p_choix_etape"> Lieu de la destination :</p>
                <input class="input_choix_etape" name="ville_destination" type="text" placeholder="Ville" required>

                <p class="p_choix_etape"> Pays où se trouve la destination :</p>
                <input class="input_choix_etape" name="pays_destination" type="text" placeholder="Pays" required>
                
                <p class="p_choix_etape"> Description ou informations sur le lieu :</p>
                <input class="input_choix_etape" name="description_destination" type="text" placeholder="Description du lieu">
                
                <p class="p_choix_etape"> Type de lieu :</p>
                <input class="input_choix_etape" name="type_lieu_destination" type="text" placeholder="Hotel, Camping, ...">
                
                <p class="p_choix_etape"> Prix d'une nuit :</p>
                <input class="input_choix_etape" name="prix_destination" type="number" placeholder="prix de l'activité">
                
                <br>
                <h3>Maintenant les informations concernant l'étape :</h3>

                <p class="p_choix_etape">Nom de l'étape : </p>
                <input class="input_choix_etape" name="nom_etape" type="text" placeholder="description du lieu" required>
                
                <p class="p_choix_etape">Date de début : </p>
                <input class="input_choix_etape" name="date_d" type="date" required>
                
                <p class="p_choix_etape">Date de fin :</p>
                <input class="input_choix_etape" name="date_f" type="date" required>
               
                <br>
                <button type="submit" name="ajout" class="button_ajouter_voyage" id="button_crea_voyage">Créer cette étape</button>

            </form>


        <?php
    } else {
        ?>
        <div class="encart_confirmation">
            <h1 id="confirmation"><?= $confirmation_destination ?></h1>
            <h1 id="confirmation"><?= $confirmation ?></h1>
            <!--Boutons pour rediriger vers l'accueil ou l'activite-->
            <div>
                <a href="carte.html">
                    Retourner voir la carte
                </a>
            </div>

            <div>
                <a href="activite_etape.php?step_id=<?=$step_id?>">
                    Voir mon étape
                </a>
            </div>
        </div>
<?php
    }
?>


    </body>
</html>