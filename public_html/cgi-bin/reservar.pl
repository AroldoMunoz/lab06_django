#!/usr/bin/perl -wT
use CGI qw(:standard);
use DBI;
my $dni = param('dni');
my $destino = param('destino');
my $fecha = param('fecha');
my $dias = param('dias');
my $personas = param('personas');
my $mensaje = param('mensaje');

print "Content-type: text/html\n\n";
print "<!DOCTYPE html>\n";
print "<html><head><title>Datos guardados</title></head>\n";
print "<body>\n";
$server='localhost';
$port=3306;
$user='pw1';
$pwd='episunsa';
$db='pw1';

$conection=DBI->connect("DBI:mysql:database=$db;host=$server;port=$port",$user,$pwd);

$query=$conection->prepare("insert into reservas(dni,destino,fecha,dias,personas,mensaje) values(?,?,?,?,?,?)"); 
$query->execute($dni,$destino,$fecha,$dias,$personas,$mensaje);

$query1=$conection->prepare("select  clientes.nombre, clientes.apellido,destinos.nombre, fecha from clientes,reservas,destinos where destinos.id =reservas.destino"); 
$query1->execute();
print "<table border=1>";
while(@res=$query1->fetchrow_array()){
    print "<tr>";
    print "<td>@res \n</td>";
    print "</tr>";
}
print "</table><h2>$fecha</h2>";
print "<p>Su reserva se ha realizado con exito <br></p>"
print "<a href='../proyecto/principal.html' target='blank'><input type=button value=Inicio></a>";
print "</body></html>";

