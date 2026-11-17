# Proves dels scripts

## 1. Script7.ps1 – Creació de múltiples OUs

Aquest script permet crear diverses unitats organitzatives indicant els noms quan executem l'script. La ruta és opcional i, si no s'indica, les OUs es creen dins de MusicCloud.

Abans de crear cada OU, comprova si ja existeix. Si existeix, no la torna a crear.

### Execució

```powershell
C:\Compartida\script7.ps1 -noms "Usuaris","Equips","Grups"
```

També podem indicar una ruta diferent:

```powershell
C:\Compartida\script7.ps1 -noms "Administracio","Comercial","Desenvolupament","Sistemes","Direccio" -ruta "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local"
```

### Comprovació

```powershell
Get-ADOrganizationalUnit -Filter * | Select-Object Name, DistinguishedName
```

He comprovat que les unitats organitzatives s'han creat dins de la ruta indicada i que, si torno a executar l'script, no es creen duplicades.

---

# Proves dels scripts

## 1. Script7.ps1 – Creació de múltiples OUs

Aquest script permet crear diverses unitats organitzatives indicant els noms quan executem l'script. La ruta és opcional i, si no s'indica, les OUs es creen dins de MusicCloud.

Abans de crear cada OU, comprova si ja existeix. Si existeix, no la torna a crear.

### Execució

```powershell
C:\Compartida\script7.ps1 -noms "Usuaris","Equips","Grups"
```

També podem indicar una ruta diferent:

```powershell
C:\Compartida\script7.ps1 -noms "Administracio","Comercial","Desenvolupament","Sistemes","Direccio" -ruta "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local"
```

### Comprovació

```powershell
Get-ADOrganizationalUnit -Filter * | Select-Object Name, DistinguishedName
```

He comprovat que les unitats organitzatives s'han creat dins de la ruta indicada i que, si torno a executar l'script, no es creen duplicades.

---

## 2. Script7funcions.ps1 – Creació de múltiples OUs amb funcions

Aquest script permet crear diverses unitats organitzatives utilitzant funcions. Comprova si cada OU existeix abans de crear-la.

### Execució

```powershell
. C:\Compartida\script7funcions.ps1

CrearOUs @("Administracio","Comercial","Desenvolupament","Sistemes","Direccio") "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local"
```

### Comprovació

```powershell
Get-ADOrganizationalUnit -Filter * -SearchBase "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local" | Select-Object Name
```

He comprovat que apareixen les cinc unitats organitzatives i que no es creen duplicades si torno a executar la funció.

---
