<?php
	include_once 'connection.php';

	$utilisateur = new Utilisateur();

	if(isset($_POST['nomUtilisateur'], $_POST['MDP'])) {
		$nomUtilisateur = $_POST['nomUtilisateur'];
		$MDP = $_POST['MDP'];
		
		if(!empty($nomUtilisateur) && !empty($MDP)) {
			$encrypted_password = md5($MDP);
			$utilisateur->utilisateur_existe($nomUtilisateur, $MDP);
		}
		else {
			$json['erreur'] = 'Veuillez saisir vos identifiants';
			echo json_encode($json);
			mysqli_close($this->connexion);
		}
	}
		
	class Utilisateur {
		private $bdd;
		private $connexion;
		
		function __construct() {
			$this->bdd = new Connexion_BDD();
			$this->connexion = $this->bdd->getConnexion();
		}

		public function utilisateur_existe($nomUtilisateur, $MDP) {
			$requete = "SELECT prenom FROM inspecteur WHERE nomutilisateur='$nomUtilisateur' AND motdepasse='$MDP'";
			$resultat = mysqli_query($this->connexion, $requete);

			if(mysqli_num_rows($resultat) > 0) {
				$json['succes'] = 'Vous vous êtes bien connecté, bienvenue '.$nomUtilisateur;
				echo json_encode($json);
				mysqli_close($this->connexion);
			}
			else {
				$json['erreur'] = 'Les identifiants sont incorrects, veuillez réessayer';
				echo json_encode($json);
				mysqli_close($this->connexion);
			}
		}
	}
?>