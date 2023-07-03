#!/usr/bin/perl -wT
use CGI qw(:standard);
use DBI;
my $dni = param("dni");
my $nombre = param("nombre");
my $apellido = param("apellido");
my $nacionalidad = param("nacionalidad");
my $correo = param("correo");
my $numero = param("numero");
my $sexo = param("sexo");

print "Content-type: text/html\n\n";
print "<!DOCTYPE html>\n";
print "<html><head><title>Consulta database</title></head>";
print "<body>";
$server='localhost';
$port=3306;
$user='pw1';
$pwd='episunsa';
$db='pw1';

$conection=DBI->connect("DBI:mysql:database=$db;host=$server;port=$port",$user,$pwd);


$query=$conection->prepare("insert into clientes(dni,nombre,apellido,nacionalidad,correo,numero,sexo) values(?,?,?,?,?,?,?)"); 
$query->execute($dni,$nombre,$apellido,$nacionalidad,$correo,$numero,$sexo);

print "<p>El registro se ha realizado con exito</p>";
print "<a href='../proyecto/principal.html'><input type=button value=Actualizar></a>";
