param(
    [Parameter(Mandatory=$true)]
    [string]$nom,

    [string]$ruta = "OU=MusicCloud,DC=musiccloud,DC=local"
)

Import-Module ActiveDirectory

try {
    $ou = Get-ADOrganizationalUnit -Identity "OU=$nom,$ruta" -ErrorAction Stop
}
catch {
    $ou = $null
}

if (-not $ou) {
    New-ADOrganizationalUnit -Name $nom -Path $ruta
}