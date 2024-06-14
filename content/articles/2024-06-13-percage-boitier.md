---
title: Comment percer proprement un boîtier de pédale d'effet
slug: percage-boitier
date: 2024-06-13
status: draft
---

Le **boîtier aluminium** est la solution la plus courante pour loger le circuit électronique de l'effet et les différents composants.

Si vous utilisez des kits, certains vendeurs comme Musikding proposent de vous fournir un **boîtier pré-percé**. Mais ces boîtiers ne sont pas forcément **peints**. C'est le cas de Musikding dont les boîtiers pré-percés sont forcément en alu brut.

Or **il est bien plus facile de percer correctement un boîtier alu que de le peindre correctement**. Coda Effects recommende même de [ne PAS peindre ses boîtiers soi-même](https://www.coda-effects.fr/2016/05/pourquoi-il-ne-faut-pas-peindre-ses.html). De mon côté je perce donc moi-même des boîtiers déjà peints.

Le plus efficace est certainement la perceuse à colonne, mais si vous êtes comme moi vous n'en avez pas. La bonne nouvelle c'est qu'on n'en a pas besoin. **On peut réaliser un perçage net et suffisamment précis avec une perceuse classique**. En tout cas la méthode que j'emploie me donne de bons résultats avec une précision qui peut approcher le millimètre... Voyons ça ensemble.

## Le matériel nécessaire

Il vous faudra :

* Une perceuse
* Un forêt de 4 ou 5 mm HSS et un forêt étagé HSS
* De l'huile de coupe
* Un système de maintien (étau, pinces de maintien...)
* Un support (table, établi, plan de travail...)
* Un poinçon (et un marteau s'il est manuel)
* Du papier cache
* Un aspirateur pour évacuer les copeaux d'aluminium

Détaillons un peu cette liste.

Pour percer le boîtier, il va nous falloir évidemment une **perceuse**. Selon moi une visseuse-perceuse portative ne suffit pas car elle n'est pas assez stable. De mon côté j'utilise donc une perceuse électrique filaire d'une marque bien connue. Si votre perceuse est à percussion, assurez-vous évidemment d'utiliser le mode sans percussion pour percer le métal.

Il vous faudra ensuite **deux forêts** : un **forêt classique de 4 ou 5 mm** qui servira au pré-perçage, et un **forêt étagé** pour élargir ces pré-trous au diamètre souhaité. Evitez de n'utiliser qu'un forêt étagé (c'est ce que je faisais au départ), car ils ne sont pas fait pour le perçage initial du métal, mais bien pour élargir un trou pré-existant. J'utilise typiquement un forêt de 5 mm car la plupart des trous que l'on doit réaliser font au minimum 6 mm (pour une LED par exemple).

Dans un second temps vous pourrez aussi vous procurer des forêts de 7 et 9 mm pour certaines prises jacks, potentiomètres ou embases LED dont les diamètres pairs inférieurs ou supérieurs seraient soit trop petits, soit trop gros. Mais je ne m'en suis procuré que sur le tard.

Point important : même s'ils sont plus chers, choisissez des forêts **HSS** qui dureront dans le temps. J'avais d'abord pris un kit de trois forêts étagés de diverses tailles sur Amazon pour environ 20€. Finalement je n'en utilisais qu'un seul (le forêt moyen allant de 6 à 16 mm) et il s'est complètement fendu au bout d'une vingtaine de trous, malgré l'utilisation de lubrifiant.

Justement, prévoyez également de l'**huile de coupe**. Il faut en appliquer sur le trou avant de procéder au perçage. Cela facilite le travail des forêts et prolonge leur durée de vie en limitant leur usure.

Prévoyez aussi un **système de maintien** pour maintenir le boîtier pendant le perçage et percer en toute sécurité. L'idéal est un étau, mais n'en ayant pas j'utilise des pinces de maintien. Dans ce cas prévoyez une ouverture suffisante (au moins 50 voire 60 mm) pour pouvoir maintenir un boîtier de 30 mm de haut à un **support** pouvant être une table, un bureau ou autre plan de travail.

Préparez aussi un **poinçon**, soit automatique soit manuel, et dans ce dernier cas munissez-vous d'un marteau. Le poinçon permettra de guider le forêt et lui éviter de glisser en entamant le perçage.

Enfin, prévoyez du **papier cache** car le perçage de l'aluminium génère des copeaux. Il ne faut surtout pas qu'ils griffent votre boîtier peint tout neuf. Un **aspirateur** est une solution simple pour évacuer ces copeaux au fur et à mesure.

## Le guide de perçage

Je vous recommande de vous munir d'un **guide de perçage** (appelé _drilling template_ en anglais).

Je veux parler d'un **patron à imprimer en taille réelle** pour indiquer les endroits exactements où faire les trous. En effet, percer à vue d'oeil est la garantie de trous non-alignés, ou placés à quelques milimètres à côté de là où il faudrait ; bref, un guide de perçage permet de percer avec précision.


Si vous achetez des kits, les fabricants tels que PedalPCB ou Aion FX fournissent parfois des **guides prêts à l'emploi**.

Vous pouvez aussi **dessiner le guide vous-même**, c'est d'ailleurs ce que je fais. Mes guides de perçage ressemblent typiquement à ça :

INSÉRER DESSIN

Vous pouvez utiliser un logiciel de dessin tel que **[Inkscape](https://inkscape.org/fr/)**, qui a l'avantage d'être gratuit, libre et multi-plateforme.

Il faut configurer le document au format A4 et passer les échelles en millimètres. Ensuite, prenez les mesures du boîtier et dessinez-le avec des rectangles. Utilisez l'épaisseur du trait pour représenter l'épaisseur des parois (typiquement 2 ou 3 mm).

Si vous en trouvez une dans une documentation PDF, **récupérez l'image du PCB** en ouvrant le PDF avec Inkscape. Vous pouvez comme ça l'intégrer à votre dessin pour en faire une véritable maquette. En prenant différentes mesures vous pouvez alors **placer les trous avec les espacements qui conviennent**.

Pour choisir le **diamètre de perçage**, vous pouvez regarder la documentation du kit ou du composant à insérer. Dans le pire des cas, mesurez le diamètre du composant et prenez un diamètre de forêt supérieur. **Prévoyez de la marge** car malgré tout vos trous ne tomberont pas exactement juste donc il faut pouvoir ajuster lors du montage finale. Mais ne percez pas trop grand car le composant doit pouvoir couvrir le trou pour un rendu esthétique satisfaisant. Ainsi pour un potentiomètre 6.3mm, faites typiquement un trou de 8mm.

De mon côté je matérialise alors les trous de perçage par **un point** correspondant au centre de perçage, et **un cercle** au diamètre de perçage choisi. Vous pouvez aussi ajouter le diamètre de perçage en toutes lettres sur le dessin pour vous aider.

## Prêts ? Percez !

Une fois votre guide de perçage prêt, imprimez-le puis découpez-le selon les bordures du patron.

Avant de le placer sur votre boîtier, **couvrez les faces peintures du boîtier avec du papier cache**, encore une fois afin de les protéger des copeaux d'aluminium.

Recouvrez ensuite votre boîtier avec le guide de perçage **en tendant bien** (les replis rendent l'emplacement du trou imprécis) et en utilisant les arêtes pour s'assurer d'un bon **alignement**. Quand ça vous convient, utilisez des bouts de scotch pour **maintenir le guide en place**.

Nous voici prêts à **percer** !

Munissez-vous de votre perceuse et enfilez le **forêt classique**, dans mon cas un forêt de 5 mm.
