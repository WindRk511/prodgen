conv_ptype () {
	case $1 in
		1) echo -n "Cereale," ;;
        	2) echo -n "Legumineux," ;;
        	3) echo -n "Fruit," ;;
        	4) echo -n "Legume," ;;
        	5) echo -n "Tubercule," ;;
       		6) echo -n "Racine," ;;
        	*) echo -n "INDEFINIT," ;;
	esac
}

conv_psol () {
case $1 in
        1) echo -n "Sol sableux," ;;
        2) echo -n "Sol argileux," ;;
        3) echo -n "Sol limoneux," ;;
        4) echo -n "Sol humifère (ou organique)," ;;
        5) echo -n "humide" ;;
        6) echo -n "Aquatique" ;;
        7) echo -n "Meuble" ;;
        8) echo -n "Riche" ;;
        9) echo -n "Vaseux" ;;
        10) echo -n "Léger" ;;
        11) echo -n "Drainé" ;;
        *) echo -n "INDEFINIT," ;;
esac
}

conv_psaison () {
case $1 in
        1) echo -n "froid," ;; 
        2) echo -n "chaud," ;; 
        3) echo -n "pluie," ;; 
        4) echo -n "sec," ;;
        5) echo -n "tempéré," ;;
        *) echo -n "INDEFINIT," ;;
esac
}

conv_pmois () {
case $1 in
	1) echo -n "Janvier," ;;
        2) echo -n "Fevrier," ;;
        3) echo -n "Mars," ;;
        4) echo -n "Avril," ;;
        5) echo -n "Mais," ;;
        6) echo -n "Juin," ;;
        7) echo -n "Juillet," ;; 
        8) echo -n "Août," ;;
        9) echo -n "Septembre," ;;
        10) echo -n "Octobre," ;;
        11) echo -n "Novembre," ;;
        12) echo -n "Decembre," ;;
	*) ;;
esac
}
