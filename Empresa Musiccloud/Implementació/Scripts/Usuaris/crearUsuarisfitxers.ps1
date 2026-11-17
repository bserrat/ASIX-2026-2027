$fitxer = "C:\Compartida\usuaris.csv"
$log = "C:\Compartida\logUsuaris.txt"

$usuaris = Import-Csv $fitxer

foreach ($usuari in $usuaris) {

    $contrasenya = ConvertTo-SecureString $usuari.Contrasenya -AsPlainText -Force

    $ou = Get-ADOrganizationalUnit -Identity $usuari.Ruta -ErrorAction SilentlyContinue

    if ($ou) {

        $existeix = Get-ADUser -Filter "SamAccountName -eq '$($usuari.Usuari)'"

        if (-not $existeix) {

            New-ADUser -Name $usuari.Nom -SamAccountName $usuari.Usuari -UserPrincipalName "$($usuari.Usuari)@musiccloud.local" -AccountPassword $contrasenya -Path $usuari.Ruta -Enabled $true -ChangePasswordAtLogon $true

            Add-Content $log "Usuari creat: $($usuari.Usuari)"
        }
        else {
            Add-Content $log "L'usuari ja existeix: $($usuari.Usuari)"
        }
    }
    else {
        Add-Content $log "La OU no existeix: $($usuari.Ruta)"
    }
}