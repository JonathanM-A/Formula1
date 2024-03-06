USE formula1;
DROP TABLE IF EXISTS circuits;
CREATE TABLE circuits(
circuitiD INT PRIMARY KEY,
circuitRef VARCHAR (255),
name VARCHAR (255),
location VARCHAR (255),
country VARCHAR (50),
alt INT DEFAULT NULL);

INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(1,'albert_park','Albert Park Grand Prix Circuit','Melbourne','Australia',10);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(2,'sepang','Sepang International Circuit','Kuala Lumpur','Malaysia',18);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(3,'bahrain','Bahrain International Circuit','Sakhir','Bahrain',7);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(4,'catalunya','Circuit de Barcelona-Catalunya','Montmelo','Spain',109);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(5,'istanbul','Istanbul Park','Istanbul','Turkey',130);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(6,'monaco','Circuit de Monaco','Monte-Carlo','Monaco',7);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(7,'villeneuve','Circuit Gilles Villeneuve','Montreal','Canada',13);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(8,'magny_cours','Circuit de Nevers Magny-Cours','Magny Cours','France',228);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(9,'silverstone','Silverstone Circuit','Silverstone','UK',153);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(10,'hockenheimring','Hockenheimring','Hockenheim','Germany',103);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(11,'hungaroring','Hungaroring','Budapest','Hungary',264);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(12,'valencia','Valencia Street Circuit','Valencia','Spain',4);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(13,'spa','Circuit de Spa-Francorchamps','Spa','Belgium',401);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(14,'monza','Autodromo Nazionale di Monza','Monza','Italy',162);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(15,'marina_bay','Marina Bay Street Circuit','Marina Bay','Singapore',18);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(16,'fuji','Fuji Speedway','Oyama','Japan',583);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(17,'shanghai','Shanghai International Circuit','Shanghai','China',5);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(18,'interlagos','Autodromo Jose Carlos Pace','Sao Paulo','Brazil',785);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(19,'indianapolis','Indianapolis Motor Speedway','Indianapolis','USA',223);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(20,'nurburgring','Nurburgring','Nurburg','Germany',578);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(21,'imola','Autodromo Enzo e Dino Ferrari','Imola','Italy',37);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(22,'suzuka','Suzuka Circuit','Suzuka','Japan',45);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(80,'vegas','Las Vegas Strip Street Circuit','Las Vegas','United States', 0);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(24,'yas_marina','Yas Marina Circuit','Abu Dhabi','UAE',3);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(25,'galvez','Autodromo Juan y Oscar Galvez','Buenos Aires','Argentina',8);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(26,'jerez','Circuito de Jerez','Jerez de la Frontera','Spain',37);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(27,'estoril','Autodromo do Estoril','Estoril','Portugal',130);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(28,'okayama','Okayama International Circuit','Okayama','Japan',266);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(29,'adelaide','Adelaide Street Circuit','Adelaide','Australia',58);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(30,'kyalami','Kyalami','Midrand','South Africa',1460);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(31,'donington','Donington Park','Castle Donington','UK',88);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(32,'rodriguez','Autodromo Hermanos Rodriguez','Mexico City','Mexico',2227);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(33,'phoenix','Phoenix street circuit','Phoenix','USA',345);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(34,'ricard','Circuit Paul Ricard','Le Castellet','France',432);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(35,'yeongam','Korean International Circuit','Yeongam County','Korea',0);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(36,'jacarepagua','Autodromo Internacional Nelson Piquet','Rio de Janeiro','Brazil',1126);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(37,'detroit','Detroit Street Circuit','Detroit','USA',177);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(38,'brands_hatch','Brands Hatch','Kent','UK',145);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(39,'zandvoort','Circuit Park Zandvoort','Zandvoort','Netherlands',6);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(40,'zolder','Zolder','Heusden-Zolder','Belgium',36);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(41,'dijon','Dijon-Prenois','Dijon','France',484);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(42,'dallas','Fair Park','Dallas','USA',139);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(43,'long_beach','Long Beach','California','USA',12);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(44,'las_vegas','Las Vegas Street Circuit','Nevada','USA',639);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(45,'jarama','Jarama','Madrid','Spain',609);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(46,'watkins_glen','Watkins Glen','New York State','USA',485);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(47,'anderstorp','Scandinavian Raceway','Anderstorp','Sweden',153);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(48,'mosport','Mosport International Raceway','Ontario','Canada',332);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(49,'montjuic','Montjuvic','Barcelona','Spain',79);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(50,'nivelles','Nivelles-Baulers','Brussels','Belgium',139);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(51,'charade','Charade Circuit','Clermont-Ferrand','France',790);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(52,'tremblant','Circuit Mont-Tremblant','Quebec','Canada',214);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(53,'essarts','Rouen-Les-Essarts','Rouen','France',81);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(54,'lemans','Le Mans','Le Mans','France',67);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(55,'reims','Reims-Gueux','Reims','France',88);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(56,'george','Prince George Circuit','Eastern Cape Province','South Africa',15);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(57,'zeltweg','Zeltweg','Styria','Austria',676);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(58,'aintree','Aintree','Liverpool','UK',20);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(59,'boavista','Circuito da Boavista','Oporto','Portugal',28);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(60,'riverside','Riverside International Raceway','California','USA',470);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(61,'avus','AVUS','Berlin','Germany',53);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(62,'monsanto','Monsanto Park Circuit','Lisbon','Portugal',158);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(63,'sebring','Sebring International Raceway','Florida','USA',18);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(64,'ain-diab','Ain Diab','Casablanca','Morocco',19);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(65,'pescara','Pescara Circuit','Pescara','Italy',129);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(66,'bremgarten','Circuit Bremgarten','Bern','Switzerland',551);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(67,'pedralbes','Circuit de Pedralbes','Barcelona','Spain',85);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(68,'buddh','Buddh International Circuit','Uttar Pradesh','India',194);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(69,'americas','Circuit of the Americas','Austin','USA',161);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(70,'red_bull_ring','Red Bull Ring','Spielberg','Austria',678);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(71,'sochi','Sochi Autodrom','Sochi','Russia',2);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(73,'baku','Baku City Circuit','Baku','Azerbaijan',-7);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(75,'portimao','Autodromo Internacional do Algarve','Portimao','Portugal',108);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(76,'mugello','Autodromo Internazionale del Mugello','Mugello','Italy',255);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(77,'jeddah','Jeddah Corniche Circuit','Jeddah','Saudi Arabia',15);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(78,'losail','Losail International Circuit','Al Daayen','Qatar', 0);
INSERT INTO circuits(circuitId, circuitRef, name, location, country, alt)  VALUES(79,'miami','Miami International Autodrome','Miami','USA', 0);

UPDATE circuits
SET alt = NULL
WHERE alt = 0;