/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
	id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	date_of_birth DATE,
	escape_attempts INT,
	neutered BOOLEAN,
	weight_kg DECIMAL
);

ALTER TABLE animals
ADD COLUMN species VARCHAR(100);

CREATE TABLE owners(
	id INT GENERATED ALWAYS AS IDENTITY,
	full_name VARCHAR(100),
	age INT,
	PRIMARY KEY(id)
);

CREATE TABLE species(
	id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100),
	PRIMARY KEY(id)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owner_id INT REFERENCES owners(id);

CREATE TABLE vets(
	id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100),
	age INT,
	date_of_graduation DATE,
	PRIMARY KEY(id)
);

CREATE TABLE specializations(
    id INT GENERATED ALWAYS AS IDENTITY,
    vet_id INT REFERENCES vets(id),
	species_id INT REFERENCES species(id),
	PRIMARY KEY(id)
);

CREATE TABLE visits(
	id INT GENERATED ALWAYS AS IDENTITY,
	animal_id INT REFERENCES animals(id),
	vet_id INT REFERENCES vets(id),
	visit_date DATE,
	PRIMARY KEY(id)
);

CREATE INDEX idx_animal_id ON visits (animal_id);
CREATE INDEX idx_vet_id ON visits (vet_id);
CREATE INDEX idx_email_id ON owners (email);
