param(
    [Parameter(Mandatory=$true)]
    [string]$nom,

    [string]$ruta = "OU=MusicCloud,DC=musiccloud,DC=local"
)

Import-Module ActiveDirectory

$objecte = Get-ADObject -Filter "Name -eq '$nom'" -SearchBase $ruta

if (-not $objecte) {
    New-ADOrganizationalUnit -Name $nom -Path $ruta
}