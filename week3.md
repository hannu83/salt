# Palvelinten hallinta h3

* a) Opiskele yllä aikataulussa olevat artikkelit. Noissa artikkeleissa opetetaan ne asiat, joilla läksyt saa tehtyä. Tätä a-kohdan lukutehtävää ei tarvitse raportoida. Luettava materiaali on kunkin tapaamiskerran kohdalla.

* b) MarkDown. Tee tämän tehtävän raportti MarkDownina. Helpointa on tehdä raportti samaan GitHub-varastoon kuin Salt-modulit. Tiedostoon .md-pääte. Tyhjä rivi tekee kappalejaon, risuaita ‘#’ tekee otsikon, sisennys merkitsee koodinpätkän.
* c) Laita /srv/salt/ gittiin. Tee uusi moduli. Kloonaa varastosi toiselle koneelle (tai poista /srv/salt ja palauta se kloonaamalla) ja jatka sillä.
* d) Näytä omalla salt-varastollasi esimerkit komennoista ‘git log’, ‘git diff’ ja ‘git blame’. Selitä tulokset.
* e) Tee tyhmä muutos gittiin, älä tee commit:tia. Tuhoa huonot muutokset ‘git reset –hard’. Huomaa, että tässä toiminnossa ei ole peruutusnappia.
* f) Tee uusi salt-moduli. Voit asentaa ja konfiguroida minkä vain uuden ohjelman: demonin, työpöytäohjelman tai komentokehotteesta toimivan ohjelman. Käytä tarvittaessa ‘find -printf “%T+ %p\n”|sort’ löytääksesi uudet asetustiedostot.

Tehtävät tehdään omalla Windows 10 x64 pc pöytäkoneellani, jossa on Intel i7-4790K prosessori, Asus Z97 Pro Wifi-ac emolevy, 16 gigatavua keskusmuistia, MSI 1080 ti näytönohjain sekä viimeisin Windows päivitys (17134.345). Itse tehtävät hoidetaan putty:n versio 0.67 ssh:n välityksellä virtuaalipalvelimeeni, joka on vuokrattu Digital Oceanin kautta.

## b) Tämä tehtävä tehdään markdown muodossa ja tieto tallennettiin /srv/salt/ hakemistoon ja sieltä github varastoon.

## c) /srv/salt/ gittiin.

/srv/salt/ on jo gitissä, joten aloitin poistamalla sen koneelta ja lataamalla sen uudelleen. Ensin kuitenkin otin varmuuskopion toiseen hakemistoon koko salt-kansiosta.

>  $ sudo cp -r /srv/salt/ /home/hannu/salt/

Ja poistin alkuperäisen saltin

>  $ sudo rm -r /srv/salt/
 
Nyt /srv/ hakemisto on tyhjä, joten sinne oli saatava palautettua tiedot. Mikäli GIT ei olisi asennettuna voisi sen asentaa:

>  $ sudo apt-get update
>  $ sudo apt-get -y install git

Asennuksen jälkeen pitää vielä antaa sähköposti ja nimi, jotta palvelu voi tunnistaa käyttäjän.

>  $ git config --global user.email "hannuharjoittelija@esimerkki.fi"

>  $ git config --global user.name "Hannu Harjoittelija"

Näihin kannattaa antaa oikea nimi, sillä se tulee näkymään kommenteissa, joita jätät.

Seuraavaksi annoin komennon, joka muistaa ulkoa salasanan tunnin ajan, jottei sitä tarvitse jatkuvasti kirjoittaa.

>  $ git config --global credential.helper "cache --timeout=3600"

### Varaston kloonaaminen virtuaalipalvelimelle.

Varaston kloonaaminen onnistuu yhdellä komennolla, joka on annettava tässä tapauksessa /srv/ hakemistossa.

>  $ sudo git clone https://github.com/hannu83/salt.git

Nyt varasto näkyy /srv/salt/ hakemistossa. Seuraavaksi siirsin tämän tiedoston kyseiseen hakemistoon ja lisäsin sen github:iin.

>   $ sudo cp /home/hannu/salt/week3.md /srv/salt/

### Gitin synkronisointi

Seuraavaksi annoin komennot, jolla sain synkronisoinnin tehtyä.

>   $ sudo git add .
>   $ sudo git commit
>   $ sudo git pull
>   $ sudo git push

Antaessasi komennon commit jätä ylimmälle riville yksi lause muutoksista. Tässä tapauksessa lisäsin "Added week3.md file". Ensimmäistä kertaa antaessasi push-komennon pitää samalla antaa tunnukset ja salasana github:iin.

## d) Näytä omalla salt-varastollasi esimerkit komennoista 'git log', 'git diff' ja 'git blame'. Selitä tulokset.

>   $ git log

>  commit 240df20610695d59e204e6bbcf8c45015c1b00a6 (HEAD -> master, origin/master, origin/HEAD)
>  Author: hannu83 <hannu.kankkunen1@gmail.com>
>  Date:   Sat Nov 10 06:47:11 2018 +0000

>  Added week3.md file

>  commit c79ea73647bc2e2b812335467a6465f6bee115ac
>  Author: hannu83 <hannu.kankkunen1@gmail.com>
>  Date:   Thu Nov 8 13:46:41 2018 +0000

>  Added files

>  commit fd4f5d943b7b6301dc725a606c4d942c23b4a361
>  Author: hannu83 <hannu.kankkunen1@gmail.com>
>  Date:   Thu Nov 8 13:45:27 2018 +0000

>  Added multiple files

>  commit bac98f607c20f3ab053a92a51ec1a6c0ab705090
>  Author: hannu83 <hannu.kankkunen1@gmail.com>
>  Date:   Thu Nov 8 13:43:12 2018 +0000

>  Added files

Tässä neljä viimeisintä muutosta lokista.

Author: käyttäjän nimi ja sähköpostiosoite
Date: päivämäärä ja aika jolloin muutokset on tehty.

  Kommentti

commit: hash-avain muutokselle

### git diff

Git diff näyttää muutokset halutusta tiedostosta. Tähän löytyi hyvä ohje osoitteesta [GIT tutorial](https://veerasundar.com/blog/2011/06/git-tutorial-comparing-files-with-diff/)

>  $ git diff week3.md

>  diff --git a/week3.md b/week3.md
>  index 07c4501..c73a22c 100644
>  --- a/week3.md
>  +++ b/week3.md
>  @@ -96,4 +96,10 @@ Date: päivämäärä ja aika jolloin muutokset on tehty.
>
>  commit: hash-avain muutokselle
>
>  +## git diff
>  +
>  +Git diff näyttää muutokset halutusta tiedostosta.
>  +
>  +>  $ git diff week3.md

Gitissä diff-komennossa 'head' viittaa paikalliseen tiedostoon ja vertaa tehtyjä muutoksia edellisen 'commit' komennon jälkeen tallennettuun versioon.

### git blame

Git blame on komento, jolla voidaan tutkia tiedostojen sisältöä rivi riviltä. Tämän avulla voidaan nähdä ketä on viimeiseksi käynyt muokkaamassa tiedostoa. Tutkin tiedostoa week3.md esimerkissä. Esimerkissä käytin '-L 1,3' jolloin blame komento tutki tiedoston kolmea ensimmäistä riviä. Tähän löytyi apua linkistä [Git blame Bitbucket](https://www.atlassian.com/git/tutorials/inspecting-a-repository/git-blame)

>  $ git blame -L 1,3 week3.md
>  
>  240df206 (hannu83 2018-11-10 06:47:11 +0000 1) # Palvelinten hallinta h3
>  240df206 (hannu83 2018-11-10 06:47:11 +0000 2)
>  240df206 (hannu83 2018-11-10 06:47:11 +0000 3) * a) Opiskele yllä aikataulussa olevat artikkelit. Noissa artikkeleissa opetetaan ne asiat, joilla läksyt saa tehtyä. Tätä a-kohdan lukutehtävää ei tarvitse raportoida. Luettava materiaali on kunkin tapaamiskerran kohdalla.

Mikäli joku muu kävisi muokkaamassa tiedoston kyseisiä rivejä, muodostuisi niille uusi hash, aika, päivämäärä sekä käyttäjän nimi jäisi näkyviin 'hannu83' tilalle.

## e) Tee tyhmä muutos gittiin, älä tee commit:tia. Tuhoa huonot muutokset 'git-reset hard'.

Git reset --hard komento tuhoaa kaikki muutokset kansiosta, jossa työskennellään viimeisimpään tilaan 'commit' komennon jälkeen. Tein muutoksia 'week3.md' tiedostoon ja tallensin sen. Tämän jälkeen tein hard reset:in ja tiedoston tila palasi normaaliksi. Hyviä ohjeita resetointiin [Git Reset Bitbucket](https://www.atlassian.com/git/tutorials/undoing-changes/git-reset).

>  $ git blame week3.md

>  00000000 (Not Committed Yet 2018-11-10 12:23:02 +0000   1) 9230842039842304823048fhjnaiskdfha9if8yas89fahsf# Palvelinten hallinta h3

Tuossa näkyi viimeisin muutos tekstiin. Tästä seuraavaksi resetointi.

>  $ sudo git reset --hard

Ja tiedostot palasivat ennalleen eikä muutoksia näkynyt.

## f) Tee uusi salt-moduli

fail2ban on ohjelma, joka auttaa suojaamaan palvelinta yhdestä ip-osoitteesta tulevia brute force hyökkäyksiä vastaan.

Asennus

>  $ sudo apt-get update

>  $ sudo apt-get -y install fail2ban

Tämän jälkeen otetaan kopiodaan jail.conf tiedostoksi jail.local. Jail.conf sisältää kaikki asetukset mutta sen päälle saatetaan kirjoittaa päivitysten yhteydessä. Fail2ban lukee jail.local tiedostosta asetukset paikallisesti. Tähän avuksi löytyi [How to harden a server with fail2ban](https://www.a2hosting.com/kb/security/hardening-a-server-with-fail2ban).

>  $ sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

Tein ainoastaan yhden muutokset, eli bannattava ip-osoite on 60 minuuttia bannattuna 10 minuutin sijasta. Tämä asetus löyty kohdasta [DEFAULT].

>  [DEFAULT]
>  bantime = 60m

Tämän jälkeen pitää fail2ban käynnistää uudelleen, jotta asetukset tulevat voimaan.

>  $ sudo systemctl restart fail2ban

Yleisimmät fail2ban komennot [fail2ban commands](https://www.fail2ban.org/wiki/index.php/Commands)

## fail2ban automatisointi salt:in avulla

Käytän pohjana tähän apachen asentamista saltin avulla, jonka tein edellisessä tehtävässä Karvisen Teron ohjeiden mukaan [Apache User Homepages Automatically](http://terokarvinen.com/2018/apache-user-homepages-automatically-salt-package-file-service-example).

Aloitin tekemällä hakemiston fail2ban asetus tiedostolle.

> $ sudo mkdir /srv/salt/fail2ban/

Ja kopioin sinne muokatun tiedoston.

> $ sudo cp /etc/fail2ban/jail.local /srv/salt/fail2ban/

Seuraavaksi loin fail2ban.sls tiedoston.

>  $ sudoedit /srv/salt/fail2ban.sls
>  
>  fail2ban:
>    pkg.installed
>  
>  /etc/fail2ban/jail.local:
>    file.managed:
>      - source: salt://fail2ban/jail.local
>  
>  fail2banservice:
>    service.running:
>      - name: fail2ban
>      - watch:
>        - file: /etc/fail2ban/jail.local

Ja lisäsin fail2ban top.sls.

> base:
>   '*':
>     - fail2ban

Ja lopuksi poistin koko fail2banin minionilta.

>   $ sudo apt-get purge fail2ban

>   $ rm -r /etc/fail2ban

Ja nyt ajoin uudelleen salt-masterilta fail2ban.

>  $ sudo salt '*' state.apply fail2ban
>  
>  acer5536:
>  ----------
>            ID: fail2ban
>      Function: pkg.installed
>        Result: True
>       Comment: The following packages were installed/updated: fail2ban
>       Started: 16:13:37.901261
>      Duration: 14784.45 ms
>       Changes:
>                ----------
>                fail2ban:
>                    ----------
>                    new:
>                        0.10.2-2
>                    old:
>  ----------
>            ID: /etc/fail2ban/jail.local
>      Function: file.managed
>        Result: True
>       Comment: File /etc/fail2ban/jail.local updated
>       Started: 16:13:52.695659
>      Duration: 283.171 ms
>       Changes:
>                ----------
>                diff:
>                    New file
>                mode:
>                    0644
>  ----------
>            ID: fail2banservice
>      Function: service.running
>          Name: fail2ban
>        Result: True
>       Comment: Service restarted
>       Started: 16:13:55.487300
>      Duration: 568.919 ms
>       Changes:
>                ----------
>                fail2ban:
>                    True
>  
>  Summary for acer5536

Fail2ban asentui ja käynnisti itsensä uudelleen, jotta asetukset otetaan jail.local tiedostosta. Homma kunnossa!
