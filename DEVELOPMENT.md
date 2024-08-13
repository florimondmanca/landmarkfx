# Développement

## Démarrage

Ce site utilise [Pelican] et nécessite Python 3

Le `Makefile` contient diverses commandes utiles.

Installer les dépendances :

```bash
make install
```

Compiler les traductions :

```bash
make messages
```

Lancer le serveur de dev :

```bash
make start
```

Builder le site et visualiser le résultat :

```bash
make build
```

## Déploiement

Le site est publié chez [Infomaniak](https://infomaniak.com) sous la forme d'un hébergement "Starter" (statique).

Installation pour pouvoir déployer (à faire une seule fois) :

* Prérequis : `lftp` (`sudo apt install lftp`)
* Ajouter un fichier `.env.local` et définir `FTP_USER`et `FTP_PASSWORD`

Pour déployer :

* Lancer `make ftp_upload`
