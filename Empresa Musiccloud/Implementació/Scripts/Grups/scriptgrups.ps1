function ComprovarOU($ruta) {
    $ou = Get-ADOrganizationalUnit -Identity $ruta -ErrorAction SilentlyContinue
    return $ou
}

function ComprovarGrup($nom, $ruta) {
    $grup = Get-ADGroup -Filter "Name -eq '$nom'" -SearchBase $ruta -ErrorAction SilentlyContinue
    return $grup
}

function CrearGrup($nom, $ruta) {
    New-ADGroup -Name $nom -GroupScope Global -GroupCategory Security -Path $ruta
}

function GestionarGrup($nom, $ruta) {
    $grup = ComprovarGrup $nom $ruta

    if ($grup -eq $null) {
        CrearGrup $nom $ruta
    }
}

function GestionarGrups($noms, $ruta) {
    $ou = ComprovarOU $ruta

    if ($ou -ne $null) {
        foreach ($nom in $noms) {
            GestionarGrup $nom $ruta
        }
    }
}