#!/usr/bin/env bash

# WordPress automatical installation
# Requires a connected Vagrant
# Authors: Thierry, Aurélien & Jérémy.
# Special thanks to Bachir for helping us!
# Wordpress packets installation

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
# Database link configuration
echo Database Name:
read dbname
echo Database User:
read dbuser
echo Database Password:
read dbpass
# Wordpress installation
wp core download --locale=fr_FR
wp config create --dbname=$dbname --dbuser=$dbuser --dbpass=$dbpass --locale=fr_FR
# Website configuration
if ! $(wp core is-installed); then
   echo Quelle est le nom de ton site?
   read title
   echo Quel nom d\'utilisateur admin veux-tu utiliser?
   read admin
   echo Quel mot de passe souhaites-tu utiliser?
   read password
   echo Quelle est ton adresse mail de contact?
   read email
# Website creation
   wp core install --url=192.168.33.10 --title=$title --admin_user=$admin --admin_password=$password --admin_email=$email
   echo Votre site est opérationnel sur cette adresse: 192.168.33.10
fi
rm index.html
# Wordpress plugins installation
   if ! $(wp plugin is-installed wordfence); then
        wp plugin install wordfence
   fi
   if ! $(wp plugin is-installed duplicator); then
        wp plugin install duplicator
   fi
   if ! $(wp plugin is-installed google-analytics-dashboard-for-wp); then
        wp plugin install google-analytics-dashboard-for-wp
    fi
# User's management menu
echo Que voulez-vous gérer?
options=("Theme" "Plugin" "Quitter")
select opt in "${options[@]}"
do
    case $opt in
# Theme management
        "Theme")
            wp theme list
            echo Que voulez-vous réaliser ?
            options=("Ajouter un theme"  "Supprimer un theme" "Activer un theme" "Quitter")
            select opt in "${options[@]}"
            do
                case $opt in
                    "Ajouter un theme")
                         echo Entrer un mot cle pour trouver un theme:
                         read findTheme
                         wp theme search $findTheme
                         echo Quel est le "slug" du theme recherché?
                         read slug
                         wp theme install $slug
                        ;;
                    "Supprimer un theme")
                        wp theme list
                        echo Quel est le "slug" du theme que vous voulez supprimer?
                        read deleteSlugTheme
                        wp theme delete $deleteSlugTheme
                        ;;
                    "Activer un theme")
                        wp theme list
                        echo Quel theme voulez vous activer?
                        read activateSlugTheme
                        wp theme activate $activateSlugTheme
                        ;;
                    "Quitter")
                        break
                        ;;
# Wrong request response
                    *) echo  Option non valide
                esac
            done
            ;;
# Plugin management
        "Plugin")
            wp plugin list
            echo Que voulez-vous réaliser ?
            options=("Ajouter un plugin"  "Supprimer un plugin" "Activer un plugin" "Desactiver un plugin" "Mettre a jour un plugin" "Quitter")
            select opt in "${options[@]}"
            do
                case $opt in
                    "Ajouter un plugin")
                         echo Entrer un mot cle pour trouver un plugin:
                         read findPlugin
                         wp plugin search $findPlugin
                         echo Quel est le "slug" du plugin recherché?
                         read slug
                         wp plugin install $slug
                        ;;
                    "Supprimer un plugin")
                        wp plugin list
                        echo Quel est le "slug" du plugin que vous souhaitez supprimer?
                        read deleteSlugPlugin
                        wp plugin delete $deleteSlugPlugin
                        ;;
                    "Activer un plugin" )
                        wp plugin list
                        echo Quel est le "slug" du plugin que vous souhaitez activer?
                        read activateSlug
                        wp plugin activate $activateSlug
                        ;;
                    "Desactiver un plugin")
                    wp plugin list
                        echo Quel est le "slug" du plugin que vous souhaitez desactiver?
                        read deactivateSlug
                        wp plugin deactivate $deactivateSlug
                        ;;
                    "Mettre a jour un plugin")
                    echo Quel est le "slug" du plugin que vous souhaitez mettre a jour?
                        read updateSlug
                        wp plugin update $updateSlug
                        ;;
                    "Quitter")
                        break
                        ;;
# Wrong request response
                    *) echo  option non valide;;
                esac
            done
            ;;
        "Quit")
            wp plugin list
            break
            ;;
        *) echo invalid option;
    esac
done
