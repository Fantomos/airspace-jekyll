@echo off
chcp 28591 > nul
jupyter nbconvert --config jekyll
echo.
echo Conversion termin�e
echo.
python move.py
echo.
echo D�placement termin�e
echo.

WHERE git > nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
	ECHO Actualisation automatique impossible : Git non install�. Pensez � actualiser le d�p�t manuellement !
	echo.
	goto end
) ELSE (
echo Actualiser le d�p�t ?(Y/N) 
set INPUT=
set /P INPUT=Y/N: %=%
if /I "%INPUT%" == "Y" goto updateGit
if /I "%INPUT%" == "N" goto noupdateGit
goto noupdateGit
)

:updateGit
cd ../
git pull
git add .
git commit -a -m "commit"
git push
echo.
ECHO D�p�t GitHub actualis� !
echo.
goto end

:noupdateGit
echo.
ECHO Pensez �actualiser le d�p�t manuellement !
echo.

:end


pause