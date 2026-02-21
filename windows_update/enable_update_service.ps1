function rename-mydll {
	param(
		$name
	)
	
	$Bakpath="C:\Windows\System32\${name}.dll"
	$OGpath="C:\Windows\System32\${name}_Bak.dll"
	
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

set-service -name UsoSvc -startuptype Maunal
set-service -name wuauserv -startuptype Manual
set-service -name BITS -startuptype Manual

start-service -name UsoSvc
start-service -name wuauserv
start-service -name BITS
