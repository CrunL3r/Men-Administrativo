@echo off
rem Andreu Llabres Bañuls
rem GDU.bat = Gestión De Procesos
echo ----------------------------[%date%]-------------------------- >> Log\Pro.log
:Menu
rem Menu de gestion de procesos
cls
echo ==============================================
echo =               MENU DE                      =
echo =          GESTION DE PROCESOS               =
echo ==============================================
echo =        1. LISTAR PROCESOS                  =
echo =        2. BORRAR PROCESO                   =
echo =        3. GUARDAR LISTA EN ARCHIVO EXTERNO =
echo =        4. AYUDA                            =
echo =        5. SALIR                            =
echo ==============================================
set preg=
set pre1=
set num=
set Or=
set /p Or=Introduce una accion[1-5]:
if %Or%x==x echo No has intoducido ningún parametro valido. & pause & goto :Menu
if %Or%==1 goto :litp
if %Or%==2 goto :elim
if %Or%==3 goto :glae
if %Or%==4 goto :help
if %Or%==5 goto :sal
goto :Menu

:litp
rem Mostar procesos.
cls
tasklist
echo ----------------------------[%time%]-------------------------- >> Log\Pro.log
echo Listado todos los procesos activos. >> Log\Pro.log
pause
goto :Menu

:elim
rem Preguntar por el PID del proceso a borrar.
cls
set /p preg=Sabes el PID de la proceso a borrar?[si o no]:
if %preg%x==x echo Introduce si o no como valor. & pause & goto :elim
if %preg%==no goto :litp
if %preg%==si goto :elip
goto :Menu

:elip
rem Borrar proceso por PID.
echo ----------------------------[%time%]-------------------------- >> Log\Pro.log
set /p num=Numero de identidad del proceso?
if %num%x==x echo Introduce un valor que tenga PID de los procesos . & pause & goto :elip
taskkill /pid %num% /f
if %errorlevel%==0 echo Borrado satisfactoriamente el proceso con el PID %num%. >> Log\Pro.log
pause
goto :Menu

:glae
rem Exportar una lista detallada "csv" o simple "txt".
cls
set /p pre1=Quieres que sea una lista detallada "csv" o  simple "txt"?
if %pre1%x==x echo Introduce un valor entre csv o txt. & pause & goto :glae
if %pre1%==csv goto :imp1 
if %pre1%==txt goto :imp1
goto :Menu

:Help
rem Ayuda
cls
echo ====================================================================================
echo = Introduce un parametro entre el 1 al 5:                                          =
echo = Si presionas 1 te lista los procesos activos.                                    =
echo = Si presionas 2 te permite eliminar un proceso.                                   =
echo = Si presionas 3 te permite almacenar las listas de procesos en un archivo externo.=
echo = Si presionas 4 aparece la ayuda.                                                 =
echo = Si presionas 5 vuelve al menu principal.                                         =
echo ====================================================================================
pause
cls
goto :Menu

:imp1
rem Imprime la lista detallada "csv" o simple "txt" 
cls
echo ----------------------------[%time%]-------------------------- >> Log\Pro.log
if %pre1%==csv tasklist /v /fo csv>Pro/list/lista.csv  & echo Creado el archivo externo lista.csv dentro del directorio Pro\list & echo Creado el archivo externo lista.csv dentro del directorio Pro\list >> Log\Pro.log 
if %pre1%==txt tasklist /svc /fo list>Pro/list/lista.txt & echo Creado el archivo externo lista.txt dentro del directorio Pro\list & echo Creado el archivo externo lista.txt dentro del directorio Pro\list >> Log\Pro.log
pause
goto :Menu

:sal
rem Elimina variable para el menu y volver al menu principal.
set Or=
call ..\Menu.bat