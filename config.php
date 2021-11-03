<?php 
$dsn = 'mysql:dbname=migatoboris;host=localhost'; //indicamos el GDBS(Lenguaje) de la DB,el nombre de la DB y el host
$user = 'root'; //usuario de la 
$password = '';//contraseña del usuario

 
try //Excepcion de errores 
{
	$pdo = new PDO($dsn,$user,$password); //esta clase u objeto nos permite abstraer la conexion antiua y una capa de seguridad
	$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e)
{
	echo "PDO error".$e->getMessage();
	die();
}
?>