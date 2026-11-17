$fitxer = "C:\Compartida\grups.csv"
$log = "C:\Compartida\logGrups.txt"

$grups = Import-Csv $fitxer

foreach ($grup in $grups) {

    $nom = $grup.Nom
    $ruta = $grup.Ruta

    $ou = Get-ADOrganizationalUnit -Identity $ruta -ErrorAction SilentlyContinue

    if ($ou) {

        $existeix = Get-ADGroup -Filter "Name -eq '$nom'" -SearchBase $ruta

        if (-not $existeix) {
            New-ADGroup -Name $nom -GroupScope Global -Path $ruta
            Add-Content $log "Grup creat: $nom"
        }
        else {
            Add-Content $log "El grup ja existeix: $nom"
        }
    }
    else {
        Add-Content $log "La OU no existeix: $ruta"
    }
}