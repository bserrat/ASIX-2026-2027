param(
    [Parameter(Mandatory=$true)]
    [string[]]$noms,

    [string]$ruta = "OU=MusicCloud,DC=musiccloud,DC=local"
)

function ComprovarOU($nom, $ruta) {
    $ou = Get-ADOrganizationalUnit -Filter "Name -eq '$nom'" -SearchBase $ruta

    return $ou
}

function CrearOU($nom, $ruta) {
    New-ADOrganizationalUnit -Name $nom -Path $ruta
    Write-Host "OU creada: $nom"
}

function GestionarOU($nom, $ruta) {
    $ou = ComprovarOU $nom $ruta

    if ($ou -eq $null) {
        CrearOU $nom $ruta
    }
    else {
        Write-Host "L'OU ja existeix: $nom"
    }
}

function CrearOUs($noms, $ruta) {
    foreach ($nom in $noms) {
        GestionarOU $nom $ruta
    }
}

CrearOUs $noms $ruta