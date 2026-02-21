#do after disabled windows update
stop-service -name InstallService
set-service -name InstallService -startuptype Disabled
