## Description

*Ninth* est un jeu de cartes à deux joueurs, ou l'on tente d’aligner trois cartes identiques pour marquer des points, au sein d'un carré de neuf cartes, partagé avec l'adversaire.

Après avoir de créé une partie, un autre joueur peut s'y connecter via son propre appareil pour commencer à jouer.

Plus tard, les cartes auront des pouvoirs suivant leur types, qui s'activeront sous diverses conditions, pour rendre le jeu bien plus intéressant.

# Règles du jeu

## Composition

81 cartes représentant une parmi neufs planètes.

## Préparation

Disposer 9 cartes faces visibles en carré au centre de l'espace de jeu, former une pioche avec le reste des cartes, faces cachées.

## But du jeu

Marquer des points en réalisant des alignements de 3 planètes identiques.

## Déroulement

Le dernier joueur à avoir été sur Mars commence. En cas d'incertitude, le plus jeune commence.

À tour de rôle, les joueurs effectuent ces actions, dans l'ordre :

- Prendre une carte parmi les neufs et la placer dans sa main.
- Placer, si voulu, une cartes de sa main dans l'emplacement vide.
    - Si un ou plusieurs alignements de trois cartes identiques, vertical ou horizontal, surviennent, le joueur en choisit un, récupère les trois cartes qui le compose et place ces cartes devant lui.
- Finir son tour en remplaçant tous les emplacements vide restant par des cartes de la pioche.

Chaque planète dispose en outre d'un pouvoir, qui s'active selon certaine conditions propres à chacune :

- Mercure : Mercure marque deux points au lieu d'un en fin de partie.
- Venus : Lorsque venus est prise, le joueur peut regarder les trois premières cartes de la pioches, et les replacer dans l'ordre de son choix.
- Terre : Si la terre est posé, le joueur rejoue.
- Mars : Si mars est posé, la carte qu'elle remplace est écarté du jeu.
- Jupiter : Si jupiter est prise, et qu'une carte la remplace, celle-ci est placé face cachée.
- Saturne : Si saturne est posé, le joueur échange les places de deux autres cartes.
- Uranus : Uranus peut constituer un alignement en diagonal.
- Neptune : Si neptune est prise, aucune carte ne la remplace.
- Neuvième planète : Remplace n'importe quelle planète dans un alignement.

## Fin de partie

Le jeu se termine a la fin du tour du joueur ayant pioché la dernière carte.
Chaque joueur compte alors le nombre d’alignement posé devant lui, celui de Mercure comptant pour deux.
Celui qui à la plus de points remporte la partie. En cas d'égalité, il est conseillé de refaire une partie pour se départager.
La partie peut se finir prématurément si un joueur réussi à placer les neufs planètes sur l'espace de jeu. (P=0.00015)

# Développement

- [x] fin du jeu et rejouer
- [x] Alignements
- [x] Amélioration du style des cartes (disabled, highlighted, etc)
- [x] Hide other player information and action from ui
- [x] Improve home & lobby style
- [x] Reverse board for other player
- [x] Hide drawn card from other player
- [x] Bug animation for rotated board
- [x] Handle end game and replay
- [x] Deploy
- [ ] github actions
- [ ] store game state locally to restore connections
- [ ] hide other player information and action from client
- [ ] forbid several connections to the same player
- [ ] find a better way to present cards
- [ ] add card rules
