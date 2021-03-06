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



# Convertion des chiffres lettrés en nombres.
test_math () {
convertchiffre=" "
if [[ $1 =~ "zéro" ]] ; then
convertchiffre=0
fi

if [[ $1 =~ "un" ]] ; then
convertchiffre=1
fi

if [[ $1 =~ "de" ]] ; then
convertchiffre=2
fi

if [[ $1 =~ "trois" ]] ; then
convertchiffre=3
fi

if [[ $1 =~ "quatre" ]] ; then
convertchiffre=4
fi

if [[ $1 =~ "cinq" ]] ; then
convertchiffre=5
fi

if [[ $1 =~ "six" ]] ; then
convertchiffre=6
fi

if [[ $1 =~ "sept" ]] ; then
convertchiffre=7
fi

if [[ $1 =~ "huit" ]] ; then
convertchiffre=8
fi

if [[ $1 =~ "neuf" ]] ; then
convertchiffre=9
fi

if [[ $convertchiffre == " " ]] ; then
convertchiffre=$1

fi
# return
}



# Récupération de chaque matériel utilisé pour en faire la liste.
fct_matosutil() {

if [ -e ~/madeofstock/matosutilise.txt ] # Si le fichier récapitulatif existe, on le delete pour le réinitialiser.
then
    rm ~/madeofstock/matosutilise.txt
fi


if [ -e ~/madeofstock/fourchettes.txt ] && [ $(cat ~/madeofstock/fourchettes.txt) != 0 ] # Si on a utilisé cet item et que son comptage est différent de 0,
then
    fourchettesutilisees="$(cat ~/madeofstock/fourchettes.txt) fourchettes," # on l'inscrit dans la variable.
else
    fourchettesutilisees=""                                                 # Sinon, on met la variable à vide.
fi


if [ -e ~/madeofstock/cuilleres.txt ] && [ $(cat ~/madeofstock/cuilleres.txt) != 0 ] # Si on a utilisé cet item et que son comptage est différent de 0,
then
    cuilleresutilisees="$(cat ~/madeofstock/cuilleres.txt) cuillères" # on l'inscrit dans la variable.
else
    cuilleresutilisees=""                                             # Sinon, on met la variable à vide.
fi



# Enregistrement de l'ensemble du matériel utilisé dans le fichier "matosutilise.txt".
echo "On a utilisé : $fourchettesutilisees $cuilleresutilisees." > ~/madeofstock/matosutilise.txt


if [[ $(cat ~/madeofstock/matosutilise.txt) != *[0-9]* ]] # Si le fichier ne contient aucun chiffre, c'est qu'on a encore rien utilisé.
then
    # On y inscrit donc une phrase qui précise qu'on a encore rien utilisé.
    echo "Je n'ai enregistré aucun matériel utilisé pour le moment." > ~/madeofstock/matosutilise.txt
fi

}
