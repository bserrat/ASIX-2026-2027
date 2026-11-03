param(
    [Parameter(Mandatory=$true)]
    [string]$nom,

    [Parameter(Mandatory=$true)]
    [string]$ruta
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