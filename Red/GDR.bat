@echo off
rem Andreu Llabres Bañuls
rem GDR.bat = Gestión De Red.
echo ----------------------------[%date%]-------------------------- >> Log\Red.log
:Menu
set Or=
set preg=
set pre0=
set pre1=
set pre2=
cls
echo ================================================
echo =                   MENU DE                    =
echo =               GESTION DE RED                 =
echo ================================================
echo =   1. VER CONFIGURACION DE RED DEL EQUIPO     =
echo =   2. COMPROBAR CONEXION CON UNA WEB O HOST   =
echo =   3. CONFIGURAR IP DEL EQUIPO                =
echo =   4. ABRIR PAGINA WEB EN EL NAVEGADOR        =
echo =   5. AYUDA                                   =
echo =   6. SALIR                                   =
echo ================================================
set /p Or=Introduce una accion[1-6]:
if %Or%x==x goto :erro
if %Or%==1 goto :vcre
if %Or%==2 goto :ccwh
if %Or%==3 goto :cide
if %Or%==4 goto :cicn
if %Or%==5 goto :help
if %Or%==6 goto :sal
goto :Menu

:erro
cls
echo Parametro introducido no es correcto, por favor introduce un numero del 1 al 6.
pause
goto :Menu

:vcre
cls
ipconfig
echo ----------------------------[%time%]-------------------------- >> Log\Red.log
ipconfig >> Log\Red.log
pause
goto :Menu

:ccwh
cls
set /p pre0=Introduce una ip o una dirrecion web?
if %pre0%x==x echo Introduce una ip o dirrecion web. & pause & goto :ccwh
set /p pre1=Introduce cuantos paquetes enviara?[Por defecto envia 4 paquetes]:
if %pre1%x==x set /a pre1=4
set /p pre2=Introduce el tamano del paquete en bytes?[Por defecto envia de 32 bytes]:
if %pre2%x==x set /a pre2=32
goto :imp1

:cide
cls
set /p preg=Quieres configurar la ip del equipo por "static" o "dinamic":
if %preg%x==x echo Introduce como valor static o dinamic. & goto cide
if %preg%==static goto :cids
if %preg%==dinamic goto :cidd
goto :cide

:cids
set /pre0=Introduce un nombre descriptivo para la conexion:
if %pre0%x==x echo Introduce un nombre representativo . & pause & goto :cids
netsh interface ip set address %pre0% static dhcp
echo ----------------------------[%time%]-------------------------- >> Log\Red.log
echo  netsh interface ip set address %pre0% static dhcp >> Log\Red.log
pause
goto :Menu

:cidd
set /pre0=Introduce un nombre descriptivo para la conexion:
if %pre0%x==x echo Introduce un nombre representativo . & pause & goto :cidd
set /pre1=Asigna una ip para el equipo:
if %pre1%x==x echo Introduce una ip. & pause & goto :cidd
set /pre2=Introduce una mascara de subred para el equipo:
if %pre2%x==x echo Introduce una mascara de subred. & pause & goto :cidd
set /pre3=Introduce la ip del gateway:
if %pre3%x==x echo Introduce una ip. & pause & goto :cidd
netsh interface ip set address %pre0% static %pre1% %pre2% %pre3% 1
echo ----------------------------[%time%]-------------------------- >> Log\Red.log
echo  netsh interface ip set address %pre0% static %pre1% %pre2% %pre3% 1 >> Log\Red.log
pause
goto :Menu

:cicn
cls
echo Ejemplo de uso, si escribes www.abrirllave.com se abrira el navegador predeterminado con esa pagina web.
set /p pre0=Que pagina quieres abrir?
if %pre0%x==x echo Introduce un valor valido. & pause & goto :cicn
start %pre0%
echo ----------------------------[%time%]-------------------------- >> Log\Red.log
echo Se abierto la pagina %pre0% con en el navegador predeterminado. >> Log\Red.log
echo Pagina web abierta.
pause
goto :Menu

:Help
cls
echo =====================================================================
echo = Introduce un parametro entre el 1 al 6:                           =
echo = Si presionas 1 te permite ver la configuracion de red del equipo. =
echo = Si presionas 2 comprueba la conexion con un host o una web.       =
echo = Si presionas 3 configuras la ip del equipo.                       =
echo = Si presionas 4 abre el navegador con una pagina web.              =
echo = Si presionas 5 abre esta ayuda.                                   =
echo = Si presionas 6 vuelves al menu principal.                         =
echo =====================================================================
pause
goto :Menu

:imp1
echo ----------------------------[%time%]-------------------------- >> Log\Red.log
ping -n %pre1% -l %pre2% %pre0% >> Log\Red.log
ping -n %pre1% -l %pre2% %pre0%
pause
goto :Menu

:sal
set Or=
call ..\Menu.bat