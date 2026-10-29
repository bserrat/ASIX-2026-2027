Import-Module ActiveDirectory

New-ADOrganizationalUnit -Name "MusicCloud" -Path "DC=musiccloud,DC=local"

New-ADOrganizationalUnit -Name "Usuaris" -Path "OU=MusicCloud,DC=musiccloud,DC=local"

New-ADOrganizationalUnit -Name "Equips" -Path "OU=MusicCloud,DC=musiccloud,DC=local"

New-ADOrganizationalUnit -Name "Grups" -Path "OU=MusicCloud,DC=musiccloud,DC=local"