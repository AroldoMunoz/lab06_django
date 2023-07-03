#!/usr/bin/perl -wT
use CGI qw(:standard);
use DBI;
my $dni = param('dni');
my $fecha = param('fecha');
my $comentario = param('comentario');


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

$query=$conection->prepare("insert into testimonios values(?,?,?)"); 
$query->execute($dni,,$fecha,$comentario);
	
print "<p>Su comentario ha sido agregado</p> ";

print "<a href='../proyecto/principal.html'><input type='button' value='Actualizar'></a>";
print "</form>";


print "</body></html>\n";