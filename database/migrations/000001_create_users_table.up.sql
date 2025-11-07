CREATE TABLE "users" (
    "id" uuid PRIMARY KEY,
    "name" varchar NOT NULL,
    "email" varchar NOT NULL,
    "password" varchar NOT NULL,
    "address" varchar,
    "created_at" timestamp NOT NULL DEFAULT (now()),
    "created_by" uuid,
    "updated_at" timestamp,
    "updated_by" uuid,
    "deleted_at" timestamp,
    "deleted_by" uuid
);