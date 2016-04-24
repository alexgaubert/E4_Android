<?php
	require_once 'config.php';
	
	class Connexion_BDD {
		private $connexion;

		function __construct() {
			$this->connexion = mysqli_connect(adresse, utilisateur, mdp, nom_bdd) or die("Impossible de se connecter à la base de données");
		}
		
		public function getConnexion() {
			return $this->connexion;
		}
	}
?>