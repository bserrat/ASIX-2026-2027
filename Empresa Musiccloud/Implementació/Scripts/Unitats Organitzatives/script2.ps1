param(
    [Parameter(Mandatory=$true)]
    [string]$nom
)

Import-Module ActiveDirectory

$ruta = "DC=musiccloud,DC=local"

try {
    $ou = Get-ADOrganizationalUnit -Identity "OU=$nom,$ruta" -ErrorAction Stop
}
catch {
    $ou = $null
}

if (-not $ou) {
    New-ADOrganizationalUnit -Name $nom -Path $ruta
}