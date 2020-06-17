#!/bin/bash
# Here you can define translations to be used in the plugin functions file
# the below code is an sample to be reused:
# 1) uncomment to function below
# 2) replace XXX by your plugin name (short)
# 3) remove and add your own translations
# 4) you can the arguments $2, $3 passed to this function
# 5) in your plugin functions.sh file, use it like this:
#      say "$(pv_myplugin_lang the_answer_is "oui")"
#      => Jarvis: La réponse est oui

#pv_XXX_lang () {
#    case "$1" in
#        i_check) echo "Je regarde...";;
#        the_answer_is) echo "La réponse est $2";;
#    esac
#} 

fct_conv () {

test_math $1
convertchiffre=$conv
}


test_math () {
conv=" "
if [[ $1 =~ "zéro" ]] ; then
conv=0
fi

if [[ $1 =~ "un" ]] ; then
conv=1
fi

if [[ $1 =~ "de" ]] ; then
conv=2
fi

if [[ $1 =~ "trois" ]] ; then
conv=3
fi

if [[ $1 =~ "quatre" ]] ; then
conv=4
fi

if [[ $1 =~ "cinq" ]] ; then
conv=5
fi

if [[ $1 =~ "six" ]] ; then
conv=6
fi

if [[ $1 =~ "sept" ]] ; then
conv=7
fi

if [[ $1 =~ "huit" ]] ; then
conv=8
fi

if [[ $1 =~ "neuf" ]] ; then
conv=9
fi

if [[ $conv == " " ]] ; then
conv=$1

fi
return
}


fct_matosutil() {

if [ -e ~/madeofstock/matosutilise.txt ]
then
    rm ~/madeofstock/matosutilise.txt
fi


if [ -e ~/madeofstock/fourchettes.txt ] && [ $(cat ~/madeofstock/fourchettes.txt) != 0 ]
then
    fourchettesutilisees="$(cat ~/madeofstock/fourchettes.txt) fourchettes"
else
    fourchettesutilisees=""
fi


if [ -e ~/madeofstock/cuilleres.txt ] && [ $(cat ~/madeofstock/cuilleres.txt) != 0 ]
then
    cuilleresutilisees="$(cat ~/madeofstock/cuilleres.txt) cuilleres"
else
    cuilleresutilisees=""
fi





echo $fourchettesutilisees $cuilleresutilisees > ~/madeofstock/matosutilise.txt

#if [ ! -s $~/madeofstock/matosutilise.txt ]
#then
#    echo "Je n'ai enregistré aucun matériel utilisé pour le moment." > ~/madeofstock/matosutilise.txt
#fi


}
