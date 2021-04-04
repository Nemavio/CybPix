# CybPix

![Pipeline status](https://git.vuillermet.bzh/imta-formation/fip3a/cybpix/badges/master/pipeline.svg)

Démo https://cybpix.elektron.ink

CI/CD du dépôt https://github.com/15dev/PhotoSharing :-)

## Environnement
CybPix est déployé sur une stack microK8s d'un cluster d'une VM de 6Go de RAM et de 8vCPU hosté sur un magnifique R640 hosté chez milkywan.fr ! :)

![Un super Dell R640 chez Milky](https://pbs.twimg.com/media/EuR4uhkXEAA2jEb?format=jpg&name=large)

## Aspect sécurité

Un des points importants de ce projet réside dans la sécurité de l'application développée.

Ainsi, nous avons mis en place ces points de sécurité :

:bomb: Injection SQL (injection développée volontairement, car le fonctionnement de pg sous node empêche toute injection de base)

> L'injection SQL est présentée dans le dépôt du code source de l'application.

:bar_chart: Déploiement k8s avec BackEnd et FrontEnd en HA dans plusieurs pods pour tenir la charge

> Le déploiement du cluster est réalisé grâce à la CI/CD de Gitlab (voir .gitlab-ci.yml) et le cluster est décrit par les fichiers de configuration k8s présents dans le dossier k8s/

:cop: Déploiement d'un certificat SSL pour la présence d'une couche HTTP TLS

> Le déploiement d'un certificat Let's Encrypt est réalisé directement grâce à l'ingress controller basé sous nginx de k8s

:traffic_light: Mise en place de NFTables, dans le but de bloquer tout accès extérieur à la base de donnée

> Un pare-feu NFTables a été mis en place. Nous avions la volonté de déployer au débit UFW, cependant la couche docker k8s met en oeuvre de nombreux liens réseaux. UFW ne permet pas une configuration complexe, de ce fait nous nous sommes tournés vers NFTables. la configuration est disponible dans le fichier nftables.conf. Nous autorisons uniquement les communications sur les ports HTTP et HTTPS depuis l'extérieur ainsi que la communication sur l'API sécurisée par TLS de k8s sur le port TCP 16443. De plus, nous autorisons le SSH, uniquement en IPv6. De plus, en dehors du pare-feu, nous n'autorisons les connexions SSH uniquement par certificat.

## Compétences acquises

Grâce à cet UE F, Cyber des applis web et BDD, nous avons acquis de nombreuses compétences.
Nous avons pu mettre en oeuvre les compétences suivantes dans ce projet :

:heavy_check_mark: Développement BackEnd API NodeJS

:heavy_check_mark: Développement FrontEnd NodeJS React

:heavy_check_mark: Travail collaboratif & Versioning git

:heavy_check_mark: CI/CD Gitlab

:heavy_check_mark: Déploiement k8s

:heavy_check_mark: Sécurisation VPS

## Auteurs

@15dev : Développement FrontEnd & BackEnd NodeJS

@Nemavio : DevOps µK8s
