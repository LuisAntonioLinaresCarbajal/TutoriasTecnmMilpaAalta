<?php
session_start();
require_once('config.php');

if (isset($_POST['submit'])) {
    if (isset($_POST['nombre'], $_POST['apellido'], $_POST['email'], $_POST['password']) && !empty($_POST['nombre']) && !empty($_POST['apellido']) && !empty($_POST['email']) && !empty($_POST['password'])) {
        $firstName = trim($_POST['nombre']);
        $lastName = trim($_POST['apellido']);
        $email = trim($_POST['email']);
        $password = trim($_POST['password']);
        //$hashPassword = $password;
        $options = array("cost" => 4);
        $hashPassword = password_hash($password, PASSWORD_BCRYPT, $options); //encripta contraseñas SSH
        $date = date('Y-m-d H:i:s'); //fecha del dia que almacenara en la DB cuando incerte un user

        if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $sql = 'select * from usuarios where email = :email';
            $stmt = $pdo->prepare($sql);
            $p = ['email' => $email];
            $stmt->execute($p); //mostrar los datos de la base de datos con la que nos hayamois conectado

            if ($stmt->rowCount() == 0) {
                $sql = "insert into usuarios (nombre, apellido, email, `password`, created_at,updated_at) values(:vnombre,:vapellido,:email,:pass,:created_at,:updated_at)";

                try {
                    $handle = $pdo->prepare($sql);
                    $params = [
                        ':vnombre' => $firstName,
                        ':vapellido' => $lastName,
                        ':email' => $email,
                        ':pass' => $hashPassword,
                        ':created_at' => $date,
                        ':updated_at' => $date
                    ];

                    $handle->execute($params);

                    $success = 'Usuario creado correctamente!!';
                } catch (PDOException $e) {
                    $errors[] = $e->getMessage();
                }
            } else {
                $valFirstName = $firstName;
                $valLastName = $lastName;
                $valEmail = '';
                $valPassword = $password;

                $errors[] = 'el Email ya esta registrado';
            }
        } else {
            $errors[] = "el Email no es valido";
        }
    } else {
        if (!isset($_POST['nombre']) || empty($_POST['nombre'])) {
            $errors[] = 'el nombre es requerido';
        } else {
            $valFirstName = $_POST['apellido'];
        }
        if (!isset($_POST['apellido']) || empty($_POST['apellido'])) {
            $errors[] = 'el apellido es requerido';
        } else {
            $valLastName = $_POST['apellido'];
        }

        if (!isset($_POST['email']) || empty($_POST['email'])) {
            $errors[] = 'Email es requerido';
        } else {
            $valEmail = $_POST['email'];
        }

        if (!isset($_POST['password']) || empty($_POST['password'])) {
            $errors[] = 'el Password es requerido';
        } else {
            $valPassword = $_POST['password'];
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Register - SB Admin</title>
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>

<body class="bg-primary">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-7">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header">
                                    <h3 class="text-center font-weight-light my-4">Registrase</h3>
                                </div>
                                <div class="card-body">
                                    <?php //control de errores
                                    if (isset($errors) && count($errors) > 0) {
                                        foreach ($errors as $error_msg) {
                                            echo '<div class="alert alert-danger">' . $error_msg . '</div>';
                                        }
                                    }

                                    if (isset($success)) {

                                        echo '<div class="alert alert-success">' . $success . '</div>';
                                    }
                                    ?>
                                    <form method="POST" action="<?php echo $_SERVER['PHP_SELF'];?>">
                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input class="form-control" name="nombre" id="inputFirstName" type="text" placeholder="Enter your first name" />
                                                    <label for="inputFirstName">Nombre</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-floating">
                                                    <input class="form-control" name="apellido" id="inputLastName" type="text" placeholder="Enter your last name" />
                                                    <label for="inputLastName">Apellidos</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <input class="form-control" name="email" id="inputEmail" type="email" placeholder="name@example.com" />
                                            <label for="inputEmail">Direccion email</label>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input class="form-control" name="password" id="inputPassword" type="password" placeholder="Create a password" />
                                                    <label for="inputPassword">Contraseña</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input class="form-control" name="repassword" id="inputPasswordConfirm" type="password" placeholder="Confirm password" />
                                                    <label for="inputPasswordConfirm">Confirmar contraseña</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mt-4 mb-0">
                                        <button type="submit" name="submit" class="btn btn-primary">Registrarse</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="card-footer text-center py-3">
                                <div class="small"><a href="login.php">¿Ya tienes una cuenta? Iniciar sesión.</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <div id="layoutAuthentication_footer">
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Your Website 2021</div>
                        <div>
                            <a href="#">Privacy Policy</a>
                            &middot;
                            <a href="#">Terms &amp; Conditions</a>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>

</html>