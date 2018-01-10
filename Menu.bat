@echo off
rem Herramientas administrativas
rem Andreu Llabres Bañuls
rem Menu pricipal -> Menu.bat

:pre
cls
echo Para que el script funcione tienes que tener permisos administrativos.
set /p tri=Indicame la ruta donde se encuentra el script inicial:
if %tri%x==x echo Introduce una ruta valida. & pause & goto :pre
cd %tri%

:Menu
cls
echo ======================================
echo =              MENU                  =
echo ======================================
echo =      1. GESTION DE USUARIOS        =
echo =      2. GESTION DE PROCESOS        =
echo =      3. GESTION DE RED             =
echo =      4. AYUDA                      =
echo =      5. SALIR                      =
echo ======================================
set Or=
set /p Or=Introduce una accion[1-5]:
if %Or%x==x goto :Error
if %Or%==1 goto :User
if %Or%==2 goto :Proc
if %Or%==3 goto :Red
if %Or%==4 goto :Help
if %Or%==5 goto :eof

:User
call User/GDU.bat
goto :Menu

:Proc
call Pro/GDP.bat
goto :Menu

:Red
call Red/GDR.bat
goto :Menu

:Error
set Or=sin marcar
echo La accion %Or% no existe.
pause
cls
set /p preg=Quires ver la ayuda?[si o no]: 
if %preg%=="si" goto :Help
cls
goto :Menu

:Help
cls
echo ================================================================
echo = Introduce un parametro entre el 1 al 5:                      =
echo = Si presionas 1 te direcciona al menu de GESTION DE USUARIOS. =
echo = Si presionas 2 te direcciona al menu de GESTION DE PROCESOS. =
echo = Si presionas 3 te direcciona al menu de GESTION DE RED.      =
echo = Si presionas 5 cierras el programa.                          =
echo ================================================================
pause
goto :Menu

:eof
set Or=
set tri=