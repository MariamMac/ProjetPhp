
# users
CREATE TABLE users (
  user_id int NOT NULL AUTO_INCREMENT,
  user_name varchar(256) NOT NULL,
  mail varchar(256) NOT NULL,
  password varchar(256) NOT NULL,
  created datetime DEFAULT NULL,
  modified datetime DEFAULT NULL,
  date_of_birth date NOT NULL,
  PRIMARY KEY (user_id)
) ENGINE=InnoDB;

INSERT INTO users VALUES
(1, 'jimi', 'jimi@univ-lorraine.fr', 'bcbbccb723705ed5d134879c2d459a0d3ef2bd8cd2012ddf0664601898f50362', '2020-02-08 15:48:22', '2020-02-08 15:48:22', '1942-11-27'),
(2, 'eric', 'eric@univ-lorraine.fr', 'e19ae18ae9530b9837539fd441f242f094d612c276b1e88514e3d5abaa5f0f69', '2020-02-08 15:51:15', '2020-02-08 16:15:41', '1945-04-30');

# trips

CREATE TABLE trips (
  trip_id int NOT NULL AUTO_INCREMENT,
  trip_name varchar(256) NOT NULL,
  date_beginning date DEFAULT NULL,
  date_end date DEFAULT NULL,
  location varchar(256) DEFAULT NULL,
  creator_id int NOT NULL,
  PRIMARY KEY (trip_id),
  FOREIGN KEY (creator_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO trips VALUES
(1, 'Quand je serai à Milan\r\nJ\'achèterai des collants', '2020-06-26', '2020-07-24', 'Milan', 1);

CREATE TABLE users_trips (
  user_id int NOT NULL,
  trip_id int NOT NULL,
  PRIMARY KEY (user_id, trip_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (trip_id) REFERENCES trips(trip_id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

# steps

CREATE TABLE steps (
  step_id int NOT NULL AUTO_INCREMENT,
  step_name varchar(128) NOT NULL,
  trip_id int NOT NULL,
  date_beginning date NOT NULL,
  date_end date NOT NULL,
  PRIMARY KEY (step_id),
  FOREIGN KEY (trip_id) REFERENCES trips(trip_id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO steps VALUES
(1, 'Munster', 1, '2020-06-26', '2020-07-02'),
(2, 'Lucerne', 1, '2020-07-03', '2020-07-09');

CREATE TABLE steps_votes (
  user_id int NOT NULL,
  step_id int NOT NULL,
  PRIMARY KEY (user_id, step_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (step_id) REFERENCES steps(step_id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

# accomodations

CREATE TABLE accomodations (
  accomodation_id int NOT NULL AUTO_INCREMENT,
  accomodation_name varchar(128) NOT NULL,
  step_id int NOT NULL,
  type varchar(64) NOT NULL,
  date_beginning date NOT NULL,   #date de début du séjour
  date_end date NOT NULL,         #date de fin du séjour
  location varchar(256) NOT NULL, #ville
  description text NOT NULL,    
  price float UNSIGNED DEFAULT NULL,
  pays varchar(256) NOT NULL,     #pays
  type_lieu varchar(256) NOT NULL,  #type de lieu
  PRIMARY KEY (accomodation_id),
  FOREIGN KEY (step_id) REFERENCES steps(step_id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO accomodations VALUES
(1, 'Camping de Munster', 1, 'Camping', '2020-06-30', '2020-07-01', 'Munster', '', 100, "France", "Soleil");
(2, 'Camping de Lucerne', 2, 'Camping', '2020-06-26', '2020-06-29', 'Lucerne', '', 100, "France", "Soleil");

CREATE TABLE accomodations_votes (
  user_id int NOT NULL,
  accomodation_id int NOT NULL,
  PRIMARY KEY (user_id, accomodation_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (accomodation_id) REFERENCES accomodations(accomodation_id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

# activities

CREATE TABLE activities (
  activity_id int NOT NULL AUTO_INCREMENT,
  activity_name text NOT NULL,
  step_id int NOT NULL,
  type text NOT NULL,
  date_beginning date NOT NULL,
  date_end date NOT NULL,
  description text NOT NULL,
  price float UNSIGNED DEFAULT NULL,
  PRIMARY KEY (activity_id),
  FOREIGN KEY (step_id) REFERENCES steps(step_id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO activities VALUES
(1, 'Parc naturel régional des Ballons des Vosges', 1, 'Randonnée', '2020-06-26', '2020-06-29', 'Le parc naturel régional des Ballons des Vosges est un parc naturel régional français, créé en juin 1989 à l\'initiative de trois anciennes régions : l\'Alsace, la Lorraine et la Franche-Comté.', 100),
(2, 'Lucerne', 2, 'Tourisme', '2020-06-30', '2020-06-30', 'Lucerne est la septième ville de Suisse et le chef-lieu du canton de Lucerne. La ville se situe au pied des Alpes suisses et au bord du lac des Quatre-Cantons et de la rivière Reuss dans lequel il s\'écoule. Elle possède plusieurs ponts couverts, en bois, dont le Kapellbrücke, devenu indissociable de l\'image de la cité.', 100);

CREATE TABLE activities_votes (
  user_id int NOT NULL,
  activity_id int NOT NULL,
  PRIMARY KEY (user_id, activity_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (activity_id) REFERENCES activities(activity_id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

# transports

CREATE TABLE transports (
  transport_id int NOT NULL AUTO_INCREMENT,
  step_id int DEFAULT NULL,
  type varchar(64) NOT NULL,
  date_beginning date NOT NULL,
  date_end date NOT NULL,
  time_beginning time DEFAULT NULL,
  time_end time DEFAULT NULL,
  origin varchar(128) NOT NULL,
  destination varchar(128) NOT NULL,
  description text NOT NULL,
  price float UNSIGNED DEFAULT NULL,
  PRIMARY KEY (transport_id),
  FOREIGN KEY (step_id) REFERENCES steps(step_id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO transports VALUES
(1, 1, 'Vélo', '2020-07-03', '2020-07-03', '16:12:00', '20:12:00', 'Nancy', 'Munster', '', 0),
(2, 2, 'Trotinette', '2020-02-22', '2020-02-22', '10:30:00', '12:25:00', 'Munster', 'Lucerne', '', 0);

CREATE TABLE transports_votes (
  user_id int NOT NULL,
  transport_id int NOT NULL,
  PRIMARY KEY (user_id, transport_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (transport_id) REFERENCES transports(transport_id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;