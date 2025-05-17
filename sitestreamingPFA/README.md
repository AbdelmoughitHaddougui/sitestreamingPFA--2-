# SOUNIMA - Plateforme de Streaming

SOUNIMA est une plateforme de streaming de films inspirée de Netflix, développée avec Spring Boot, Thymeleaf, et MySQL.

## Prérequis

- Java 11 ou supérieur
- Maven
- MySQL
- PHPMyAdmin

## Installation

1. Clonez le repository :
```bash
git clone [URL_DU_REPO]
cd sounima-streaming
```

2. Configurez la base de données MySQL :
- Créez une base de données nommée `sounima_db`
- Les paramètres de connexion sont configurés dans `src/main/resources/application.properties`
- Par défaut :
  - URL : jdbc:mysql://localhost:3306/sounima_db
  - Username : root
  - Password : (vide)

3. Compilez le projet avec Maven :
```bash
mvn clean install
```

4. Lancez l'application :
```bash
mvn spring-boot:run
```

5. Accédez à l'application dans votre navigateur :
```
http://localhost:8080
```

## Fonctionnalités

- Interface utilisateur moderne inspirée de Netflix
- Catalogue de films avec différentes catégories
- Recherche de films
- Filtrage par genres
- Système de notation
- Historique de visionnage
- Profils utilisateurs

## Structure du Projet

```
src/
├── main/
│   ├── java/
│   │   └── com/
│   │       └── sounima/
│   │           ├── controller/
│   │           ├── model/
│   │           ├── repository/
│   │           ├── service/
│   │           └── SounimaApplication.java
│   └── resources/
│       ├── static/
│       │   ├── css/
│       │   └── images/
│       ├── templates/
│       └── application.properties
```

## Technologies Utilisées

- Spring Boot 2.7.0
- Thymeleaf
- MySQL
- Bootstrap 5
- Font Awesome
- JPA/Hibernate
- Spring Security

## Contribution

Les contributions sont les bienvenues ! N'hésitez pas à :
1. Fork le projet
2. Créer une branche pour votre fonctionnalité
3. Commiter vos changements
4. Pousser vers la branche
5. Ouvrir une Pull Request

## Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails. 