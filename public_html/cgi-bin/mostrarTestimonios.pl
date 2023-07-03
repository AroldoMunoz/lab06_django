#!/usr/bin/perl -wT
use CGI qw(:standard);
use DBI;

print "Content-type: text/html\n\n";
print "<!DOCTYPE html>\n";
print "<html><head><title>Comentarios de mi perfil</title></head>\n";
print "<link rel='stylesheet' type='text/css' href='../estiloMuro.css'>";
print <<EndOfHTML;
<style type="text/css">
    .comentario{
      width: 30%;
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
EndOfHTML
print "<body>\n";
$server='localhost';
$port=3306;
$user='pw1';
$pwd='episunsa';
$db='pw1';

$conection=DBI->connect("DBI:mysql:database=$db;host=$server;port=$port",$user,$pwd);

$query=$conection->prepare("select * from testimonios");

$query->execute();

print "<form>";

while(@res=$query->fetchrow_array()){
    print "<div class=comentario>";
    print "<fieldset><legend>Comentarios</legend>";
   print "<label> DNI/passaporte</label>";
   print "<input type='text' name='dni' value ='$res[0]' readonly><br>";
   print "<label> Fecha</label>";
   print "<input type=text name=fecha value='$res[1]' readonly><br>";
   print "<textarea readonly  name='comentarios' cols = '50'>";
    print "$res[2]</textarea></fieldset></div>";
}
print "</form>";
#print "</div>";
print <<EndOfHTML;
<div class=comentario>
<form action="grabarTestimonios.pl" method="post">
<fieldset><legend>Comentarios</legend>
<label> DNI/passaporte</label>
<input type='text' name=dni ><br>
<label> Fecha</label>
<input type=date name=fecha ><br>
<textarea readonly  name=comentarios cols = '50'>
</textarea><br>
<input type="submit" value="Agregar" align="left">
</fieldset>
</form>

</div>
EndOfHTML



print "</body></html>\n";
