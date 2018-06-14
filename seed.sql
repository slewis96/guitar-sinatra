DROP TABLE IF EXISTS guitars;

CREATE TABLE guitars (

  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  price INTEGER,
  img VARCHAR(255),
  description TEXT

);

INSERT INTO guitars (name , price, img, description) VALUES ('Fender Telecaster', 1000 , 'https://i.ebayimg.com/images/g/BrsAAOSwYc5aMbI9/s-l300.png', 'The Fender Telecaster, colloquially known as the Tele, is the worlds first commercially successful solid-body electric guitar.');
INSERT INTO guitars (name , price, img, description) VALUES ('Fender Esquire', 1500 , 'https://i.ebayimg.com/images/g/IbQAAOSwc7RaMgJ-/s-l300.png', 'The Fender Esquire is a solid-body electric guitar manufactured by Fender, the first solid-body guitar sold by Fender, debuting in 1950.');
INSERT INTO guitars (name , price, img, description) VALUES ('Gibson SG', 1800, 'https://i.imgur.com/J1KL1dJ.png', 'The Gibson SG is a solid-body electric guitar model that was introduced in 1961 (as the Gibson Les Paul SG) by Gibson, and remains in production today with many variations on the initial design available.');
