#!/bin/sh

# Input arguments
echo "$1";

# Read all config data that is available in ~.git
# git config -l

echo $( git config --get remote.origin.url );

fmt='
        r=%(refname)
        t=%(*objecttype)
        T=${r#refs/tags/}

        o=%(*objectname)
        n=%(*authorname)
        e=%(*authoremail)
        s=%(*subject)
        d=%(*authordate)
        b=%(*body)

        kind=Tag
        if test "z$t" = z
        then
                # could be a lightweight tag
                t=%(objecttype)
                kind="Lightweight tag"
                o=%(objectname)
                n=%(authorname)
                e=%(authoremail)
                s=%(subject)
                d=%(authordate)
                b=%(body)
        fi
        echo "$kind $T points at a $t object $o"
        if test "z$t" = zcommit
        then
                echo "The commit was authored by $n $eat $d, and titled $s
Its message reads as:
"
                echo "$b" | sed -e "s/^/    /"
                echo
        fi
'

eval=`git for-each-ref --shell --format="$fmt" \
        --sort='*objecttype' \
        --sort=-taggerdate \
        refs/tags`
eval "$eval"