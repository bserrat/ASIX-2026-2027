Import-Module ActiveDirectory

$domini = "DC=musiccloud,DC=local"

if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'MusicCloud'")) {
    New-ADOrganizationalUnit -Name "MusicCloud" -Path $domini
}

$principal = "OU=MusicCloud,$domini"

if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Usuaris'" -SearchBase $principal)) {
    New-ADOrganizationalUnit -Name "Usuaris" -Path $principal
}

if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Equips'" -SearchBase $principal)) {
    New-ADOrganizationalUnit -Name "Equips" -Path $principal
}

if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Grups'" -SearchBase $principal)) {
    New-ADOrganizationalUnit -Name "Grups" -Path $principal
}