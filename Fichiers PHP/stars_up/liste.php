<?php
	include 'config.php';

	$liste = new Liste();

	if(isset($_POST['idUtilisateur'])) { // Si l'id de l'utilisateur récupéré n'est pas nul
		$idUtilisateur = $_POST['idUtilisateur'];
		$liste->liste_visites($idUtilisateur);
	}

	class Liste {
		private $bdd;
		private $connexion;
		
		function __construct() {
			$this->bdd = new Connexion_BDD();
			$this->connexion = $this->bdd->getConnexion();
		}

		public function liste_visites($idUtilisateur) {
			$requete = "SELECT test1, test2 FROM visite WHERE id_inspecteur='$idUtilisateur'";
			$resultat = mysqli_query($this->connexion, $requete);
			$donnee = mysqli_fetch_assoc($resultat);

			$json['test1'] = $donnee['test1'];
			$json['test2'] = $donnee['test2'];

			echo json_encode($json);
			mysqli_close($this->connexion);
		}
	}
?>