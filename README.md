# User File Database

## Application
* Créer une page d'acceuil avec sign in et sign up
* Ajouter au modèle l'objet File
```java
public class File{
	String name
	String extension
	int size
	Date lastModifDate
	Date uploadDate
	User owner
	boolean private
}
```
* Permettre à un utilisateur d'uploader des fichiers sur le serveur
* Permettre à l'utilisateur de consulter et télécharger ses fichiers

## API
* Créer une API REST exposant la classe File
* Déployer un webservice d'administration permettant d'éditer les users et leurs fichiers
