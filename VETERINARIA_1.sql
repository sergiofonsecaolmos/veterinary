CREATE TABLE IF NOT EXISTS owners(
	owner_id SERIAL PRIMARY KEY,
	first_name VARCHAR(15) NOT NULL,
	last_name VARCHAR (30) NOT NULL,
	identification VARCHAR (12) UNIQUE NOT NULL,
	phone_number VARCHAR(15) NOT NULL,
	email VARCHAR (150) UNIQUE NOT NULL,
	birth_date DATE 
);

CREATE TABLE IF NOT EXISTS pets(
	pet_id SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
	type VARCHAR(20) NOT NULL,
	breed VARCHAR(40) NOT NULL,
	age INT NOT NULL,
	owner_id INT,
	FOREIGN KEY (owner_id) REFERENCES owners(owner_id)
);

CREATE TABLE IF NOT EXISTS vets(
	vet_id SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
	license VARCHAR(10) UNIQUE NOT NULL,
	age INT,
	years_experience INT,
	phone VARCHAR(12) NOT NULL
);

CREATE TABLE attends(
	vet_id INT NOT NULL,
	pet_id INT NOT NULL,
	FOREIGN KEY (vet_id)
	REFERENCES vets (vet_id),
	FOREIGN KEY (pet_id)
	REFERENCES pets (pet_id),
	
	PRIMARY KEY(pet_id, vet_id)
);

