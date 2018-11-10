# Palvelinten hallinta h3

* a) Opiskele yllä aikataulussa olevat artikkelit. Noissa artikkeleissa opetetaan ne asiat, joilla läksyt saa tehtyä. Tätä a-kohdan lukutehtävää ei tarvitse raportoida. Luettava materiaali on kunkin tapaamiskerran kohdalla.

* b) MarkDown. Tee tämän tehtävän raportti MarkDownina. Helpointa on tehdä raportti samaan GitHub-varastoon kuin Salt-modulit. Tiedostoon .md-pääte. Tyhjä rivi tekee kappalejaon, risuaita ‘#’ tekee otsikon, sisennys merkitsee koodinpätkän.
* c) Laita /srv/salt/ gittiin. Tee uusi moduli. Kloonaa varastosi toiselle koneelle (tai poista /srv/salt ja palauta se kloonaamalla) ja jatka sillä.
* d) Näytä omalla salt-varastollasi esimerkit komennoista ‘git log’, ‘git diff’ ja ‘git blame’. Selitä tulokset.
* e) Tee tyhmä muutos gittiin, älä tee commit:tia. Tuhoa huonot muutokset ‘git reset –hard’. Huomaa, että tässä toiminnossa ei ole peruutusnappia.
* f) Tee uusi salt-moduli. Voit asentaa ja konfiguroida minkä vain uuden ohjelman: demonin, työpöytäohjelman tai komentokehotteesta toimivan ohjelman. Käytä tarvittaessa ‘find -printf “%T+ %p\n”|sort’ löytääksesi uudet asetustiedostot.

Tehtävät tehdään omalla Windows 10 x64 pc pöytäkoneellani, jossa on Intel i7-4790K prosessori, 16 gigatavua keskusmuistia, MSI 1080 ti näytönohjain sekä viimeisin Windows päivitys (17134.345). Itse tehtävät hoidetaan putty:n versio 0.67 ssh:n välityksellä virtuaalipalvelimeeni, joka on vuokrattu Digital Oceanin kautta.

## b) Tämä tehtävä tehdään markdown muodossa ja tieto tallennettiin /srv/salt/ hakemistoon ja sieltä github varastoon.

## c) /srv/salt/ gittiin.

/srv/salt/ on jo gitissä, joten aloitin poistamalla sen koneelta ja lataamalla sen uudelleen. Ensin kuitenkin otin varmuuskopion toiseen hakemistoon koko salt-kansiosta.
> $ sudo cp -r /srv/salt/ /home/hannu/salt/

Ja poistin alkuperäisen saltin

> $ sudo rm -r /srv/salt/
 
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

Nyt varasto näkyy /srv/salt hakemistossa. Seuraavaksi siirsin tämän tiedoston kyseiseen hakemistoon ja lisäsin sen github:iin.

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

commit 240df20610695d59e204e6bbcf8c45015c1b00a6 (HEAD -> master, origin/master, origin/HEAD)
Author: hannu83 <hannu.kankkunen1@gmail.com>
Date:   Sat Nov 10 06:47:11 2018 +0000

    Added week3.md file

commit c79ea73647bc2e2b812335467a6465f6bee115ac
Author: hannu83 <hannu.kankkunen1@gmail.com>
Date:   Thu Nov 8 13:46:41 2018 +0000

    Added files

commit fd4f5d943b7b6301dc725a606c4d942c23b4a361
Author: hannu83 <hannu.kankkunen1@gmail.com>
Date:   Thu Nov 8 13:45:27 2018 +0000

    Added multiple files

commit bac98f607c20f3ab053a92a51ec1a6c0ab705090
Author: hannu83 <hannu.kankkunen1@gmail.com>
Date:   Thu Nov 8 13:43:12 2018 +0000

    Added files

Tässä neljä viimeisintä muutosta lokista.

Author: käyttäjän nimi ja sähköpostiosoite
Date: päivämäärä ja aika jolloin muutokset on tehty.

  Kommentti

commit: hash-avain muutokselle

### git diff

Git diff näyttää muutokset halutusta tiedostosta. Tähän löytyi hyvä ohje osoitteesta [GIT tutorial](https://veerasundar.com/blog/2011/06/git-tutorial-comparing-files-with-diff/)

>  $ git diff week3.md

diff --git a/week3.md b/week3.md
index 07c4501..c73a22c 100644
--- a/week3.md
+++ b/week3.md
@@ -96,4 +96,10 @@ Date: päivämäärä ja aika jolloin muutokset on tehty.

 commit: hash-avain muutokselle

+## git diff
+
+Git diff näyttää muutokset halutusta tiedostosta.
+
+>  $ git diff week3.md

Gitissä diff-komennossa 'head' viittaa paikalliseen tiedostoon ja vertaa tehtyjä muutoksia edellisen 'commit' komennon jälkeen tallennettuun versioon.

### git blame

Git blame on komento, jolla voidaan tutkia tiedostojen sisältöä rivi riviltä. Tämän avulla voidaan nähdä ketä on viimeiseksi käynyt muokkaamassa tiedostoa. Tutkin tiedostoa week3.md esimerkissä. Esimerkissä käytin '-L 1,3' jolloin blame komento tutki tiedoston kolmea ensimmäistä riviä. Tähän löytyi apua linkistä [Atlassian Bitbucket Git blame] (https://www.atlassian.com/git/tutorials/inspecting-a-repository/git-blame)

>  $ git blame -L 1,3 week3.md

240df206 (hannu83 2018-11-10 06:47:11 +0000 1) # Palvelinten hallinta h3
240df206 (hannu83 2018-11-10 06:47:11 +0000 2)
240df206 (hannu83 2018-11-10 06:47:11 +0000 3) * a) Opiskele yllä aikataulussa olevat artikkelit. Noissa artikkeleissa opetetaan ne asiat, joilla läksyt saa tehtyä. Tätä a-kohdan lukutehtävää ei tarvitse raportoida. Luettava materiaali on kunkin tapaamiskerran kohdalla.

Mikäli joku muu kävisi muokkaamassa tiedoston kyseisiä rivejä, muodostuisi niille uusi hash, aika, päivämäärä sekä käyttäjän nimi jäisi näkyviin 'hannu83' tilalle.

## e) Tee tyhmä muutos gittiin, älä tee commit:tia. Tuhoa huonot muutokset 'git-reset hard'.

