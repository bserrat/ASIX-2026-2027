# Activitat: del disseny a l’arquitectura d’AD DS

# Context

MusicCloud ja ha completat el disseny lògic del seu servei de directori.

Abans d’instal·lar Active Directory Domain Services, cal comprovar que l’alumnat identifica correctament els components que s’hauran d’implantar.

# Identificació dels components

A partir de l’arquitectura prevista, indiqueu:

1.  Quin serà el nom del bosc.

    > musicloud.local

2.  Quin serà el nom del domini.

    > musicloud.local

3.  Quin servidor actuarà com a controlador de domini.

    > SRV-AD-01

4.  Quin servidor proporcionarà DNS.

    > SRV-AD-01

5.  Quin protocol s’utilitzarà principalment per a l’autenticació.

    > Kerberos

6.  Quin protocol permetrà consultar els objectes.

    > LDAP

7.  Quin servei de Windows emmagatzema i administra els objectes del domini?

    > Domain Services

# Anàlisi de l’arquitectura

Responeu breument:

1.  Per què el servidor `SRV-AD-01` necessita una adreça IP fixa?

    > Perquè els clients han de poder trobar sempre el controlador de domini i el servidor DNS a la mateixa adreça IP.

2.  Per què els clients del domini han d’utilitzar un servidor DNS capaç de resoldre la zona d’Active Directory?

    > Perquè necessiten trobar serveis del domini, com el controlador de domini i els serveis de Kerberos i LDAP.

3.  Què passaria si `SRV-AD-01` estigués apagat?

    > Els clients no podrien autenticar-se normalment al domini ni accedir a alguns serveis d’Active Directory.

4.  Per què un únic controlador de domini és acceptable al laboratori però insuficient en una empresa real?

    > Al laboratori és suficient per fer proves. En una empresa, si aquest servidor falla, el domini quedaria sense controlador. Per això normalment hi ha almenys dos controladors.

5.  Per què els departaments no s’han creat com a dominis diferents?
    > Perquè els departaments poden estar separats amb unitats organitzatives i grups dins del mateix domini. Crear un domini per cada departament seria innecessari i més difícil d’administrar.

# Planificació de la implantació

Ordeneu les accions següents:

1. preparar la xarxa del servidor.

2. instal·lar AD DS.

3. crear el bosc i el domini.

4. comprovar el DNS.

5. crear les unitats organitzatives.

6. crear els grups.

7. crear els usuaris.

8. assignar els usuaris als grups.

9. unir el client al domini.

10. comprovar el funcionament del domini.

Justifiqueu breument l’ordre escollit.

> Primer preparem la xarxa perquè el servidor tingui una configuració correcta i estable. Després instal·lem AD DS i creem el bosc i el domini. Comprovem que el DNS funciona perquè és necessari per al funcionament d’Active Directory.
