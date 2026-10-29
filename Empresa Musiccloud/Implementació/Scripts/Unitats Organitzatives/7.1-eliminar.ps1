Import-Module ActiveDirectory

Remove-ADOrganizationalUnit -Identity "OU=MusicCloud,DC=musiccloud,DC=local" -Recursive -Confirm:$false