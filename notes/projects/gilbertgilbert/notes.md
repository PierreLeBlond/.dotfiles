### Batch renaming exemples

`rename .JPG .jpg *`
`for i in *' '*; do mv "$i" "$(echo $i | sed -e 's/ /_/g')"; done`

### Bijoux en or

Utilisation d'un snippet de code pour remplacer les boutons des bijoux en or par une mention 'demande de devis'

### Instagram feed

La license à expiré, pour l'instant le feed fonctionne encore, mais pas moyen de le mettre à jour

### Changelogs (depuis le 23/04/2026)

- **Suppression de la bannière "Cours de l'or"**
- **Améliorer le style de l'encadré (trop gros et gris) -> Supprimé**
- **Ajout de nouvelles photos de bannières -> Création de deux diaporamas, l'un pour mobile, l'autre pour tablette/desktop, avec des images cadrées différemment**
- **Création d'un script google sheet pour générer un csv d'import à partir d'un tableau de nom, description et prix**
