#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#dpkg -l | grep 'chrome'

# Este script es software libre. Puede redistribuirlo y/o
# modificar-lo bajo los términos de la Licencia Pública General
# de GNU según es publicada por la Free Software Foundation,
# bien de la versión 3 de dicha Licencia o bien (según su
# elección) de cualquier versión posterior.

# Si usted hace alguna modificación en esta aplicación, deberá
# siempre mencionar al autor original de la misma.       

# Desarrollador : Nerio Villalobos
# Nick          : Alqx Villalobos
# Github        : https://github.com/alqx
# Twitter       : http://twitter.com/AeQibrios
# Facebook      : http://fb.com/alqx.villalobos
# Telegram      : (+58) 414-8596846
# Canal Telegram: https://telegram.me/procai

# El proposito de este SCRIPT es formar parte de las "Armas de la inteligencia
# y el saber para lograr la Independencia Científico-tecnológica"
# Frase del Presidente Hugo Chávez, en la inauguración del Cenditel
# (Centro Nacional de Desarrollo en Tecnologías Libres)
# 10 de Nov de 2006                                       

#<Pro-Cai DIL01, script DIL(Despues de instalar Linux), 
#Con este script podras hacer de maneras mas sencillas tus tareas en el terminal, como actualizar instalar.. etc >

#Copyright (C) 2016 Tribu Pro-Cai<2016> <Alqx Villalobos>
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#GNU General Public License for more details.
#You should have received a copy of the GNU General Public License
#along with this program. If not, see <http://www.gnu.org/licenses/>.

#Más Información:
#http://www.creativecommonsvenezuela.org.ve/cc-licencias
#http://creativecommons.org/choose/?lang=es_ES
#http://www.gnu.org/licenses/licenses.es.html
#http://www.gnu.org/licenses/license-list.html
#http://www.gnu.org/licenses/gpl-howto.es.html
#http://www.gnu.org/help/evaluation.html
#http://www.gnu.org/licenses/gpl-3.0.html#howto

####PARA CORRER ESTE SCRIPT#####
#mover el script a carpeta personal
#Abrir terminal
#copiar y pegar en terminal    --> cd /home/$USER
#ingresa como superusuario     --> su
#ingresas    contraseña        --> *******
#copiar y pegar en terminal    --> chmod 777 scriptX.sh
#y para ejecutarlo             --> ./scriptX.sh

##CONFIGURACIONES DEL SCRIPT##


##RUTA DEL REPOSITORIO LOCAL A CREAR
repoLocal='/opt/Tribu.Pro-Cai/';

##CARPETA DEL SERVIDOR WEB
www='/var/www/html/'

#nombre del comando a crear para que se ejecute por terminal
nomEjecutable='dil'
#rutal actual
ruta=`pwd`

#ruta alternativa donde se creara la orden para que se active por terminal
rutaNueva='/usr/local/bin/'

#la variable $0 guarda el nombre del script que se esta ejecutandose ahora limpiamos la variable con la funcion para eliminar la descripcion de ejecucion 
#nombre del script ejecutandose en terminal
archivoEjecutandose=${0/.\/}
archivoEjecutandose=${0//$rutaNueva}
#echo $archivoEjecutandose


##configuraciones basicas para el sistema sin importar q SO GNU/Linus use
mkdir -p $repoLocal
chmod -R 777 $repoLocal
chmod -R 777 /var/cache/apt/archives/

##FUNCIONES PARA EL SISTEMAS



Proceso () {
comando="$1"
msj="$2"
q=$( $comando  > ${repoLocal}error 2>&1 ) | zenity --width=360 --height=111 --title "Script DIL" --progress --text="$msj" --percentage=0 --auto-close --pulsate
zenity --title "¿Ver Salida?" --text "Desea ver la salida del comando ejecutado" --question --ok-label "No" --cancel-label "Si"
VerSal=$?
if [ $VerSal = 1 ]; then zenity --width=600 --height=400 --title "SALIDA:" --text-info --filename "${repoLocal}error" $MedSal; fi
rm ${repoLocal}error
}

ProcesoX () {
comando="$1"
msj="$2"
q=$( $comando  > ${repoLocal}error 2>&1 ) | zenity --width=360 --height=111 --title "Script DIL" --progress --text="$msj" --percentage=0 --auto-close --pulsate
rm ${repoLocal}error
}


clear
function solo_root(){
[ $( id -u ) != 0 ] && zenity --error --text="¡El SCRIPT debe ser ejecutado como ROOT SI ES POR PRIMERA VEZ!\n SINO ESCRIBE (sin las comillas) \n'sudo $nomEjecutable'" && exit 1
}
solo_root
echo "
00000000000000 0000000000000  000 000000000000   000       000
00000000000000 00000000000000 000 0000000000000  000       000
     0000      000        000 000 000       000  000       000
     0000      00000000000000 000 0000000000000  000       000
     0000      0000000000000  000 00000000000000 000       000
     0000      000     000    000 000        000 000       000
     0000      000      000   000 00000000000000 0000000000000
     0000      000       000  000 0000000000000  0000000000000

                            01010
                          101111100110
        11001001101100110001100111010100                                       1111
  01001101100101010010000101000010011001111                                100111101
00101011111010111111000011101001011010011101111                      11010111100101000
100100000010010110101100111000000100010111101101010001110110101001100110110011100110101
0000010101111110111000011010010011011001110000011111111101101001011110101001110110101111
100110010100001100100100011101000010001000001101001000000001111000010011010010000110100
10110100100101100111101001101010011101110111101000101000000010101101111000111111001001
1000101000110010110011011111101011101111011110110010000011100100100001111  001  11
1001001110100011011010000011110000111010110001001000101001111000110         1    1
101110011010100101001011101110001000100000010111       1      1
011100101001100111010110011101
011001110010101000100011111111101
0011100100110111010001000100101110 1
001110100110011100010110100010110011010100110  1                     1          11
10001000000010010111100011011000000101011101001000110101110100110100111     111101
01111011111100001100000011000110111000101111000111111111001111101101001001001001100
011011110101111010110111011110011100010000101000100000011000110100110011000011000100
0111110100111000100001001111010000100001111110011110011100011001101100110101110101
0111110110101111100010010010000001110001001110001111111111010011000000001001011
1011110111100110000100010011100110011001010100101011011111010000000110001000
010100111001101010101000000101010101010100100110111100
10001010111001100110111
0000010110
110110
00

0000000000000  0000000000000  0000000000000            0000000000000 0000000000000 000
00000000000000 00000000000000 0000000000000            0000000000000 0000000000000 000
000        000 000        000 000       000            000           000       000 000
00000000000000 00000000000000 000       000  ========  000           000       000 000
0000000000000  0000000000000  000       000  ========  000           0000000000000 000
000            000     000    000       000            000           0000000000000 000
000            000      000   0000000000000            0000000000000 000       000 000
000            000       000  0000000000000            0000000000000 000       000 000"

#Nombre del archivo que contendra nuestra informacion publica junto a la licencia
LEERME=${repoLocal}LEERME.html

#condicional de si exite el archivo LEERME o no.
if [[ -f  $LEERME ]]; then
    echo "Existe Leerme"
    chmod 777 $LEERME
else
    echo "No existe Leerme y fue creado"
    touch $LEERME
echo "<!DOCTYPE html>
<html>
<head>
    <title>Tribu Pro-Cai</title>
    <meta charset=\"utf-8\">
</head>

<body>
<center>
<header>
<h5 align=\"justify\">
Desarrollador  : Nerio Villalobos<br>
Nick           : Alqx Villalobos<br>
Github         : https://github.com/alqx<br>
Twitter        : http://twitter.com/AeQibrios<br>
Facebook       : http://fb.com/alqx.villalobos<br>
Telegram       : (+58) 414-8596846<br>
Canal Telegram : https://telegram.me/procai<br>
Correo         : aeqibrios@gmail.com<br>
</h5>

<h5 align=\"justify\">
Organizacion   : Tribu Pro-Cai (Programador Caimán)<br>
Nick           : Joropo Cai<br>
Twitter        : https://twitter.com/pro_cai<br>
Facebook       : https://www.facebook.com/groups/tribu.pro.cai/<br>
Correo         : tribu.pro.cai@gmail.com<br>
</h5>

<h5 align=\"justify\">
# Advertencia<br>
Cada usuario es responsable del uso y los posibles daños que pueda ocasionar
en los equipos con los que se utilice esta aplicación, este script tiene fines
educativos para formar parte de las \"Armas de la inteligencia y el saber para lograr la Independencia Científico-tecnológica\".<br>

<br>-Frase del Presidente Hugo Chávez, en la inauguración del Cenditel (Centro Nacional de Desarrollo en Tecnologías Libres)<br> 10 de Nov de 2006 
</h5>
</header>

<section>
<article style=\"text-align: justify; font-size: 12px; font-weight: bold;\">

&#60;Script DIL (Despues de instalar Linux) Alpha 0.8, Es un Script para agilizar procesos de soporte técnico para GNU/Linux(Actualización,instalación) &#62;
<br><br>
Copyright (C) 2016 Tribu Pro-Cai&#60;2016&#62; &#60;Alqx Villalobos&#62;
<br><br>
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program. If not, see &#60;http://www.gnu.org/licenses/&#62;.
</article>
</section>

<footer>
<h3>Más Información:</h3>
<article style=\"text-align: justify;\">
<a target=\"_blank\" href=\"http://www.creativecommonsvenezuela.org.ve/cc-licencias\">http://www.creativecommonsvenezuela.org.ve/cc-licencias</a><br>
<a target=\"_blank\" href=\"http://creativecommons.org/choose/?lang=es_ES\">http://creativecommons.org/choose/?lang=es_ES</a><br>
<a target=\"_blank\" href=\"http://www.gnu.org/licenses/licenses.es.html\">http://www.gnu.org/licenses/licenses.es.html</a><br>
<a target=\"_blank\" href=\"http://www.gnu.org/licenses/license-list.html\">http://www.gnu.org/licenses/license-list.html</a><br>
<a target=\"_blank\" href=\"http://www.gnu.org/licenses/gpl-howto.es.html\">http://www.gnu.org/licenses/gpl-howto.es.html</a><br>
<a target=\"_blank\" href=\"http://www.gnu.org/help/evaluation.html\">http://www.gnu.org/help/evaluation.html</a><br>
<a target=\"_blank\" href=\"http://www.gnu.org/licenses/gpl-3.0.html#howto\">http://www.gnu.org/licenses/gpl-3.0.html#howto</a><br>
</article>
</footer>
</center>
</body>
</html>">>$LEERME

    chmod 777 $LEERME
fi

##CONDICIONAL A VERIFICAR SI SE CREO EL EJECUTABLE
if [[ -f  $rutaNueva$nomEjecutable ]]; then
    echo " "
    #echo "existe pero se borro el EJECUTABLE"
    #rm $rutaNueva$nomEjecutable
else
    echo "no existe EJECUTABLE pero se CREO!"
    touch $rutaNueva$nomEjecutable
echo "#!/bin/bash
# -*- ENCODING: UTF-8 -*-
$rutaNueva$archivoEjecutandose">>$rutaNueva$nomEjecutable
    chmod 777 $rutaNueva$nomEjecutable
fi

##CONDICIONAL PARA RESPALDAR SCRIPT Y SINCRONIZARLO CON EL EJECUTABLE
if [[ -f $rutaNueva$archivoEjecutandose ]]; then
    echo " "
    #echo "existe pero se borro el SCRIPT"
    #rm $rutaNueva$archivoEjecutandose
else
    echo "no existe SCRIPT pero se CREO!"
    cp $ruta/$archivoEjecutandose $rutaNueva
    chmod 777 $rutaNueva$archivoEjecutandose
fi


zenity --title="LEERME - Licencia" --width=600 --height=400 --html --auto-scroll --timeout=300 --text-info --filename=$LEERME --checkbox="He leído y acepto los términos." 
case $? in
    0)
echo "Corriendo script"

while true;
do
    
    base=$(zenity --width=360 --height=320 --list --title "Script DIL Alpha 0.8" \
        --html \
        --text="<b>Script para despues de instalar Linux</b>" \
        --column Acciones \
        "Verificando conexion a internet" \
        "Actualizar repositorios" \
        "Instalar actualizacones" \
        "Pro-Cai" \
        "Instalar virtual box" \
        "Telegram" \
        "Instalar HTTP2 en servidor apache" \
        "Salir")

    if [ "$base" = "Verificando conexion a internet" ]; then

#accion=$(aptitude update | zenity --width=360 --height=320 --title "Script DIL" --progress --text="Actualizando repositorios" --percentage=0 --auto-close --pulsate 2>&1);
#salida=$?
comando="ping -c 3 www.google.es"
msj="Verificando internet"
q=$( $comando  > ${repoLocal}error 2>&1 ) | zenity --width=360 --height=111 --title "Script DIL" --progress --text="$msj" --percentage=0 --auto-close --pulsate
zenity --title "¿Ver Salida?" --text "Desea ver la salida del comando ejecutado" --question --ok-label "No" --cancel-label "Si"
VerSal=$?
if [ $VerSal = 1 ]; then zenity --width=600 --height=400 --title "SALIDA:" --text-info --filename "${repoLocal}error" $MedSal; fi
rm ${repoLocal}error

#if accion=$(aptitude update | zenity --width=360 --height=320 --title "Script DIL" --progress --text="Actualizando repositorios" --percentage=0 --auto-close --pulsate 2>&1);
#then
        #zenity --info --text "Se actualizo bien"
#else
        #zenity --info --text "Algo fallo"
#fi
        

        #echo "$?"
        #if [ "$?" = 1 ] ; then 
#zenity --info --text "Se actualizo bien"
        #fi
        #if [ "$?" = 0 ] ; then 
#zenity --info --text "0"
        #fi
#
        #if [ "$?" = -1 ] ; then 
            #zenity --error --text="Actualización cancelada."
        #fi
#
        #if [ "$?" = 5 ] ; then 
            #zenity --error --text="no inter"
        #fi

    elif [ "$base" = "Actualizar repositorios" ]; then

Proceso 'aptitude update' 'Actualizando repositorios'

    elif [ "$base" = "Instalar actualizaciones" ]; then

Proceso 'aptitude upgrade' 'Instalando actualizaciones'
 
    elif [ "$base" = "Pro-Cai" ]; then

Proceso 'aptitude -y install git curl gem gem-extra npm ruby gems' 'Instalando Manejador de versiones GIT y Extras'
Proceso 'aptitude -y install postgresql mysql-server mysql-client apache2 php5 libapache2-mod-php5 php5-cli php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-mhash php5-pspell phpunit libphp-phpmailer php-mail php-openid php-codesniffer php-fpdf pkg-php-tools smarty3 phpqrcode php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-json lm-sensors php5-pgsql php5-dev libphp-jpgraph pgadmin3 filezilla' 'Instalando Herramientas de un PRO-CAI'
ProcesoX 'a2enmod rewrite' 'Activando la modificación de url'
ProcesoX 'chmod -R 777 /var/www/html/' 'Permisos a la carpeta WEB'
ProcesoX "mkdir -p ${repoLocal}descargas" 'Creando Carpeta de descargas'
Proceso "wget -N -P ${repoLocal}descargas https://download.sublimetext.com/sublime-text_build-3103_i386.deb https://download.sublimetext.com/sublime_text_3_build_3103_x32.tar.bz2" 'Descargando Sublime Ejecutable y Portable'
Proceso "dpkg -i ${repoLocal}descargas/sublime-text_build-3103_i386.deb" 'Instalando Sublime Text 3'
Proceso "wget -N -P ${repoLocal}descargas https://files.phpmyadmin.net/phpMyAdmin/4.5.4.1/phpMyAdmin-4.5.4.1-all-languages.zip" 'Descargando y Instalando Phpmyadmin'
if [ ! -d ${www}phpmyadmin ]; then
ProcesoX "unzip ${repoLocal}descargas/phpMyAdmin-4.5.4.1-all-languages.zip -d ${www}" 'Descomprimiendo'
ProcesoX "mv ${www}phpMyAdmin-4.5.4.1-all-languages ${www}phpmyadmin" "renombrando"
fi
Proceso "wget -N -P ${repoLocal}descargas http://iweb.dl.sourceforge.net/project/phppgadmin/phpPgAdmin%20%5Bstable%5D/phpPgAdmin-5.1/phpPgAdmin-5.1.zip" 'Descargando y Instalando Phppgadmin'
if [ ! -d ${www}phppgadmin ]; then
ProcesoX "unzip ${repoLocal}descargas/phpPgAdmin-5.1.zip -d ${www}" 'Descomprimiendo'
ProcesoX "mv ${www}phpPgAdmin-5.1 ${www}phppgadmin" "renombrando"
fi
ProcesoX "mv ${www}index.html ${www}Xindex.html" 'renombrando'
ProcesoX "chmod -R 777 $www" 'permisos'
ProcesoX "service apache2 restart" 'Reiniciamos servidor'
#xdg-open http://localhost/

    elif [ "$base" = "Instalar virtual box" ]; then

        if [ -f /etc/apt/sources.list.d/additional-repositories.list ]; then
        sed -i 's/deb\ http:\/\/httpredir.debian.org\/debian\/\ jessie\ main\ contrib//g' /etc/apt/sources.list.d/additional-repositories.list
        fi

add-apt-repository 'deb http://httpredir.debian.org/debian/ jessie main contrib'
aptitude update
apt-get install -y linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') virtualbox

    elif [ "$base" = "Instalar HTTP2 en servidor apache" ]; then
        if [ -f /etc/apt/sources.list.d/additional-repositories.list ]; then
        sed -i 's/deb\ http:\/\/ftp.de.debian.org\/debian\ stretch\ main//g' /etc/apt/sources.list.d/additional-repositories.list
        fi
    add-apt-repository 'deb http://ftp.de.debian.org/debian stretch main'
    aptitude update
    aptitude upgrade -y apache2
echo "
#ACTIVAR HTTP2
# for a https server
#Protocols h2 http/1.1
# for a http server
Protocols h2c http/1.1
">>/etc/apache2/sites-available/000-default.conf
    a2enmod proxy_fcgi proxy proxy_http http2 ssl expires headers rewrite
    service apache2 restart

    if [ -f /etc/apt/sources.list.d/additional-repositories.list ]; then
    sed -i 's/deb\ http:\/\/ftp.de.debian.org\/debian\ stretch\ main//g' /etc/apt/sources.list.d/additional-repositories.list
    fi
    sed -i 's/deb\ http:\/\/ftp.de.debian.org\/debian\ stretch\ main//g' /etc/apt/sources.list.d/official-package-repositories.list
    aptitude update

zenity --info --text "HTTP2 ACTIVO"

   elif [ "$base" = "Telegram" ]; then


Proceso "wget -N -P ${repoLocal}descargas https://updates.tdesktop.com/tlinux32/tsetup32.0.9.18.tar.xz" "Descargando Telegram en $repoLocal"
ProcesoX "tar Jxvf ${repoLocal}descargas/tsetup32.0.9.18.tar.xz" 'Descomprimiendo'

    elif [ "$base" = "Salir" ]; then
    echo "Script finalizado"
    break




    else
    exit 0

    fi
    
done
    ;;
    1)
echo "Script cancelado"
    ;;
    -1)
echo "Ha ocurrido un error inesperado."
    ;;
esac


exit
