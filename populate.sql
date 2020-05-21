INSERT INTO App(app_name, app_size, last_updated, current_ver)
VALUES('Apk Installer', '19M', 'January 7, 2019', '1.0.0');
INSERT INTO App(app_name, app_size, last_updated, current_ver)
VALUES('Bubble', '14M', 'January 15, 2018', '2.0.0');
INSERT INTO App(app_name, app_size, last_updated, current_ver)
VALUES('DB Browser', '8.7M', 'August 1, 2019', '1.2.4');


INSERT INTO Category(app_category)
VALUES('GAME');
INSERT INTO Category(app_category)
VALUES('TOOLS');
INSERT INTO Category(app_category)
VALUES('DELETED');

INSERT INTO AppCategory(app_name, app_category)
VALUES('Apk Installer', 'TOOLS');
INSERT INTO AppCategory(app_name, app_category)
VALUES('Bubble', 'GAME');
INSERT INTO AppCategory(app_name, app_category)
VALUES('DB Browser', 'TOOLS');


INSERT INTO Genre(app_genre)
VALUES('Action');
INSERT INTO Genre(app_genre)
VALUES('Puzzle');

INSERT INTO AppGenre(app_name, app_genre)
VALUES('Apk Installer', 'Action');
INSERT INTO AppGenre(app_name, app_genre)
VALUES('Bubble', 'Puzzle');
INSERT INTO AppGenre(app_name, app_genre)
VALUES('DB Browser', 'Puzzle');


INSERT INTO Publisher(pub_name)
VALUES('Bob');
INSERT INTO Publisher(pub_name)
VALUES('Boba');

INSERT INTO AppPublisher(app_name, pub_name)
VALUES('Apk Installer', 'Bob');
INSERT INTO AppPublisher(app_name, pub_name)
VALUES('Bubble', 'Boba');
INSERT INTO AppPublisher(app_name, pub_name)
VALUES('DB Browser', 'Boba');


INSERT INTO Type(pricing_type)
VALUES('Free');
INSERT INTO Type(pricing_type)
VALUES('Paid');

INSERT INTO Pricing(app_name, pricing_type, price)
VALUES('Apk Installer', 'Paid', '$1.12');
INSERT INTO Pricing(app_name, pricing_type, price)
VALUES('Bubble', 'Free', '0');
INSERT INTO Pricing(app_name, pricing_type, price)
VALUES('DB Browser', 'Free', '0');