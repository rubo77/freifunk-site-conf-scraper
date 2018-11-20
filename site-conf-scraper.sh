#!/bin/bash

mkdir -p tmp
cd tmp/
#[ -f site-rst ] || wget https://raw.githubusercontent.com/freifunk-gluon/gluon/master/docs/user/site.rst --output-document=site-rst
cat > site-rst << EOF
non-exhaus
* site-ffa <https://github.com/tecff/site-ffa>_ (Altdorf, Landshut & Umgebung)
* site-ffac <https://github.com/ffac/site>_ (Regio Aachen)
* site-ffbs <https://github.com/ffbs/site-ffbs>_ (Braunschweig)
* site-ffhb <https://github.com/FreifunkBremen/gluon-site-ffhb>_ (Bremen)
* site-ffda <https://github.com/freifunk-darmstadt/site-ffda>_ (Darmstadt)
* site-ffeh <https://github.com/freifunk-ehingen/site-ffeh>_ (Ehingen)
* site-fffl <https://github.com/freifunk-flensburg/site-fffl>_ (Flensburg)
* site-ffgoe <https://github.com/freifunk-goettingen/site-ffgoe>_ (Göttingen)
* site-ffgt-rhw <https://github.com/ffgtso/site-ffgt-rhw>_ (Guetersloh)
* site-ffhh <https://github.com/freifunkhamburg/site-ffhh>_ (Hamburg)
* site-ffho <https://git.c3pb.de/freifunk-pb/site-ffho.git>_ (Hochstift)
* site-ffhgw <https://github.com/lorenzo-greifswald/site-ffhgw>_ (Greifswald)
* site-ffka <https://github.com/ffka/site-ffka>_ (Karlsruhe)
* site-ffki <http://git.freifunk.in-kiel.de/ffki-site/>_ (Kiel)
* site-fflz <https://github.com/freifunk-lausitz/site-fflz>_ (Lausitz)
* site-ffl <https://github.com/freifunk-leipzig/freifunk-gluon-leipzig>_ (Leipzig)
* site-ffhl <https://github.com/freifunk-luebeck/site-ffhl>_ (Lübeck)
* site-fflg <https://github.com/kartenkarsten/site-fflg>_ (Lüneburg)
* site-ffmd <https://github.com/FreifunkMD/site-ffmd>_ (Magdeburg)
* site-ffmwu <https://github.com/freifunk-mwu/site-ffmwu>_ (Mainz, Wiesbaden & Umgebung)
* site-ffmyk <https://github.com/FreifunkMYK/site-ffmyk>_ (Mayen-Koblenz)
* site-ffm <https://github.com/freifunkMUC/site-ffm>_ (München)
* site-ffhmue <https://github.com/Freifunk-Muenden/site-conf>_ (Münden)
* site-ffms <https://github.com/FreiFunkMuenster/site-ffms>_ (Münsterland)
* site-neuss <https://github.com/ffne/site-neuss>_ (Neuss)
* site-ffnw <https://git.nordwest.freifunk.net/ffnw-firmware/siteconf/>_ (Nordwest)
* site-ffrgb <https://github.com/ffrgb/site-ffrgb>_ (Regensburg )
* site-ffrg <https://github.com/ffruhr/site-ffruhr>_ (Ruhrgebiet)
* site-ffs <https://github.com/freifunk-stuttgart/site-ffs>_ (Stuttgart)
* site-fftr <https://github.com/freifunktrier/site-fftr>_ (Trier)
EOF

grep non-exhaus site-rst -A999| while read l; do
	row="$(echo "$l"|sed -e 's/[*`<>_\]*//g')"
	site="$(echo "$row"|cut -d" " -f 2)"
	url="$(echo "$row"|cut -d" " -f 3)"
	region="$(echo "$row"|cut -d" " -f 4)"
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