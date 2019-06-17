#!/bin/bash
YELLOW="\033[1;33m"; RED="\033[0;31m"; ENDCOLOR="\033[0m"
mkdir -p tmp
cd tmp/
# from https://github.com/freifunk-gluon/gluon/wiki/Site-Configurations/_edit
cat > site-rst << EOF
- [site-ffruhr](https://github.com/ffruhr?utf8=✓&query=site) (Ruhrgebiet, Multi-Communities)
- [ffruhr-site-ffrgwest](https://github.com/ffruhr/site-ffrgwest) (site-ffrgwest)
- [ffruhr-site-ffkleve](https://github.com/ffruhr/site-ffkleve) (site-ffkleve)
- [ffruhr-site-ffkkar](https://github.com/ffruhr/site-ffkkar) (site-ffkkar)
- [ffruhr-site-ffkev](https://github.com/ffruhr/site-ffkev) (site-ffkev)
- [ffruhr-site-ffhnx](https://github.com/ffruhr/site-ffhnx) (site-ffhnx)
- [ffruhr-site-ffher](https://github.com/ffruhr/site-ffher) (site-ffher)
- [ffruhr-site-ffgoch](https://github.com/ffruhr/site-ffgoch) (site-ffgoch)
- [ffruhr-site-ffgel](https://github.com/ffruhr/site-ffgel) (site-ffgel)
- [ffruhr-site-fffl](https://github.com/ffruhr/site-fffl) (site-fffl)
- [ffruhr-site-ffemm](https://github.com/ffruhr/site-ffemm) (site-ffemm)
- [ffruhr-site-ffbgh](https://github.com/ffruhr/site-ffbgh) (site-ffbgh)
- [ffruhr-site-ffalpen](https://github.com/ffruhr/site-ffalpen) (site-ffalpen)
- [ffruhr-site-ffstr](https://github.com/ffruhr/site-ffstr) (site-ffstr)
- [ffruhr-site-ffwawa](https://github.com/ffruhr/site-ffwawa) (site-ffwawa)
- [ffruhr-website-stuff](https://github.com/ffruhr/website-stuff) (website-stuff)
- [ffruhr-ffapi" itemprop](https://github.com/ffruhr/ffapi" itemprop) (ffapi" itemprop)
- [ffruhr-site-ffmg](https://github.com/ffruhr/site-ffmg) (site-ffmg)
- [ffruhr-fastdbl" itemprop](https://github.com/ffruhr/fastdbl" itemprop) (fastdbl" itemprop)
- [ffruhr-site-ffxan](https://github.com/ffruhr/site-ffxan) (site-ffxan)
- [ffruhr-site-ffwze](https://github.com/ffruhr/site-ffwze) (site-ffwze)
- [ffruhr-site-ffwes](https://github.com/ffruhr/site-ffwes) (site-ffwes)
- [ffruhr-site-ffrees](https://github.com/ffruhr/site-ffrees) (site-ffrees)
- [ffruhr-site-ffkra](https://github.com/ffruhr/site-ffkra) (site-ffkra)
- [ffruhr-ffrg-packages](https://github.com/ffruhr/ffrg-packages) (ffrg-packages)
- [ffruhr-site-ffniers](https://github.com/ffruhr/site-ffniers) (site-ffniers)
- [ffruhr-site-ffmo](https://github.com/ffruhr/site-ffmo) (site-ffmo)
- [ffruhr-site-ffel](https://github.com/ffruhr/site-ffel) (site-ffel)
- [ffruhr-site-ffruhr](https://github.com/ffruhr/site-ffruhr) (site-ffruhr)
- [ffruhr-ffruhr-srv](https://github.com/ffruhr/ffruhr-srv) (ffruhr-srv)
- [ffruhr-site-ffen](https://github.com/ffruhr/site-ffen) (site-ffen)

- [site-ffndh](https://github.com/freifunk-nordheide/ffnordheide/tree/ffnh-lede/ffndh-site) (Nordheide)
- [site-ffa](https://github.com/tecff/site-ffa) (Altdorf, Landshut & Umgebung)
- [site-ffac](https://github.com/ffac/site) (Regio Aachen)
- [site-ffbs](https://gitli.stratum0.org/ffbs/ffbs-site) (Braunschweig)
- [site-ffhb](https://github.com/FreifunkBremen/gluon-site-ffhb) (Bremen)
- [site-ffc](https://gitlab.com/FreifunkChemnitz/site-ffc) (Chemnitz)
- [site-ffda](https://git.darmstadt.ccc.de/ffda/site) (Darmstadt)
- [site-ff3l](https://github.com/ff3l/site-ff3l) (Dreiländereck)
- [site-fffl](https://github.com/freifunk-flensburg/site-fffl) (Flensburg)
- [site-ffgoe](https://github.com/freifunk-goettingen/site-ffgoe) (Göttingen)
- [site-ffhh](https://github.com/freifunkhamburg/site-ffhh) (Hamburg)
- [site-ffh](https://github.com/freifunkh/site) (Hannover)
- [site-ffho](https://git.ffho.net/freifunkhochstift/ffho-site) (Hochstift)
- [site-ffhgw](https://github.com/Freifunk-Greifswald/site-ffhgw) (Greifswald)
- [site-ffka](https://github.com/ffka/site-ffka) (Karlsruhe)
- [site-ffki](https://git.freifunk.in-kiel.de/ffki-site/) (Kiel)
- [site-fflz](https://github.com/freifunk-lausitz/site-fflz) (Lausitz)
- [site-ffl](https://github.com/freifunk-leipzig/freifunk-gluon-leipzig) (Leipzig)
- [site-ffhl](https://github.com/freifunk-luebeck/site-ffhl) (Lübeck)
- [site-fflg](https://github.com/kartenkarsten/site-fflg) (Lüneburg)
- [site-ffmd](https://github.com/FreifunkMD/site-ffmd) (Magdeburg)
- [site-ffmwu](https://github.com/freifunk-mwu/site-ffmwu) (Mainz, Wiesbaden & Umgebung)
- [site-ffmyk](https://github.com/FreifunkMYK/site-ffmyk) (Mayen-Koblenz)
- [site-ffmo](https://github.com/ffruhr/site-ffmo) (Moers)
- [site-ffmg](https://github.com/ffruhr/site-ffmg) (Mönchengladbach)
- [site-ffm](https://github.com/freifunkMUC/site-ffm) (München)
- [site-ffhmue](https://github.com/Freifunk-Muenden/site-conf) (Münden)
- [site-ffms](https://github.com/FreiFunkMuenster/site-ffms) (Münsterland)
- [site-neuss](https://github.com/ffne/site-neuss) (Neuss)
- [site-ffniers](https://github.com/ffruhr/site-ffniers) (Niersufer)
- [site-nord](https://github.com/Freifunk-Nord/nord-site) (Freifunk Nord)
- [site-ffnw](https://git.nordwest.freifunk.net/ffnw-firmware/siteconf/) (Nordwest)
- [site-ffrgb](https://github.com/ffrgb/site-ffrgb) (Regensburg)
- [site-ffrn](https://github.com/Freifunk-Rhein-Neckar/site-ffrn) (Rhein-Neckar)
- [site-ffs](https://github.com/freifunk-stuttgart/site-ffs) (Stuttgart)
- [site-fftr](https://github.com/freifunktrier/site-fftr) (Trier)
- [site-fffd](https://git.maglab.space/fffd/site-fffd) (Fulda)
EOF

grep -v exhaustive site-rst | while read l; do
	row="$(echo "$l"|sed  's/[][\(\)]/ /g')"
	site="$(echo "$row"|cut -d" " -f 3)"
	region="$(echo "$row"|cut -d" " -f 8-99)"
	url="$(echo "$row"|cut -d" " -f 5)"
	if [[ "$url" == *"/tree/"* ]]; then
		url="$(echo "$url" | cut -d"/" -f1-5)"
		subfolder_or_branch="$(echo "$url" | cut -d"/" -f8-99)"
		# TODO: search only in subfolder
	fi
	
	echo  $YELLOW"$row"$ENDCOLOR
	echo -e $YELLOW"$site - $region - $url"$ENDCOLOR
	if [ -d "$site" ]; then
		echo -e "directory exists "
	else
		echo -e $YELLOW"cloning... "$ENDCOLOR
		git clone $url "$site"
		status="$?"
		if [ "$status" != "0" ]; then
			echo -e $RED"$site failed with status $status"$ENDCOLOR
		fi
	fi
	
	cd "$site"
	echo -e $YELLOW"pull $repo ..."$ENDCOLOR
	git pull
	cd -
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
		echo -e $YELLOW"cloning modules... "$ENDCOLOR
	  repos=$(grep REPO= $site/modules)
	 	for l in $repos; do
	 		repo="$(echo $l|sed 's/^.*=//g')";
	 		name="$(echo $l|sed 's/=.*$//g')";
	 		mkdir -p $site/package-repos/
			module_repodir=$site/package-repos/$name
			echo -e $YELLOW"module cloning $repo $module_repodir ..."$ENDCOLOR
			if [ -d "$site" ]; then
				echo -e "directory exists "
			else
				git clone $repo $module_repodir;
				if [ "$?" == "0" ]; then
					echo -e $RED"$site failed"$ENDCOLOR
				fi
			fi
	 	done
	fi
done

#TODO:
#einen json string erstellen und mit jq füllen
# webinterface zum anzeigen und bewerten der pakete
