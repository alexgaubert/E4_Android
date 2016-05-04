<?php
	define('adresse', 'localhost');
	define('utilisateur', 'root');
	define('mdp', '');
	define('nom_bdd', 'bd_ppe4_gaubertetco');

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