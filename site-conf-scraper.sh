#!/bin/bash

mkdir -p tmp
cd tmp/
# from https://github.com/freifunk-gluon/gluon/wiki/Site-Configurations/_edit
cat > site-rst << EOF
This is a non-exhaustive list of site-repos from various communities
- [site-ffa](https://github.com/tecff/site-ffa) (Altdorf, Landshut & Umgebung)
- [site-ffac](https://github.com/ffac/site) (Regio Aachen)
- [site-ffbs](https://github.com/ffbs/site-ffbs) (Braunschweig)
- [site-ffhb](https://github.com/FreifunkBremen/gluon-site-ffhb) (Bremen)
- [site-ffc](https://gitlab.com/FreifunkChemnitz/site-ffc) (Chemnitz)
- [site-ffda](https://git.darmstadt.ccc.de/ffda/site) (Darmstadt)
- [site-ff3l](https://github.com/ff3l/site-ff3l) (Dreiländereck)
- [site-ffeh](https://github.com/freifunk-ehingen/site-ffeh) (Ehingen)
- [site-fffl](https://github.com/freifunk-flensburg/site-fffl) (Flensburg)
- [site-ffgoe](https://github.com/freifunk-goettingen/site-ffgoe) (Göttingen)
- [site-ffgt-rhw](https://github.com/ffgtso/site-ffgt-rhw) (Guetersloh)
- [site-ffhh](https://github.com/freifunkhamburg/site-ffhh) (Hamburg)
- [site-ffho](https://git.ffho.net/freifunkhochstift/ffho-site) (Hochstift)
- [site-ffhgw](https://github.com/lorenzo-greifswald/site-ffhgw) (Greifswald)
- [site-ffka](https://github.com/ffka/site-ffka) (Karlsruhe)
- [site-ffki](https://git.freifunk.in-kiel.de/ffki-site/) (Kiel)
- [site-fflz](https://github.com/freifunk-lausitz/site-fflz) (Lausitz)
- [site-ffl](https://github.com/freifunk-leipzig/freifunk-gluon-leipzig) (Leipzig)
- [site-ffhl](https://github.com/freifunk-luebeck/site-ffhl) (Lübeck)
- [site-fflg](https://github.com/kartenkarsten/site-fflg) (Lüneburg)
- [site-ffmd](https://github.com/FreifunkMD/site-ffmd) (Magdeburg)
- [site-ffmwu](https://github.com/freifunk-mwu/sites-ffmwu) (Mainz, Wiesbaden & Umgebung)
- [site-ffmyk](https://github.com/FreifunkMYK/site-ffmyk) (Mayen-Koblenz)
- [site-ffmo](https://github.com/ffruhr/site-ffmo) (Moers)
- [site-ffmg](https://github.com/ffruhr/site-ffmg) (Mönchengladbach)
- [site-ffm](https://github.com/freifunkMUC/site-ffm) (München)
- [site-ffhmue](https://github.com/Freifunk-Muenden/site-conf) (Münden)
- [site-ffms](https://github.com/FreiFunkMuenster/site-ffms) (Münsterland)
- [site-neuss](https://github.com/ffne/site-neuss) (Neuss)
- [site-ffniers](https://github.com/ffruhr/site-ffniers) (Niersufer)
- [site-nord](https://github.com/Freifunk-Nord/nord-site) (Freifunk Nord)
- [site-ffndh](https://github.com/freifunk-nordheide/ffnordheide/tree/ffnh-lede/ffndh-site) (Nordheide)
- [site-ffnw](https://git.nordwest.freifunk.net/ffnw-firmware/siteconf/tree/master) (Nordwest)
- [site-ffrgb](https://github.com/ffrgb/site-ffrgb) (Regensburg)
- [site-ffrn](https://github.com/Freifunk-Rhein-Neckar/site-ffrn) (Rhein-Neckar)
- [site-ffruhr](https://github.com/ffruhr?utf8=✓&query=site) (Ruhrgebiet, Multi-Communities)
- [site-ffs](https://github.com/freifunk-stuttgart/site-ffs) (Stuttgart)
- [site-fftr](https://github.com/freifunktrier/site-fftr) (Trier)
- [site-fffd](https://git.maglab.space/fffd/site-fffd) (Fulda)
EOF

grep non-exhaustive site-rst -A999|grep -v exhaustive| while read l; do
	row="$(echo "$l"|sed  's/[][\(\)]/ /g')"
	site="$(echo "$row"|cut -d" " -f 3)"
	url="$(echo "$row"|cut -d" " -f 5)"
	region="$(echo "$row"|cut -d" " -f 8-99)"
	echo "$row"
	echo "$url - $site - $region"
	[ -d "$site" ] || git clone $url "$site"
	#mkdir "$site"
	#https://github.com/freifunkhamburg/site-ffhh
	#https://raw.githubusercontent.com/freifunkhamburg/site-ffhh/master/site.conf
	#sitefile="$(echo -n $url|sed s/github.com/raw.githubusercontent.com/g; echo "/master/site.conf")"
	#modules="$(echo -n $url|sed s/github.com/raw.githubusercontent.com/g; echo "/master/modules")"
	#sitemk="$(echo -n $url|sed s/github.com/raw.githubusercontent.com/g; echo "/master/site.mk")"
	#wget $sitefile  --output-document="$site/site.conf"
	#wget $modules  --output-document="$site/modules"
	#wget $sitemk  --output-document="$site/site.mk"
	#cat "$site/site.conf"
	if [ -f "$site/modules" ]; then
	  repos=$(grep REPO= $site/modules)
	 	for l in $repos; do
	 		repo="$(echo $l|sed 's/^.*=//g')";
	 		name="$(echo $l|sed 's/=.*$//g')";
	 		mkdir -p $site/package-repos/
	 	 	git clone $repo $site/package-repos/$name;
	 	done
	fi
done

#TODO:
#einen json string erstellen und mit jq füllen
# webinterface zum anzeigen und bewerten der pakete
