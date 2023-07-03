#!/usr/bin/perl -wT
use CGI qw(:standard);
use DBI;



print "Content-type: text/html\n\n";
$server='localhost';
$port=3306;
$user='pw1';
$pwd='episunsa';
$db='pw1';

$conection=DBI->connect("DBI:mysql:database=$db;host=$server;port=$port",$user,$pwd);

$query=$conection->prepare("select *from testimonios");
$query->execute();
print <<EndOfHTML;
<!DOCTYPE html>;
<META HTTP-EQUIV="Content-Type" content="text/html; charset=utf-8"/>
<html><head><title>Comentarios de mi perfil</title></head>\n;
<link rel='stylesheet' type='text/css' href='../proyecto/estilo1.css'>;
<META HTTP-EQUIV="Content-Type" content="text/html; charset=utf-8/>
<html>
<head><title>Guia Turistica</title>
<link rel= "stylesheet" type= "text/css" href= "estilo1.css">
<style type="text/css">
  #datos{
      width: 70%;
      margin: auto;
    }
    label{
      color: black;
    font-weight: bold;
    display: inline-block;
    font-size: 90%;
    width: 180px;
    line-height: 40px;
    vertical-align: top;
    padding-top: 0;
    padding-right: 0;
    padding-bottom: 0;
    }
</style>
<script>
   function destino(){
      var section = document.getElementById('texto');
      var section2 = document.getElementById('imagenes');
      var section3 = document.getElementById('mititulo');
      section.style.display='none';
      section2.style.display='none';
      section3.style.display='none';
      var section4 = document.getElementById('destinos'); 
      var section5 = document.getElementById('mitexto');
      var section6 = document.getElementById('miimagen');
      section5.visibility='none';
      section6.visibility='none';
      section4.style.visibility=true;
   }
</script>
</head>
<body>
<div id="titulo">
  <div id="logo">
    <table >
      <tr>
        <td><img src="../proyecto/imagenes/logo.jpg" height="160" width="200"></td>
        <td><h1>Guia turistica virtual AREQUIPA</h1></td>
      </tr>
      <tr>
        <td><img src="../proyecto/imagenes/mochila.png" height = "100" width="240"></td>
      </tr>
    </table>
  </div>
  <div id = "imagenTitulo">
    <img src="../proyecto/imagenes/catedral_2.jpg" width="1023" height="272">
  </div>
  <div id = "menu">
    <ul class = "mi-menu">
      <li> <a href="../proyecto/principal.html"> Inicio </a></li>
      <li> <a href="../proyecto/nosotros.html"> Nosotros </a></li>
      <li> <a href="../proyecto/destinos.pl" target="destinos" onclick="destino()">Destinos turisticos </a>
      <ul>
          <li> <a href="../proyecto/campina.html">Campiña</a></li> 
          <li> <a href="../proyecto/tour.html">Arequipa tour</a></li>
          <li> <a href="../proyecto/rafting.html">Rafting rio Chili</a></li>
          <li> <a href="../proyecto/downhill.html">Downhill volcan Chachani</a></li>
          <li> <a href="../proyecto/descensoMisti.html">Descenso en el Misti</a></li>
          <li> <a href="../proyecto/colca.html">Colca Full Day</a></li>
          <li> <a href="../proyecto/colcaX2.html">Colca 2 dias/ 1 noches</a></li>
          <li> <a href="../proyecto/colcaX3.html">Colca 3 dias/ 2 noches</a></li>
      </ul>
      </li>
      <li> <a href="../proyecto/galeria.html"> Galeria de imagenes </a></li>
      <li> <a href="../proyecto/formReservas.html" target="self"> Reservas </a></li>
      <li> <a href="../proyecto/testimonios.html">Testimonios </a></li>
      <li> <a href="../proyecto/contactenos.html">Contactenos </a></li>
    </ul>
  </div>
</div>
<table border="1">
EndOfHTML


while(@res=$query->fetchrow_array()){
  print "$res[1]";
    
  #  print "<div>";
   # print "<label> DNI / Pasaporte </label>";
  #  print "<input type=text name=dni value='$res[0]' readonly><br>";
  #  print "<label> Fecha </label>";
  #  print "<input type=text name=fecha value='$res[1]' readonly><br>";
  #  print "<textarea readonly  name='comentarios' cols = '50'>";
  #  print "$res[2]</textarea>";
  #  print "</div>";
}

print "<table>";
print <<EndOfHTML;
<div id = "cuerpo">
<div id="datos">
<form id = "frmcoment" action="grabarTestimonios" method="post">
<br><br><br>
<fieldset>
<legend>Comentarios</legend>
<label> DNI / Pasaporte </label>
<input type="text" name="dni" ><br>
<label>Fecha de viaje</label>
<input type="date" name="fecha"> <br>
<label> Comentario </label> 
<textarea rows="5" cols="50" name="mensaje"></textarea></br>
<input type="submit" value="Agregar" align="left">
</fieldset>
</form>
</div>
EndOfHTML

print <<EndOfHTML; 
</div>
<div id="panel">
  <div id="menuRight">
    <ul>
      <li> <a href="../proyecto/historia.html">Historia de AREQUIPA </a></li>
      <li> <a href="../proyecto/gastronomia.html">Gastronomia Arequipeña </a></li>
      <li> <a href="../proyecto/calendario.html">Calendario turistico</a></li>
      <li> <a href="../proyecto/hoteles.html">Hoteles</a></li> 
      <li> <a href="../proyecto/restaurantes.html">8 Restaurantes para comer</a></li>
    </ul>
  </div>
  <div id="imagenPanel">
    <a href="mapas.html">
      <img src="../proyecto/imagenes/mapa.jpg" alt ="Mapa" width="295" height="295"></a>
    <div id= "descripcion">Mapa de la ciudad de Arequipa</div>
  </div>
  <div id="imagenPanel">
    <a href="../proyecto/campina.html">
      <img src="../proyecto/imagenes/campina_1.jpg" alt="Campina" width="295" height="200"></a>
    <div id = "../proyecto/descripcion"> Vista a la Campiña de Arequipa</div>
  </div>
  <div id="imagenPanel">
    <a href="../proyecto/rafting.html">
      <img src="../proyecto/imagenes/rafting_1.jpg" alt = "Rafting" width="295" height = "200"></a>
    <div id = "../proyecto/descripcion"> Rafting en el Rio Chili</div> 
  </div>
  <div id= "imagenPanel">
    <a href="../proyecto/downhill.html">
      <img src= "../proyecto/imagenes/downhill_1.jpg" alt = "Rafting" width="295" height="200"></a>
    <div id = "descripcion"> Downhill en el Volcan Chachani </div>
  </div>
  <div id= "imagenPanel">
    <a href= "../proyecto/colca.html">
      <img src = "../proyecto/imagenes/colca_1.jpg" alt = "Colca" width="295" height= "200"></a>
    <div id = "descripcion"> Vista Panoramica Cañon del Colca </div>
  </div> 

</div>
<div id="piePagina">

  <div id="enlaces">
    <center><b>Enlaces de interes</b></center>
      <ul>
        <li><a href="http://www.colcaperu.gob.pe/" target="blank">Cañon del colca</a> </li>
        <li><a href="http://www.santacatalina.org.pe/" target="blank">Monasterio de Santa Catalina</a></li>
        <li><a href="http://www.libertador.com.pe/" target="blank">Hotel Libertador</a></li>
      </ul>
  </div>
  <div id="nosotros">
<p>  <b>Direccion <br>
Av Las Casuarionas 766 - Cercado<br>
Arequipa</b><br>
<b>Numeros de Contacto<br>
Telefono: 054 765643<br>
Movistar: 969791234<br>
 Claro:   948439111</b> <br>
 
</p>
</div>
<center><br><br><br><br><br><p>Copyrigth 2013 - Derechos Reservados</p></center>
</div>
<body>
</html
EndOfHTML
