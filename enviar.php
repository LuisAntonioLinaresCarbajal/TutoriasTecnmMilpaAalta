<?php  

// Llamando a los campos
$nombre = $_POST['nombre'];
$email = $_POST['email'];
//$telefono = $_POST['telefono'];
$menssage = $_POST['menssage'];

// Datos para el correo
$destinatario = "antoniolinarescarbajal@gmail.com";
$asunto = "Contacto desde nuestra web";

$carta = "De: $nombre \n";
$carta .= "Email: $email \n";
//$carta .= "Telefono: $telefono \n";
$carta .= "Mensaje: $message";

// Enviando Mensaje
mail($destinatario, $asunto, $carta);
header('Location:mensajeEnviado.html');



?>