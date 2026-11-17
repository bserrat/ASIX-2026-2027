$fitxer = "C:\Compartida\ous.csv"
$log = "C:\Compartida\log.txt"

$ous = Import-Csv $fitxer

foreach ($ou in $ous) {

    $nom = $ou.Nom
    $ruta = $ou.Ruta

    try {
        Get-ADOrganizationalUnit -Identity "OU=$nom,$ruta" -ErrorAction Stop
        Add-Content $log "Ja existeix: $nom"
    }
    catch {
        try {
            New-ADOrganizationalUnit -Name $nom -Path $ruta -ErrorAction Stop
            Add-Content $log "OU creada: $nom"
        }
        catch {
            Add-Content $log "Error creant: $nom"
        }
    }
}