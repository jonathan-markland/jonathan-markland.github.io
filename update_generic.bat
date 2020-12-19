@if "%~1"=="" goto GameNameParameterMissing
@if not exist ..\RetroGames\%1Web\wwwroot\bundle.js goto BundleMissing
@if exist %1 goto FolderAlreadyExists

mkdir %1
@if ERRORLEVEL 1 goto MakeDirFailed

xcopy ..\RetroGames\%1Web\wwwroot\ %1\ /s
@if ERRORLEVEL 1 goto CopyFailed

@Echo Success!
@goto :End

:GameNameParameterMissing
@Echo The game name parameter is missing on the command line.
@goto End

:BundleMissing
@Echo The %1 bundle.js file cannot be located at: ..\RetroGames\%1Web\wwwroot\bundle.js  Has build_production.bat been run?
@goto End

:FolderAlreadyExists
@Echo There is already a folder called %1.  Please move it out to an archive location, or erase it manually.
@goto End

:MakeDirFailed
@Echo Failed to make the %1 folder to receive the updated web site content.
@goto End

:CopyFailed
@Echo Failed to copy the rebuilt %1Web content to the %1 folder.
@goto End

:End
