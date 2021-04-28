@if "%~1"=="" goto GameNameParameterMissing
@if exist %1 goto FolderAlreadyExists

pushd ..\RetroGames\%1Web
@if ERRORLEVEL 1 goto GameProjFolderFailed
@if exist wwwroot goto WWWRootAlreadyExists
call build_production.bat
@if ERRORLEVEL 1 goto End
popd

mkdir %1
@if ERRORLEVEL 1 goto MakeDirFailed

xcopy ..\RetroGames\%1Web\wwwroot\ %1\ /s
@if ERRORLEVEL 1 goto CopyFailed

@Echo Success!
@goto :End

:GameNameParameterMissing
@Echo The game name parameter is missing on the command line.
@goto End

:WWWRootAlreadyExists
@Echo The %1Web\wwwroot folder already exists.  Please move it out to an archive location, or erase it manually.
@goto End

:FolderAlreadyExists
@Echo There is already a folder called %1.  Please move it out to an archive location, or erase it manually.
@goto End

:MakeDirFailed
@Echo Failed to make the %1 folder to receive the updated web site content.
@goto End

:GameProjFolderFailed
@Echo Failed to locate the ..\RetroGames\%1Web folder.
@goto End

:CopyFailed
@Echo Failed to copy the rebuilt %1Web content to the %1 folder.
@goto End

:End
