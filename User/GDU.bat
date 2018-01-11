@echo off
rem Andreu Llabres Bañuls
rem GDU.bat = Gestión De Uusuarios
echo ----------------------------[%date%]-------------------------- >> Log\Us.log
:Menu
cls
echo ================================================
echo =                    MENU DE                   =
echo =               GESTION DE USUARIOS            =
echo ================================================
echo =    1. CONSULTAR LISTA DE USUARIOS            =
echo =    2. CREAR USUARIO                          =
echo =    3. CAMBIAR PASSWORD DE USUARIO            =
echo =    4. BORRAR USUARIO                         =
echo =    5. AYUDA                                  =
echo =    6. SALIR                                  =
echo ================================================
set us=
set nam=
set pas=
set Or=
set /p Or=Introduce una accion[1-6]:
if %Or%x==x echo Introduce un parametro valido entre el 1 y 6.  & pause & goto :Menu
if %Or%==1 goto :cldu
if %Or%==2 goto :cusa
if %Or%==3 goto :cpdu
if %Or%==4 goto :busu
if %Or%==5 goto :help
if %Or%==6 goto :sal
goto:Menu

:cldu
rem Listar usuarios del sistema
cls
net user
goto Imp1

:cusa
rem Crear usuario
cls
set /p us=Creacion de un usuario "administrador" o "estandar"?
if %us%x==x echo Introduce administrador o estandar. & pause & goto :cusa
set /p nam=Como se llamara?
if %nam%x==x echo Introduce un nombre. & pause & goto :cusa
set /p pas=Cual es la password?
net user %nam% %pas% /add
if %us%==administrador goto adm
goto :imp2

:adm
rem Crear usuario con permisos administrativos
net localgroup administradores %nam% /add
goto :imp2


:cpdu
rem Cambiar password del usuario
cls
set /p nam=Como se llama el usuario?
if %nam%x==x echo Introduce el nombre del usuario. & pause & goto :cpdu
set /p pas=Cual sera la password?
net user %nam% %pas%
goto :imp3


:busu
rem Borrar usuario
cls
set /p nam=Como se llama el usuario?
if %nam%x==x echo Introduce el nombre del usuario. & pause & goto :busu
net user %nam% /delete
goto :imp4

:help
rem Ayuda
cls
echo ==================================================================
echo = Introduce un parametro del 1 al 5:                             =
echo = Si presionas 1 te direcciona a consultar la lista de usuarios. =
echo = Si presionas 2 te direcciona a crear un usuario.               =
echo = Si presionas 3 te direcciona a cambiar de password al usuario. =
echo = Si presionas 4 te direcciona a borrar la cuenta de un usuario. =
echo = Si presionas 5 accedes a la ayuda.                             =
echo = Si presionas 6 vuelves al menu principal.                      =
echo ==================================================================
pause
cls
goto :Menu


:imp1
echo ----------------------------[%time%]-------------------------- >> Log\Us.log
net user >> Log\Us.log
echo >> Log\Us.log
pause
goto :Menu

:imp2
cls
echo Creado el usuario %nam% con las contrasena %pas% !!
pause
echo ----------------------------[%time%]-------------------------- >> Log\Us.log
echo El usuario %nam% con la contraseña %pas% del tipo %us% ha sido creado. >> Log\Us.log
goto :Menu


:imp3
cls
echo La nueva contrasena del usuario %nam% es %pas% !!
pause
echo ----------------------------[%time%]--------------------------- >> Log\Us.log
echo El usuario %nam% con la contraseña %pas% del tipo %us% ha sido creado. >> Log\Us.log
goto :Menu


:imp4
cls
echo El usuario %nam% ha sido elimniado del sistema !!
pause
echo ----------------------------[%time%]--------------------------- >> Log\Us.log
echo El usuario %nam% ha sido eliminado del sistema. >> Log\Us.log
goto :Menu

:sal
set Or=
call ..\Menu.bat