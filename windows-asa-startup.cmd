<script>
msiexec /qb /I https://dist.scaleft.com/server-tools/windows/latest/ScaleFT-Server-Tools-latest.msi
mkdir C:\Windows\System32\config\systemprofile\AppData\Local\scaleft
echo ${ENROLLMENTTOKEN}  > C:\windows\system32\config\systemprofile\AppData\Local\scaleft\enrollment.token
echo CanonicalName: ${SERVERNAME} > C:\Windows\System32\config\systemprofile\AppData\Local\scaleft\sftd.yaml
echo Bastion: ${GATEWAYNAME} >> C:\Windows\System32\config\systemprofile\AppData\Local\scaleft\sftd.yaml
net stop scaleft-server-tools && net start scaleft-server-tools
</script>