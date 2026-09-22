# Fitxa 1 — Anàlisi inicial de MusicCloud

**Nom i cognoms:** BIEL SERRAT
**Data:** 17/09/2026

## Objectiu

MusicCloud necessita reorganitzar la seva infraestructura informàtica. Abans d'instal·lar o configurar cap servei, cal entendre:

- qui treballa a l'empresa;
- quines funcions té cada persona;
- quins recursos existeixen;
- qui necessita accedir a cada recurs;
- com podem gestionar aquests accessos de manera eficient.

---

# 1. Conèixer MusicCloud

Consulta la informació disponible sobre els departaments, treballadors i perfils d'usuari de MusicCloud.

Completa la taula següent.

| Persona          | Departament       | Funció / responsabilitat     | Necessita privilegis especials? Per què?                           |
| ---------------- | ----------------- | ---------------------------- | ------------------------------------------------------------------ |
| Aina Ciurans     | Direcció          | Directora                    | Sí, necessita accés a informació general i documents de l’empresa. |
| Rut Tornil       | Direcció          | Directora                    | Sí, necessita accés a informació general i documents de l’empresa. |
| Dídac Gasso      | Administració     | Administratiu                | Sí, necessita accés a documents i dades administratives.           |
| Laia Macias      | Administració     | Cap d'administració          | Sí, necessita accés a documents i dades administratives.           |
| Estel Birosta    | Suport Tècnic     | Tècnica de suport            | Sí, necessita permisos per gestionar incidències i equips.         |
| Aina Zuriguel    | Suport Tècnic     | Tècnica de suport            | Sí, necessita permisos per gestionar incidències i equips.         |
| Lluïsa Richart   | Suport Tècnic     | Cap de suport                | Sí, necessita permisos d’administració dels sistemes de suport.    |
| Roser Alberch    | Producció musical | Tècnica de producció musical | No, només necessita accés als recursos de producció.               |
| Guillem Adella   | Producció musical | Tècnic de producció musical  | No, només necessita accés als recursos de producció.               |
| Meritxell Reglat | Producció musical | Cap de producció musical     | Sí, necessita gestionar els recursos i documents del departament.  |
| Alícia Monclús   | Producció musical | Tècnica de producció musical | No, només necessita accés als recursos de producció.               |
| Carles Molins    | Producció musical | Tècnic de producció musical  | No, només necessita accés als recursos de producció.               |
| Eulàlia Galcera  | Producció musical | Tècnica de producció musical | No, només necessita accés als recursos de producció.               |
| Talia Costas     | Informàtica       | Cap d’informàtica            | Sí, necessita permisos d’administració dels sistemes informàtics.  |
| Alex Soriano     | Informàtica       | Tècnic informàtic            | Sí, necessita permisos per gestionar equips i sistemes.            |

### 1.1. Reflexió

Quines diferències observes entre un **treballador**, un **departament** i una **funció o responsabilitat**?

**Treballador:** És la persona que treballa en l'empresa.

**Departament:** És l’àrea de l’empresa on treballa una persona.

**Funció o Responsabilitat:** Indica què fa la persona dins del seu departament

Hi ha persones que, pel seu càrrec o funció, necessiten accessos diferents dels altres membres del seu departament?

X Sí  
☐ No

Posa'n algun exemple:

**Treballador:** Aina Ciurans

**Departament:** Direcció

**Funció o Responsabilitat:** Directora

# 2. Recursos de l'empresa

Analitza l'estructura d'informació de MusicCloud.

Classifica alguns dels recursos següents segons la seva finalitat.

| Recurs                                                   | Qui creus que l'hauria d'utilitzar?        | Per a què?                                                               |
| -------------------------------------------------------- | ------------------------------------------ | ------------------------------------------------------------------------ |
| `/empresa/comu/intercanvi`                               | Tots treballadors                          | Per compartir fitxers entre els treballadors.                            |
| `/empresa/comu/comunicats`                               | Tots treballadors                          | Per consultar comunicats i informació general de l’empresa.              |
| `/empresa/departaments/administracio/compartida`         | Treballadors d’Administració               | Per compartir documents i fitxers del departament.                       |
| `/empresa/departaments/administracio/gestio_departament` | Cap d’Administració                        | Per gestionar documents i informació interna del departament.            |
| `/empresa/projectes/campanya_estiu`                      | Treballadors que participen en el projecte | Per guardar i compartir els fitxers relacionats amb la campanya d’estiu. |
| `/empresa/administracio_sistema/backups`                 | Personal d’Informàtica / administradors    | Per guardar i gestionar les còpies de seguretat dels sistemes.           |

---

# 3. Qui ha de poder fer què?

Per a cada situació, indica quin nivell d'accés consideres adequat.

Utilitza:

- **NA** → sense accés
- **L** → lectura
- **L/E** → lectura i escriptura
- **ADM** → administració

No busquis encara una solució tècnica. Pensa només en les necessitats de l'empresa.

| Situació                                                             | Accés proposat | Justificació                                                                   |
| -------------------------------------------------------------------- | -------------- | ------------------------------------------------------------------------------ |
| Dídac accedeix a la carpeta compartida d'Administració               | L/E            | Necessita consultar i modificar documents del departament.                     |
| Laia accedeix a la gestió del departament d'Administració            | ADM            | És la cap del departament i necessita gestionar els recursos i documents.      |
| Pere, treballador extern, accedeix als comunicats interns            | NA             | Els comunicats interns són només per als treballadors de l'empresa.            |
| Talia accedeix als backups del sistema                               | ADM            | És la responsable d'Informàtica i necessita gestionar les còpies de seguretat. |
| Un membre de Producció musical accedeix a la carpeta d'Administració | NA             | No necessita accedir a informació interna d'un altre departament.              |
| Un participant de `campanya_estiu` accedeix als fitxers del projecte | L/E            | Necessita consultar i modificar els fitxers del projecte.                      |

---

# 4. Primer problema: com assignem els permisos?

Imagina que MusicCloud té només quatre treballadors:

- Anna
- Biel
- Carla
- David

Tots quatre treballen al mateix departament i necessiten accedir a la mateixa carpeta.

Una possible solució seria configurar:

```text
Anna  → lectura/escriptura
Biel  → lectura/escriptura
Carla → lectura/escriptura
David → lectura/escriptura
```

### 4.1.

Què passaria si l'empresa tingués **100 treballadors** amb el mateix tipus d'accés?

Seria molt complicat gestionar els permisos un per un. Amb 100 treballadors hi hauria molts usuaris i seria fàcil cometre errors.

### 4.2.

Què passaria cada vegada que s'incorporés una persona nova?

Hauríem d’afegir manualment els permisos a la persona nova, cosa que faria perdre temps i podria provocar errors.

### 4.3.

Què passaria quan una persona canviés de departament?

Hauríem de modificar els permisos de la persona manualment i donar-li els permisos del nou departament i treure-li els de l’anterior.

### 4.4.

Proposa una manera de gestionar aquestes persones conjuntament.

No cal que coneguis encara el nom tècnic de la solució.

Podem agrupar els treballadors segons el departament o les seves funcions i assignar els permisos al grup. Així, quan entra o canvia una persona, només cal modificar el grup al qual pertany.

# 5. Canvis a MusicCloud

Ara es produeixen aquests tres canvis:

### Cas A

Dídac deixa Administració i passa a Producció musical.

Quins accessos hauria de perdre?

---

Quins accessos hauria d'obtenir?

---

---

### Cas B

S'incorpora una nova treballadora al departament d'Administració.

Quins accessos caldria configurar?

---

---

---

### Cas C

Pere Espinalt deixa de col·laborar amb MusicCloud.

Què hauríem de fer amb els seus accessos?

---

---

---

# 6. Busquem una solució millor

Suposa ara que podem crear conjunts de persones que comparteixen unes mateixes necessitats d'accés.

Per exemple:

```text
Administració
    ├── Dídac
    ├── Laia
    └── Roser
```

I podem donar permisos directament al conjunt:

```text
Administració → carpeta_administracio → L/E
```

### 6.1.

Quin avantatge té aquesta solució respecte a donar permisos persona per persona?

---

---

### 6.2.

Si Dídac passa d'Administració a Producció musical, què caldria modificar?

---

---

### 6.3.

Com anomenaries aquests conjunts de persones?

---

---

# 7. Primera proposta per a MusicCloud

A partir de l'organització de l'empresa, proposa els primers conjunts de persones que crearies.

**No cal trobar encara la solució definitiva.**

| Nom proposat | Qui hi pertanyeria? | Per què existeix aquest conjunt? |
| ------------ | ------------------- | -------------------------------- |
|              |                     |                                  |
|              |                     |                                  |
|              |                     |                                  |
|              |                     |                                  |
|              |                     |                                  |

---

# 8. Cas que complica el model

Laia treballa al departament d'Administració, però també és la responsable del departament.

És suficient que pertanyi només al conjunt `Administració`?

☐ Sí  
☐ No

Per què?

---

---

Quina possible solució proposes?

---

---

---

# 9. Un altre cas

Diverses persones de departaments diferents participen temporalment en el projecte:

```text
Campanya Estiu
```

Creus que hauríem de canviar-les de departament?

☐ Sí  
☐ No

Si no, com podríem donar-los accés als recursos del projecte?

---

---

---

# 10. Conclusions

Completa les frases amb les teves paraules.

### Usuari

Un usuari representa:

---

### Recurs

Un recurs és:

---

### Permís

Un permís determina:

---

### Grup

Un grup serveix per:

---

---

# 11. Regla de mínim privilegi

Analitza aquesta afirmació:

> Un usuari només hauria de tenir els permisos estrictament necessaris per realitzar la seva feina.

Explica amb les teves paraules què significa.

---

---

Posa un exemple relacionat amb MusicCloud.

---

---

---

# 12. Pregunta final

Imagina que demà MusicCloud passa de 14 treballadors a 500.

Quina de les dues estratègies consideres més adequada?

☐ Assignar permisos individualment a cada usuari.

☐ Organitzar els usuaris segons les seves necessitats i assignar permisos a aquests conjunts.

Justifica la resposta.

---

---

---

Jo **no faria obligatori que acabessin tota la fitxa abans d'explicar res**. La utilitzaria de manera sincronitzada amb la classe:

**0–40 min:** apartats 1–3 → analitzen MusicCloud i els accessos.  
**40–65 min:** apartats 4–5 → apareix el problema de gestionar permisos individualment.  
**65–85 min:** explicació curta de **usuari, grup, recurs, permís i mínim privilegi**.  
**85–110 min:** apartats 6–9 → apliquen immediatament el concepte de grup.  
**110–120 min:** apartats 10–12 → revisió i tancament.

Hi ha una decisió pedagògica important: a l'apartat 4 **no utilitzo la paraula “grup” fins que l'alumnat ha intentat resoldre el problema**. Això encaixa molt millor amb el cicle que vols seguir: primer tenen el problema, després apareix la necessitat i només aleshores introdueixes el concepte teòric.
