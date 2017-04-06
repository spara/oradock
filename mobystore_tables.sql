 CREATE TABLE product
 (
   productid NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
   description CLOB NOT NULL,
   name VARCHAR2(255) NOT NULL,
   price NUMBER NOT NULL,
   image BLOB NOT NULL
 );

 CREATE TABLE customer
 (
   customerid NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   address VARCHAR2(1024) NOT NULL,
   email VARCHAR2(128) NOT NULL,
   name VARCHAR(255) NOT NULL,
   password VARCHAR(255) NOT NULL,
   phone VARCHAR(32) NOT NULL,
   username VARCHAR(255) NOT NULL,
   enable NUMBER(1),
   role VARCHAR2(20) DEFAULT 'USER'
 );

 CREATE TABLE orders
 (
   orderid NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   customerid NUMBER NOT NULL,
   orderdate DATE NOT NULL
 );

 CREATE TABLE orderquantities
 (
   orderid NUMBER NOT NULL,
   productsordered INTEGER,
   productid NUMBER NOT NULL,
   CONSTRAINT orderquantities_pkey PRIMARY KEY (orderid, productid),
   CONSTRAINT FK_personorder FOREIGN KEY (orderid)
 	REFERENCES orders (orderid)
 )

 -- Insert customer data

INSERT INTO customer (customerid, address, email, enabled, name, password, phone, role, username) VALUES (1,	'1500 Galafrey',	'timelord@gmail.com',	'1',	'Dr. Who',	'tardis', '555-555-5555', 'USER', 'thedoctor');
INSERT INTO customer (customerid, address, email, enabled, name, password, phone, role, username) VALUES (7,	'1800 Land of Make Believe',	'fredrogers@gmail.com',	'1',	'Fred Rogers',	'mr_rogerspass',	'222-333-4444',	'USER',	'mr_rogers');
INSERT INTO customer (customerid, address, email, enabled, name, password, phone, role, username) VALUES (8,	'1800 Office Depot',	'averylabel@gmail.com',	'1',	'Avery Label',	'averypass',	'222-333-4444',	'USER',	'avery');
INSERT INTO customer (customerid, address, email, enabled, name, password, phone, role, username) VALUES (9	'1800 Nebula Rd',	'spacegoatlabel@gmail.com',	'1',	'Space Goat',	'spacegoatpass',	'222-333-4444',	'USER',	'spacegoat')
INSERT INTO customer (customerid, address, email, enabled, name, password, phone, role, username) VALUES (10,	'1800 FFlorida Rd',	'summerpalms@gmail.com',	'1',	'Summer Palms',	'summerpass',	'222-333-4444',	'USER',	'summer')


-- Insert product data: this will require a ctl file and raw images to load into BLOBs
-- INSERT INTO product (name, description, image, price) VALUES ('Big Moby', 'Moby', lo_import('/images/moby_art.png'), 25);
-- INSERT INTO product (name, description, image, price) VALUES ('On the dock', 'Working together', lo_import('/images/on_the_dock.jpg'), 25);
-- INSERT INTO product (name, description, image, price) VALUES ('Compose', 'Compose', lo_import('/images/Compose.png'), 25);
-- INSERT INTO product (name, description, image, price) VALUES ('Gordon', 'Gordon the Turle', lo_import('/images/gordon.png'), 25);
-- INSERT INTO product (name, description, image, price) VALUES ('Containerd', 'Containerd for the people', lo_import('/images/containerd.png'), 25);
-- INSERT INTO product (name, description, image, price) VALUES ('Registry', 'Where to put your containers', lo_import('/images/Registry.png'), 25);
-- INSERT INTO product (name, description, image, price) VALUES ('DockerMachine', 'Working like a well oiled machine', lo_import('/images/Docker_machine.png'), 25);
-- INSERT INTO product (name, description, image, price) VALUES ('Swarm', 'Orchestrating work loads', lo_import('/images/swarm.png'), 25);
-- INSERT INTO product (name, description, image, price) VALUES ('Trusted Registry', 'Keeping it safe and secure', lo_import('/images/trusted_registry.jpg'), 25);