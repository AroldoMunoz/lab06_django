#!/usr/bin/perl -wT
use CGI qw(:standard);
use DBI;

my $dni=param('dni');
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

$query=$conection->prepare("select *from clientes where dni='$dni'"); 
$query->execute();



@res=$query->fetchrow_array();

if($query->rows == 0){
	print "El usuario no puede hacer reservas, no esta registrado";
	print "<center><a href='../proyecto/formRegistro.html'><input type='button' value='Registrar'></center>";
}else{

print "<label> DNI / Pasaporte *</label>";
print "<input type=text name=dni value='$res[0]'><br>";
print "<label> Nombre *</label>";
print "<input type=text name=nombre value='$res[1]'><br>";
print "<label> Apellido *</label>";
print "<input type=text name=apellido value=$res[2]><br>";
print "<label> Nacionalidad *</label>"; 
print "<input type=text name=nacionalidad value='$res[3]'><br>";

}