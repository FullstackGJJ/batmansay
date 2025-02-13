## Welcome to use DOGESAY zsh plugin!

## words that doge say
declare -a WOWARR=("ALFRED,")
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
DOGE='                    Tb.          Tb.
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
                       :$$$$$$$$$$$$$^T$$$$$$$$$$P;       _____ _ __  __   ____       _______ __  __          _   _ _
                       :$$$$$$$$$$$$$b  "^T$$$$P` :      |_   _( )  \/  | |  _ \   /\|__   __|  \/  |   /\   | \ | | |
                       :$$$$$$$$$$$$$$b._.g$$$$$p.db       | | |/| \  / | | |_) | /  \  | |  | \  / |  /  \  |  \| | |
                       :$$$$$$$$$$$$$$$$$$$$$$$$$$$$;      | |   | |\/| | |  _ < / /\ \ | |  | |\/| | / /\ \ | . ` | |
                       :$$$$$$$$"""^^T$$$$$$$$$$$$P^;     _| |_  | |  | | | |_) / ____ \| |  | |  | |/ ____ \| |\  |_|
                       :$$$$$$$$       ""^^T$$$P^`  ;    |_____| |_|  |_| |____/_/    \_\_|  |_|  |_/_/    \_\_| \_(_)
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
    # WOWEMPTYLINECOUNT=$(( ( RANDOM % $(( 33 - 7*(($HISLEN + $WOWWORDLEN + 1)/10+1) )) )+1));
    WOWEMPTYLINECOUNT=12
    for i in {1..$WOWEMPTYLINECOUNT}
    do
      WOWEMPTYLINE="$WOWEMPTYLINE\n"
    done;
    WOWGAP="";
    # for i in {0..$((  RANDOM % 30 ))}
    for i in {0..$((  15 ))}
    do
      WOWGAP="$WOWGAP "
    done;
    WOWGAPEACHLINE=""
    for i in {1..33}
    do
      WOWGAPEACHLINE="$WOWGAPEACHLINE$WOWGAP\n"
    done;
    # echo $DOGE| column -s $'\t' -t| if $USERLETLOLCAT&&$SYSALLOWLOLCAT; then lolcat; else cat;fi
    # echo "$WOWWORD $HISL NOW!"| if $USERLETFIGLET&&$SYSALLOWFIGLET; then figlet -f big; else cat;fi| if $USERLETLOLCAT&&$SYSALLOWLOLCAT; then lolcat; else cat;fi
    # paste <(echo $DOGE) <(echo $WOWGAPEACHLINE) <(echo $WOWEMPTYLINE; echo "$WOWWORD $HISL NOW!"|if $USERLETFIGLET&&$SYSALLOWFIGLET; then figlet -f big; else cat;fi)| column -s $'\t' -t|if $USERLETLOLCAT&&$SYSALLOWLOLCAT; then lolcat; else cat;fi
    # paste <(echo $DOGE) <(echo $WOWGAPEACHLINE) <(echo $WOWEMPTYLINE; echo "I'M BATMAN!"|if $USERLETFIGLET&&$SYSALLOWFIGLET; then figlet -f big; else cat;fi)| column -s $'\t' -t|if $USERLETLOLCAT&&$SYSALLOWLOLCAT; then lolcat; else cat;fi
    echo $DOGE
  fi
}

preexec_functions+=(DOGE_MAGIC)


