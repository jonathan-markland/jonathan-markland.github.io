@if "%~1"=="" goto GameNameParameterMissing
@if not exist ..\RetroGames\%1Web\wwwroot\bundle.js goto BundleMissing

ren %1 old_%1
@if ERRORLEVEL 1 goto RenameFailed

mkdir %1
@if ERRORLEVEL 1 goto MakeDirFailed

copy ..\RetroGames\%1Web\wwwroot\ %1\
@if ERRORLEVEL 1 goto CopyFailed

@Echo Success!
@goto :End

:GameNameParameterMissing
@Echo The game name parameter is missing on the command line.
@goto End

:BundleMissing
@Echo The %1 bundle.js file cannot be located.  Has build_production.bat been run?
@goto End

:RenameFailed
@Echo Failed to rename the old %1 web site folder.  Please check if old_%1 already exists!
@goto End

:MakeDirFailed
@Echo Failed to make the %1 folder to receive the updated web site content.
@goto End

:CopyFailed
@Echo Failed to copy the rebuilt %1Web content to the %1 folder.
@goto End

:End
