BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user1','user1','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('user2','user2','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('user3','user3','ROLE_USER');

--INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
--VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/best-things-to-do-in-cleveland_g23_mobi.jpg','Pub featuring a menu of traditional Irish & American fare plus live music & a patio with lake views.','The Harp','Music Venue',41.48873649950637,-81.71697891534133,'11:30AM - 10PM','false','true','','false', 4.6);
--
--INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
--VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/best-things-to-do-in-cleveland_g24_mobi.jpg','The Cleveland Orchestra, based in Cleveland, is one of the five American orchestras informally referred to as the "Big Five". Founded in 1918 by the pianist and impresario Adella Prentiss Hughes, the orchestra plays most of its concerts at Severance Hall.','The Cleveland Orchestra','Music Venue',41.5063008896062, -81.60936100031599,'5PM - 9PM','true','true','','false', 4.7);
--
--INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
--VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/best-things-to-do-in-cleveland_g25_mobi.jpg','The Cleveland Metroparks Zoo aka Cleveland Zoological Park is a 183-acre zoo in Cleveland, Ohio. The Zoo is divided into several areas: Australian Adventure; African Savanna; Northern Wilderness Trek, The Primate, Cat & Aquatics Building, Waterfowl Lake, The RainForest, and the newly added Asian Highlands','Cleveland Metroparks Zoo','Zoo',41.44663841916885, -81.7126246,'10AM - 5PM','true','true','','true', 4.7);
--
--INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
--VALUES ('https://lh5.googleusercontent.com/p/AF1QipNRBozNC4zSKM8lcjej3o-1oFdRqKVngQ1uCHhC=w640-h240-k-no','Rocket Mortgage FieldHouse is a multi-purpose arena in Cleveland, Ohio. The building is the home of the Cleveland Cavaliers of the National Basketball Association and the Cleveland Monsters of the American Hockey League. It also serves as a secondary arena for Cleveland State Vikings mens and womens basketball.','Rocket Mortgage FieldHouse','Stadium',41.497109907152876, -81.68801448465868,'10AM - 12AM','true','true','','false', 4.6);

COMMIT TRANSACTION;
