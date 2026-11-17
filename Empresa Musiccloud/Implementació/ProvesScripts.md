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

## 3. Scriptgrups.ps1 – Creació de grups

Aquest script permet crear grups de seguretat globals dins d'una unitat organitzativa. Abans de crear-los, comprova que la OU existeixi i que els grups no estiguin creats anteriorment.

### Execució

```powershell
. C:\Compartida\scriptgrups.ps1

GestionarGrups @("GG_Administracio","GG_Comercial","GG_Desenvolupament","GG_Sistemes","GG_Direccio") "OU=Grups,OU=MusicCloud,DC=musiccloud,DC=local"
```

### Comprovació

```powershell
Get-ADGroup -Filter * -SearchBase "OU=Grups,OU=MusicCloud,DC=musiccloud,DC=local" | Select-Object Name
```

He comprovat que apareixen els cinc grups amb el prefix GG\_ dins de la OU Grups.

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

## 3. Scriptgrups.ps1 – Creació de grups

Aquest script permet crear grups de seguretat globals dins d'una unitat organitzativa. Abans de crear-los, comprova que la OU existeixi i que els grups no estiguin creats anteriorment.

### Execució

```powershell
. C:\Compartida\scriptgrups.ps1

GestionarGrups @("GG_Administracio","GG_Comercial","GG_Desenvolupament","GG_Sistemes","GG_Direccio") "OU=Grups,OU=MusicCloud,DC=musiccloud,DC=local"
```

### Comprovació

```powershell
Get-ADGroup -Filter * -SearchBase "OU=Grups,OU=MusicCloud,DC=musiccloud,DC=local" | Select-Object Name
```

He comprovat que apareixen els cinc grups amb el prefix GG\_ dins de la OU Grups.

---
