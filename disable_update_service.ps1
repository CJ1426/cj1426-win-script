stop-service -name UsoSvc
stop-service -name wuauserv
set-service -name UsoSvc -startuptype Disabled
set-service -name wuauserv -startuptype Disabled

function rename-mydll {
	param(
		$name
	)
	
	$OGpath="C:\Windows\System32\${name}.dll"
	$Bakpath="C:\Windows\System32\${name}_Bak.dll"
	
	if (Test-Path -Path $OGpath) {
		Start-Process -FilePath "takeown.exe" -ArgumentList "/F ${OGpath}" -wait
		Start-Process -FilePath "icacls.exe" -ArgumentList "${OGpath} /grant *S-1-1-0:F" -wait
		Rename-Item -Path "${OGpath}" -NewName "${Bakpath}"
		Start-Process -FilePath "icacls.exe" -ArgumentList "${Bakpath} /setowner `"NT SERVICE\TrustedInstaller`"" -wait
		Start-Process -FilePath "icacls.exe" -ArgumentList "${Bakpath} /remove *S-1-1-0:F" -wait
	}
}

rename-mydll -name "WaaSMedicSvc"
rename-mydll -name "wuaueng"