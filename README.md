# Mini-projet Docker - PostgreSQL + pgAdmin

## Objectif

Ce projet permet de lancer PostgreSQL et pgAdmin avec Docker Compose pour manipuler une base de donnees de mini e-commerce.

## Structure actuelle

```text
mini-ecommerce/
├── .env
├── .env.example
├── .gitignore
├── docker-compose.yml
├── sql/
│   ├── schema.sql
│   ├── seed.sql
│   └── queries.sql
└── README.md
```

## Configuration

Les identifiants et ports sont definis dans le fichier `.env`.

Variables utilisees par le `docker-compose.yml` :

```env
POSTGRES_CONTAINER_NAME=mini_ecommerce_postgres
POSTGRES_DB=mini_ecommerce_db
POSTGRES_USER=mini_ecommerce_user
POSTGRES_PASSWORD=mini_ecommerce_password
POSTGRES_PORT=5432

PGADMIN_CONTAINER_NAME=mini_ecommerce_pgadmin
PGADMIN_DEFAULT_EMAIL=admin@mini-ecommerce.local
PGADMIN_DEFAULT_PASSWORD=Admin1234!
PGADMIN_PORT=8080
```

## Initialisation SQL

Le projet utilise les fichiers du dossier `sql/` pour initialiser PostgreSQL :

- `sql/schema.sql` : creation du schema, des tables, contraintes et index
- `sql/seed.sql` : donnees de demonstration
- `sql/queries.sql` : requetes SQL de test

## Commandes utiles

Depuis la racine du projet `mini-ecommerce`, lance :

```bash
docker compose --env-file .env up -d
```

Pour arreter :

```bash
docker compose --env-file .env down
```

Pour supprimer aussi les volumes :

```bash
docker compose --env-file .env down -v
```

Pour voir les conteneurs :

```bash
docker compose --env-file .env ps
```

## Connexion pgAdmin

- URL : `http://localhost:8080`
- Email : `admin@mini-ecommerce.local`
- Mot de passe : `Admin1234!`

Pour enregistrer le serveur PostgreSQL dans pgAdmin :

- Host : `postgres`
- Port : `5432`
- Username : `mini_ecommerce_user`
- Password : `mini_ecommerce_password`
- Database : `mini_ecommerce_db`

## Important

Les fichiers `schema.sql` et `seed.sql` sont executes uniquement lors de l'initialisation du volume PostgreSQL.

Si tu modifies ces fichiers, recree le volume :

```bash
docker compose --env-file .env down -v
docker compose --env-file .env up -d
```
