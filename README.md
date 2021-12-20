# batman

This is an oh-my-zsh plugin, it does not work in normal bash.

Let batman repeat your command

with much wow

See the demo:

![Alt Text](https://raw.githubusercontent.com/txstc55/dogesay/master/dogesay.gif)

Install it by 
```bash
git clone https://github.com/FullstackGJJ/batmansay
mv batmansay path/to/oh-my-zsh/plugin/folder
```

Then in .zshrc, enable it by changing the line:

```
plugins=(... batmansay)
```

## Pre-Batman:

To enjoy the full colorful dogesay, you will need lolcat and figlet for this.

Check out lolcat at [here](https://github.com/busyloop/lolcat) and figlet at [here](http://www.figlet.org/)

The original lolcat is quite slow though, [here](https://github.com/jaseg/lolcat) is a c-implementation of lolcat that runs much faster, which I strongly recommand.

But it is ok if you do not want those two. Doge will check if you have lolcat or figlet for you, if you don't have it, it just simply doesn't use it.

You can, however, manually disable the use of lolcat or figlet. On line 22 and 25, you will see two options for lolcat and figlet. Set the one you want to disable to false and doge will not use it.

For better performance, I suggest turn of lolcat. It takes some time to turn doge into rainbow. (By a while I mean less than half a second but you will still notice it)

## More Batman Words:

If you want more words coming out of doge, go to dogesay.plugin.zsh, at the 4th line, just put in the word you want doge to spit at you into the list:

```bash
declare -a WOWARR=("YOUR" "OWN" "WORDS")
```

## Batman don't say
On line 8 of the dogesay.plugin.zsh, you can customize a list of commands you do not want doge to say a word about. Once doge detects that the command you input contains a word that you forbid him to say, he will not say.

Simply add the words like this:

```bash
declare -a NODOGE=("DOGE" "IGNORE" "THOSE" "COMMANDS")
```
REMEMBER TO CAPITALIZE THOSE WORDS OTHERWISE DOGE DOESN'T GIVE A FLYING PAN.

ENJOY!
```
                      Tb.          Tb.
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
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$p._.ggp._.d$$$$b
```
