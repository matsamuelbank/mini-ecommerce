# Mini-projet Docker - PostgreSQL + pgAdmin

## Objectif

Ce projet permet de lancer PostgreSQL et pgAdmin avec Docker Compose pour manipuler une base de donnees de mini e-commerce.

## Structure actuelle

```text
mini-ecommerce/
├── .env
├── .env.example
├── .gitignore
├── docker/
│   └── docker-compose.yml
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

## Volumes SQL dans Docker Compose

Le fichier [docker/docker-compose.yml](/Users/samuelb/Workflow/formation-data/cours-docker/mini-ecommerce/docker/docker-compose.yml) monte les scripts SQL suivants pour initialiser PostgreSQL :

- `../sql/schema.sql` vers `/docker-entrypoint-initdb.d/01_schema.sql`
- `../sql/seed.sql` vers `/docker-entrypoint-initdb.d/02_seed.sql`

Cela correspond a la structure actuelle du projet, avec les fichiers SQL dans le dossier `sql/`.

## Commandes utiles

Depuis la racine du projet `mini-ecommerce`, lance :

```bash
docker compose --env-file .env -f docker/docker-compose.yml up -d
```

Pour arreter :

```bash
docker compose --env-file .env -f docker/docker-compose.yml down
```

Pour supprimer aussi les volumes :

```bash
docker compose --env-file .env -f docker/docker-compose.yml down -v
```

Pour voir les conteneurs :

```bash
docker compose --env-file .env -f docker/docker-compose.yml ps
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
docker compose --env-file .env -f docker/docker-compose.yml down -v
docker compose --env-file .env -f docker/docker-compose.yml up -d
```
