#!/usr/bin/perl -wT
use CGI qw(:standard);
use DBI;
my $nick = param('nick');
my $pass = param('pass');
my $edad = param('edad');
my $nombre = param('nombre');
my $telefono = param('telefono');
my $correo = param('correo');
print "Content-type: text/html\n\n";
print "<!DOCTYPE html>\n";
print "<html><head><title>Hello World</title></head>\n";
print "<body>\n";
$server='localhost';
$port=3306;
$user='pw1';
$pwd='episunsa';
$db='pw1';
$count = 0;
if(length($nick) == 0 || length($pass) == 0 || length($edad)==0  || length($correo)==0){
  print "<h2>Todos los campos son obligatorios</h2>\n";
  $count++;
}
else{
   if($nick =~ /(.[0-9])/){
      print "<h2>El campo nombre contiene caracteres incorrectos</h2>\n";
      $count++;
   }
   if($edad =~ /(.[^0-9])/){
       print  "<h2> El campo edad solo debe contener caracteres numericos </h2>        \n";
       $count++;
   } 
}
if($count==0){
  print "<h1>BIENVENIDO AL PROGRAMA</h1>";
  print "$nick.$pass.$nombre.$correo.$edad.$telefono";
  #print "<a href='leeRespuestas.pl'>Click para continuar </a>";
$conection=DBI->connect("DBI:mysql:database=$db;host=$server;port=$port",$user,$pwd);
$query=$conection->prepare("insert into usuarios(nick,password,nombre,correo,edad,telefono) values(?,?,?,?,?,?)"); 
$query->execute($nick,$pass,$nombre,$correo,$edad,$telefono);
#$query->execute("andrea","2222","andrea zea","andreahotmail.com","45","12243434");
}
print "</body></html>\n";
