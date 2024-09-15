---
title: Echo Play (PedalPCB Hydra Delay avec Mods)
slug: builds/echo-play
lang: fr
status: hidden
---

<img src="/static/echo-play/topview.jpg" alt="Vue de dessus">

### Présentation

La pédale "Echo Play" est ma version de la [Hydra Delay](https://www.pedalpcb.com/product/pcb238/) de PedalPCB. C'est un delay type "écho à bandes" multi-têtes (4 interrupteurs) basé sur la puce Spin FV-1. On peut la comparer à la Catalinbread Echorec ou à la Dawner Prince Boonar. J'ai utilisé un boîtier 125B et les jacks sont montés sur le dessus.

Les connecteurs JST facilitent le démontage, les jacks audio et DC sont des Lumberg et j'y ai appliqué une décalcomanie maison.

Par rapport à la Hydra Delay de base, j'y ai implémenté plusieurs mods :

* Plage de delay ajustable par trimpot interne à l'aide du [FV-1 clock module](https://www.pedalpcb.com/product/fv1x/)
* Le réglage de Mix est plus progressif grâce à un potard 10kA (log) au lieu de 10kB (lin), cf [ce post](https://forum.pedalpcb.com/threads/hydra-delay.6788/).
* Commutation à relais avec contrôle à distance par MIDI grâce au module [Oscillator Devices Imp-3PDT](https://oscillatordevices.com/imp-midi/#Imp-3PDT).

### Notes d'assemblage

- La FV-1 se soude en CMS (composant monté en surface). J'ai suivi [ce tuto](https://www.youtube.com/watch?v=_FFNZu4l2CA).
- Le clock module est un mod pas cher et très pratique, je recommande. Astuce : l'utiliser pour définir un réglage connu lorsque le potard "Time" à midi. (Pour ma part, une croche pointée à 125 bpm quand seule la tête 2 est activée...)
- Toutes les connexions vers et depuis le PCB principal utilisent des connecteurs JST-XH (avec des fils pré-sertis). Par rapport à une soudure fixe, ça permet de tout débrancher lors du démontage, notamment le jack DC.
- J'avais fait une **première version** en octobre 2023. Celle-là avait un boîtier jaune avec des libellés faits avec des tampons à encre solvant StazOn (facile à faire mais très "artisanal" dans le rendu), un footswitch "oscillation momentanée" (court-circuit du potard Swell) qui ne m'a pas été très utile finalement, et le perçage n'était pas top (je débutais). En août 2024 j'ai fait une **seconde version** : nouveau boîtier beige ; perçage bien meilleur ; beaux boutons en aluminium noir et une belle LED verte intense ("transparent diffused" chez RetroAmplis) ; décalcomanie personnalisée ; retrait du footswitch "oscillation" ; nettoyage du PCB à l'alcool isopropylique (hélas très difficile à trouver en magasin de bricolage, j'ai acheté une bouteille chez RetroAmplis) ; remplacement du 3PDT par l'Imp-3PDT sur SPST doux.
- J'ai dessiné la décalcomanie sous Inkscape et je l'ai imprimée par imprimante laser sur une étiquette d'expédition transparente A4 Avery qu'on peut trouver en papetterie. C'est la technique expliquée par Pougnet Pedals dans [cette vidéo](https://www.youtube.com/watch?v=GZ_sWkzxgdk). Finition avec deux couches de vernis transparent aérosol. Résultat OK mais mon imprimante laser basique a bavé... Prévoir une imprimante qui peut traiter du papier photo.
- La maquette Inkscape a été cruciale pour ajuster le positionnement de façon à tout rentrer dans le boîtier 125B. Le clock module est posé par velcro sur le footswitch SPST, et l'Imp-3PDT est soudé directement aux pattes de celui-ci (c'est prévu pour). Le tout rentre pile poil, j'en suis très satisfait...

### Coût des matériaux

| Item | Prix (approx) | Vendeur |
|---|---|---|
| 1x kit Hydra Delay | 65€ | Musikding.de |
| 1x kit Clock module | 4€ | - | 
| 1x boîtier 125B peint | 10€ | RetroAmplis |
| Jacks jacks (2x KLBM-3, 1x NEB/J21C), green LED | 7€ | - |
| 5x boutons de potentiomètre alu noirs | 8€ | Banzai Music (SKU 60084) |
| Imp-3PDT, prise TRS 3.5mm, footswitch SPST | 35€ | Oscillator Devices |
| Frais d'expédition | 15€ |
| **TOTAL** | ~ 140€ |

### Photos

<img loading="lazy" src="/static/echo-play/topview.jpg" alt="Vue de dessus">

<img loading="lazy" src="/static/echo-play/sideview.jpg" alt="Vue de côté">

<img loading="lazy" src="/static/echo-play/guts.jpg" alt="Vue de l'intérieur">

### Téléchargements

* <a href="/static/echo-play/drawing.svg" download="echo-play.svg">Maquette Inkscape</a> (contient une couche de gabarit de perçage)

### Licence

Dessins et schémas sous licence [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).
