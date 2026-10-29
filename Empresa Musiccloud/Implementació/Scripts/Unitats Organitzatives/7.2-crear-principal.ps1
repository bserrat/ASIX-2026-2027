Import-Module ActiveDirectory

New-ADOrganizationalUnit -Name "MusicCloud" -Path "DC=musiccloud,DC=local"