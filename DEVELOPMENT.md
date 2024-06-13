# Développement

## Déploiement

### Mettre en ligne une nouvelle version

```
make upload
```

### Configuration initiale

* OS : Debian 12 (bookworm)
* Serveur Web : [Caddy](https://caddyserver.com) via Docker

Configurer l'accès SSH à la VM, puis configurer la machine avec :

```
make prodconfig
```

Pour déployer le serveur web, utiliser :

```
make deploy
```
