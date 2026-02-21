#do after enable windows update
set-service -name InstallService -startuptype Manual
start-service -name InstallService