#!/usr/bin/perl -wT
use CGI qw(:standard);
use DBI;
print "Content-type: text/html\n\n";
print <<EndOfHTML;
<!DOCTYPE html>
<html><head><title>Destinos</title>
<link rel="stylesheet" type="text/css" href="../img/estiloDestino.css">
</head>
<body>
EndOfHTML
$server='localhost';
$port=3306;
$user='pw1';
$pwd='episunsa';
$db='pw1';

$conection=DBI->connect("DBI:mysql:database=$db;host=$server;port=$port",$user,$pwd);

$query=$conection->prepare("select *from destinos");
$query->execute();
print "<span><p>";
print "Bienvenido a Arequipa, somos tu mejor opcion para que conozcas los 
lugares mas importantes que tiene la ciudad de Arequipa e inicies tu aventura 
en el Colca. Estaremos muy contentos de llevarte a conocer los diversos lugares 
y atractivos que ofrece Arequipa.</br>
Con nosotros, puedes tener una aventura visitando uno de los canones mas 
profundos del planeta como es el Canon del Colca, apreciar hermosos paisajes 
magicos o simplemente relajarse en un paseo, siempre con guías profesionales 
que te ayudaran a entender y comprender los lugares que estas visitando.
Por favor, sientete con la libertad de contactarnos en cualquier momento. 
Asi que bienvenido y disfruta que la aventura esta por comenzar!"; 
print "</p><hr></span>";
while(@res=$query->fetchrow_array()){
    print "<div class='destinos'>";
    print "<center>";
    print "<img src='../img/$res[3]'></br>";
    print "<span><p>Destino: $res[1]</br>Precio: USD $res[2]</br>Detalles: $res[4]</p></span><br>";
    print "</center></div>";
}
print "<a href='../proyecto/principal.html' target='blank'><input type=button value=Inicio></a>";
print "</body></html>";

