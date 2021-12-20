## Welcome to use DOGESAY zsh plugin!

## words that doge say
declare -a WOWARR=("AIEEE!" "AIIEEE!" "ARRRGH!" "AWK!" "AWKKKKKK!" "BAM!" "BANG!" "BANG-ETH!" "BAP!" "BIFF!" "BLOOP!" "BLURP!" "BOFF!" "BONK!" "CLANK!" "CLANGE!" "CLANK-EST!" "CLASH!" "CLUNK!" "CLUNK-ETH!" "CRAAACK!" "CRASH!" "CRRAAACK!" "CRUNCH!" "CRUNCH-ETH!" "EEE-YOW!" "FLRBBBBB!" "GLIPP!" "GLURPP!" "KAPOW!" "KAYO!" "KER-PLOP!" "KER-SPLOOSH!" "KLONK!" "KRUNCH!" "OOOFF!" "OOOOFF!" "OUCH!" "OUCH-ETH!" "OWWW!" "OW-ETH!" "PAM!" "PLOP!" "POW!" "POWIE!" "QUNCKKK!" "RAKKK!" "RIP!" "SLOSH!" "SOCK!" "SPLAAT!" "SPLATT!" "SPLOOSH!" "SWAAP!" "SWISH!" "SWOOSH!" "THUNK!" "THWACK!" "THWACKEL!" "THWAPE!" "THWAPP!" "TOUCHÉ!" "UGGH!" "URKK!" "URKKK!" "VRONK!" "WHACK!" "WHACK-ETH!" "WHAM-ETH!" "WHAMM!" "WHAMMM!" "WHAP!" "ZAM!" "ZAMM!" "ZAMMM!" "ZAP!" "ZAP-ETH" "ZGRUPPP!" "ZLONK!" "ZLOPP!" "ZLOTT!" "ZOK!" "ZOWIE!" "ZWAPP!" "Z-ZWAP!" "Z-Z-Z-Z-WAP!" "ZZZZZWAP!")
WOWARRLEN=${#WOWARR[@]}

## A list of element that doge should not say a word about
declare -a NODOGE=("CMAKE" "MAKE" "CLEAR" "WOW" "EXIT" "./")

## doge check what he should not say
containsElement () {
	for i in "${NODOGE[@]}"
	do
		if [[ $1 =~ $i ]]
		then
			return 0
		fi
	done
	return 1
}
## disable or enable the use of lolcat here
USERLETLOLCAT=true
SYSALLOWLOLCAT=true; if ! type "lolcat" > /dev/null; then SYSALLOWLOLCAT=false;fi
## disable or enable the use of figlet here
USERLETFIGLET=true
SYSALLOWFIGLET=true; if ! type "figlet" > /dev/null; then SYSALLOWFIGLET=false;fi
## the master himself
DOGE='                     Tb.          Tb.
                     :$$b.        $$$b.
                     :$$$$b.      :$$$$b.
                     :$$$$$$b     :$$$$$$b
                      $$$$$$$b     $$$$$$$b
                      $$$$$$$$b    :$$$$$$$b
                      :$$$$$$$$b---^$$$$$$$$b
                      :$$$$$$$$$b        ""^Tb
                       $$$$$$$$$$b    __...__`.
                       $$$$$$$$$$$b.g$$$$$$$$$pb
                       $$$$$$$$$$$$$$$$$$$$$$$$$b
                       $$$$$$$$$$$$$$$$$$$$$$$$$$b
                       :$$$$$$$$$$$$$$$$$$$$$$$$$$;
                       :$$$$$$$$$$$$$^T$$$$$$$$$$P;
                       :$$$$$$$$$$$$$b  "^T$$$$P` :
                       :$$$$$$$$$$$$$$b._.g$$$$$p.db
                       :$$$$$$$$$$$$$$$$$$$$$$$$$$$$;
                       :$$$$$$$$"""^^T$$$$$$$$$$$$P^;
                       :$$$$$$$$       ""^^T$$$P^`  ;
                       :$$$$$$$$    .`       `"     ;
                       $$$$$$$$;   /                :
                       $$$$$$$$;           .----,   :
                       $$$$$$$$;         ,"          ;
                       $$$$$$$$$p.                   |
                      :$$$$$$$$$$$$p.                :
                      :$$$$$$$$$$$$$$$p.            .`
                      :$$$$$$$$$$$$$$$$$$p...___..-"
                      $$$$$$$$$$$$$$$$$$$$$$$$$;
   .db.          bug  $$$$$$$$$$$$$$$$$$$$$$$$$$
  d$$$$bp.            $$$$$$$$$$$$$$$$$$$$$$$$$$;
 d$$$$$$$$$$pp..__..gg$$$$$$$$$$$$$$$$$$$$$$$$$$$
d$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$p._            .gp.
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$p._.ggp._.d$$$$b'

## the doge magic

DOGE_MAGIC(){
  HIS="$(tail -n 1 $HOME/.zsh_history)";
  HISL="$(cut -d";" -f2 <<<$HIS|tr a-z A-Z)";
  HISLEN=${#HISL};
  if containsElement $HISL
  then
  else
    WOWEMPTYLINE="";
    WOWPREIND=$(( ( RANDOM % $WOWARRLEN )  + 1 ));
    WOWWORD=$WOWARR[$WOWPREIND];
    WOWWORDLEN=${#WOWWORD};
    WOWEMPTYLINECOUNT=$(( ( RANDOM % $(( 48 - 7*(($HISLEN + $WOWWORDLEN + 1)/10+1) )) )+1));
    for i in {1..$WOWEMPTYLINECOUNT}
    do
      WOWEMPTYLINE="$WOWEMPTYLINE\n"
    done;
    WOWGAP="";
    for i in {0..$((  RANDOM % 30 ))}
    do
      WOWGAP="$WOWGAP "
    done;
    WOWGAPEACHLINE=""
    for i in {1..48}
    do
      WOWGAPEACHLINE="$WOWGAPEACHLINE$WOWGAP\n"
    done;
    paste <(echo $DOGE) <(echo $WOWGAPEACHLINE) <(echo $WOWEMPTYLINE; echo "$WOWWORD $HISL"|if $USERLETFIGLET&&$SYSALLOWFIGLET; then figlet; else cat;fi)| column -s $'\t' -t|if $USERLETLOLCAT&&$SYSALLOWLOLCAT; then lolcat; else cat;fi
  fi
}

preexec_functions+=(DOGE_MAGIC)


