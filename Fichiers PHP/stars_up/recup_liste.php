<?php
session_start();
include_once 'config.php';

$myArray = array();

if(isset($_SESSION['id_inspecteur'])
{
	$id_inspec = $_SESSION['id_inspecteur'];
	$requete = "SELECT * FROM visite WHERE id_inspecteur='$id_inspec'";
	$data_visite = mysqli_query($this->connexion, $requete);
	while($row = mysqli_fetch_assoc($resultat))
				{
					$myArray['id_visite'] = $row;
					$myArray['nbetoilesplus'] = $row;
				}

	echo json_encode($myArray);

}

?>