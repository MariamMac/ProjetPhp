<?php

//Déclaration du fuseau horaire locale français
setlocale(LC_TIME, 'fr');

// Déclaration d'une nouvelle classe
class web_voyageDB {
    private $host    = 'localhost';    // nom de l'host
    private $name    = 'web_voyage';     // nom de la base de donnée
    private $user    = 'root';         // utilisateur
    private $pass    = '';         // mot de passe
    //private $pass    = '';           // Ne rien mettre si on est sous windows
    private $connexion;

    function __construct($host = null, $name = null, $user = null, $pass = null){
        if($host != null){
            $this->host = $host;           
            $this->name = $name;           
            $this->user = $user;          
            $this->pass = $pass;
        }
        try{
            $this->connexion = new PDO('mysql:host=' . $this->host . ';dbname=' . $this->name,
                $this->user, $this->pass, array(PDO::MYSQL_ATTR_INIT_COMMAND =>'SET NAMES UTF8', 
                PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING));
        }catch (PDOException $e){
            echo 'Erreur : Impossible de se connecter a la BDD !';
            die();
        }
    }

    public function query($sql, $data = array()){
        $req = $this->connexion->prepare($sql);
        $req->execute($data);

        return $req;
    }
    
    public function insert($sql, $data = array()){
        $req = $this->connexion->prepare($sql);
        $req->execute($data);
    }
}

// Faire une connexion à notre fonction
$DB = new web_voyageDB();
$macleapersonnaliseretagardersecret = 'bQeThWmYq3t6w9z$C&F)J@NcRfUjXn2r4u7x!e%D*G-KaPdSgVkYp3s6v9y/B?E(H+MbQeThWmZq4t7w!z%C&F)J@NcRfUjXn2r5u8x/A?D(G-KaPdSgVkYp3s6v9y$B&E)H@MbQeThWmZq4t7w!z%C*F-JaNdveRfUjXn2r5u8x/A?D(G+KbPeShVkYp3s6v9y$B&E)H@McQfTjWnZq4t7w!z%C*F-JaNdRgUkXp2s5u8x/A?D(G+KbPeShVmYq3t'
?>