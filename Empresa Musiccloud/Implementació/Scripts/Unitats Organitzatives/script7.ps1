param(
    [Parameter(Mandatory=$true)]
    [string[]]$noms,

    [string]$ruta = "OU=MusicCloud,DC=musiccloud,DC=local"
)

Import-Module ActiveDirectory

foreach ($nom in $noms) {

    try {
        $ou = Get-ADOrganizationalUnit -Identity "OU=$nom,$ruta" -ErrorAction Stop
    }
    catch {
        $ou = $null
    }

    if (-not $ou) {
        New-ADOrganizationalUnit -Name $nom -Path $ruta
    }
}