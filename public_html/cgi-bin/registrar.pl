#!/usr/bin/perl -wT
use CGI qw(:standard);
print "Content-type: text/html\n\n";
print "<!DOCTYPE html>";
print <<EndOfHTML;
<html>
<head>
<title>Formulario de registro</title>
<link rel="stylesheet" type="text/css" href="../estilo_registro.css">
</head>
<body>
<center><h1>Registro de usuarios</h1></center>

<div id="formulario">
<form action="validarDatos.pl" method="post" enctype="multipart/form-data">
<p> Nick: <br>
<input class="campos" type="text" name ="nick"></p>
<p>Ingrese pass: <br>
<input class="campos" type="password" name="pass" value=""></p>
<p>Ingrese Nombre:<br>
<input class="campos" type="text" name="nombre"></p>
<p>Ingrese e-mail:<br>
<input class="campos" type="text" name="correo"></p>
<p>Ingrese edad: <br>
<input class="campos" type="text" name="edad"></p>
<p>Ingrese telefono: <br>
<input class="campos" type="text" name="telefono"></p>
<p>Adjuntar Archivo: <br> 
<input class="campos" type="file" name="archivo" size="20"></p>               
  <input type="hidden" name="id" value="">  
<div id="b_reset">  
<input class="boton" type="reset" value="Restablecer" name="restablecer"> 
</div>                                       
<div id="b_submit"> 
<input class="boton" type="submit" value="Registrar"></div>
</form>
</div>
EndOfHTML
print "</body></html>"

