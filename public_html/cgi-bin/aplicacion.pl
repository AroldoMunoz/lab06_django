#!/usr/bin/perl -wT
print "Content-type: text/html\n\n";
print <<EndOfHTML;
<!DOCTYPE html>
<html><head><title>Test Page</title>
<script>
document.write("hola como estas");
</script>
</head>
<body>
  <fieldset>
    <legend>Datos personales</legend>
      <form id="datos" action="validar.pl" method="post" onsubmit="return valida(this)">
         <table>                      
            <tr>
              <td>DNI/Pasaporte  *</td>
              <td><input type="text" name="dni"></td>              
            </tr> 
            <tr>
              <td>Nombres  * </td>
              <td><input type="text" name="nombre"></td>
            </tr>
            <tr>
              <td>Apelidos  * </td>
              <td><input type="text" name="apellido"></td>
            </tr>
            <tr>
              <td>Nacionalidad  * </td>
              <td><input type="text" name="nacionalidad"></td>
            </tr>
            <tr>
              <td>Correo  * </td>
              <td><input type="text" name="correo"></td>
            </tr>
            <tr>
              <td>Numero  * </td>
              <td><input type="text" name="numero"></td>
            </tr>
            <tr>
              <td><input type="submit" value="Registrar"></td>
            </tr> 
            </table>          
      </form>
    </fieldset>
</body></html>
EndOfHTML
