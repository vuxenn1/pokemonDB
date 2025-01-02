-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pokemonyasarhoca
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `badge`
--

DROP TABLE IF EXISTS `badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `badge` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `isElite` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badge`
--

LOCK TABLES `badge` WRITE;
/*!40000 ALTER TABLE `badge` DISABLE KEYS */;
INSERT INTO `badge` VALUES (1,'Boulder Badge','A badge earned by defeating the Pewter City Gym Leader.',500,0),(2,'Cascade Badge','A badge earned by defeating the Cerulean City Gym Leader.',600,0),(3,'Thunder Badge','A badge earned by defeating the Vermilion City Gym Leader.',700,0),(4,'Rainbow Badge','A badge earned by defeating the Celadon City Gym Leader.',800,0),(5,'Soul Badge','A badge earned by defeating the Fuchsia City Gym Leader.',900,0),(6,'Marsh Badge','A badge earned by defeating the Saffron City Gym Leader.',1000,0),(7,'Volcano Badge','A badge earned by defeating the Cinnabar Island Gym Leader.',1100,0),(8,'Earth Badge','A badge earned by defeating the Viridian City Gym Leader.',1200,0),(9,'Zephyr Badge','A badge earned by defeating the Violet City Gym Leader.',500,0),(10,'Hive Badge','A badge earned by defeating the Azalea Town Gym Leader.',600,0),(11,'Plain Badge','A badge earned by defeating the Goldenrod City Gym Leader.',700,0),(12,'Fog Badge','A badge earned by defeating the Ecruteak City Gym Leader.',800,0),(13,'Storm Badge','A badge earned by defeating the Cianwood City Gym Leader.',900,0),(14,'Mineral Badge','A badge earned by defeating the Olivine City Gym Leader.',1000,0),(15,'Glacier Badge','A badge earned by defeating the Mahogany Town Gym Leader.',1100,0),(16,'Rising Badge','A badge earned by defeating the Blackthorn City Gym Leader.',1200,0),(17,'Elite Badge','A special badge earned by defeating the Elite Four.',2000,1),(18,'Champion Badge','A badge awarded to the Champion of the Pokémon League.',2500,1),(19,'Battle Frontier Badge','A badge earned by defeating the Battle Frontier.',3000,1),(20,'Master Badge','A badge awarded to the ultimate Pokémon Master.',5000,1),(21,'Stone Badge','It is shaped like a rectangle with two of its corners more emphasized than the others.',120,0);
/*!40000 ALTER TABLE `badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capturedpokemon`
--

DROP TABLE IF EXISTS `capturedpokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capturedpokemon` (
  `pokemon_id` int NOT NULL,
  `trainer_id` int NOT NULL,
  PRIMARY KEY (`pokemon_id`),
  KEY `fk_trainer_captured` (`trainer_id`),
  CONSTRAINT `fk_pokemon_captured` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`),
  CONSTRAINT `fk_trainer_captured` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capturedpokemon`
--

LOCK TABLES `capturedpokemon` WRITE;
/*!40000 ALTER TABLE `capturedpokemon` DISABLE KEYS */;
INSERT INTO `capturedpokemon` VALUES (12,1),(17,1),(43,1),(28,3),(25,4),(36,6),(11,8),(24,9),(40,10),(41,10),(8,13),(15,13),(29,13),(34,13),(23,14),(49,15),(42,18),(32,19),(37,19),(45,19),(33,20),(20,21),(10,22),(7,24),(39,24),(9,25),(30,25),(31,25);
/*!40000 ALTER TABLE `capturedpokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casualtrainer`
--

DROP TABLE IF EXISTS `casualtrainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casualtrainer` (
  `trainer_id` int NOT NULL,
  `route_id` int NOT NULL,
  PRIMARY KEY (`trainer_id`),
  KEY `fk_route` (`route_id`),
  CONSTRAINT `fk_route` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`),
  CONSTRAINT `fk_trainer_casual` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casualtrainer`
--

LOCK TABLES `casualtrainer` WRITE;
/*!40000 ALTER TABLE `casualtrainer` DISABLE KEYS */;
INSERT INTO `casualtrainer` VALUES (4,9),(6,9),(16,9),(26,9),(27,9),(30,9);
/*!40000 ALTER TABLE `casualtrainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `population` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Pallet Town',601),(2,'Viridian City',1599),(3,'Pewter City',5767),(4,'Cerulean City',11171),(5,'Vermilion City',12097),(6,'Lavender Town',5884),(7,'Celadon City',16061),(8,'Fuchsia City',14943),(9,'Saffron City',12279),(10,'Cinnabar Island',5338),(11,'Goldenrod City',18209),(12,'Ecruteak City',9118),(13,'Olivine City',8563),(14,'Mahogany Town',4041),(15,'Blackthorn City',6032),(16,'Rustboro City',7905),(17,'Dewford Town',1192),(18,'Slateport City',22758),(19,'Mauville City',15645),(20,'Verdanturf Town',2403),(21,'Lavaridge Town',9473),(22,'Fallarbor Town',4533),(23,'Fortree City',8365),(24,'Lilycove City',16491),(25,'Mossdeep City',4571),(26,'Sootopolis City',8408),(27,'Pacifidlog Town',2309),(28,'Ever Grande City',2560),(29,'Twinleaf Town',1367),(30,'Hearthome City',26180);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym`
--

DROP TABLE IF EXISTS `gym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `location` varchar(50) NOT NULL,
  `gymType` int NOT NULL,
  `city` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cityid_gym` (`city`),
  KEY `fk_gymtype` (`gymType`),
  CONSTRAINT `fk_cityid_gym` FOREIGN KEY (`city`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_gymtype` FOREIGN KEY (`gymType`) REFERENCES `pokemontype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym`
--

LOCK TABLES `gym` WRITE;
/*!40000 ALTER TABLE `gym` DISABLE KEYS */;
INSERT INTO `gym` VALUES (1,'Rustboro Gym','Granite Lane, Rustboro City',1,16),(2,'Dewford Gym','Coastal Ave, Dewford Town',11,17),(3,'Slateport Gym','Harbor Rd, Slateport City',13,18),(4,'Mauville Gym','Current Blvd, Mauville City',8,19),(5,'Verdanturf Gym','Greenfield Rd, Verdanturf Town',3,20),(6,'Lavaridge Gym','Hot Springs Rd, Lavaridge Town',6,21),(7,'Fallarbor Gym','Ashy Path, Fallarbor Town',4,22),(8,'Fortree Gym','Treehouse Lane, Fortree City',2,23),(9,'Lilycove Gym','Seaside Rd, Lilycove City',7,24),(10,'Mossdeep Gym','Starlight Rd, Mossdeep City',12,25),(11,'Sootopolis Gym','Crystal Waters, Sootopolis City',10,26),(12,'Pacifidlog Gym','Driftwood Rd, Pacifidlog Town',14,27),(13,'Ever Grande Gym','Summit Rd, Ever Grande City',15,28),(14,'Twinleaf Gym','New Leaf Ave, Twinleaf Town',9,29),(15,'Hearthome Gym','Beacon Rd, Hearthome City',5,30);
/*!40000 ALTER TABLE `gym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `gym_view`
--

DROP TABLE IF EXISTS `gym_view`;
/*!50001 DROP VIEW IF EXISTS `gym_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `gym_view` AS SELECT 
 1 AS `gym_id`,
 1 AS `gym_name`,
 1 AS `gym_loc`,
 1 AS `type_name`,
 1 AS `city_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `gymleader`
--

DROP TABLE IF EXISTS `gymleader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gymleader` (
  `trainer_id` int NOT NULL,
  `gym_id` int NOT NULL,
  PRIMARY KEY (`trainer_id`),
  KEY `fk_gym` (`gym_id`),
  CONSTRAINT `fk_gym` FOREIGN KEY (`gym_id`) REFERENCES `gym` (`id`),
  CONSTRAINT `fk_trainer_gymleader` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gymleader`
--

LOCK TABLES `gymleader` WRITE;
/*!40000 ALTER TABLE `gymleader` DISABLE KEYS */;
INSERT INTO `gymleader` VALUES (8,1),(11,2),(2,4),(10,9),(12,13),(5,15);
/*!40000 ALTER TABLE `gymleader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Potion','Restores 20 HP of a Pokémon.',300),(2,'Super Potion','Restores 50 HP of a Pokémon.',700),(3,'Hyper Potion','Restores 200 HP of a Pokémon.',1200),(4,'Max Potion','Fully restores HP of a Pokémon.',2500),(5,'Revive','Revives a fainted Pokémon with half its max HP.',1500),(6,'Max Revive','Fully revives a fainted Pokémon.',4000),(7,'Antidote','Cures a poisoned Pokémon.',100),(8,'Paralyze Heal','Cures a paralyzed Pokémon.',200),(9,'Burn Heal','Cures a Pokémon of a burn.',250),(10,'Ice Heal','Cures a Pokémon of being frozen.',250),(11,'Full Heal','Cures all status conditions of a Pokémon.',600),(12,'Rare Candy','Increases a Pokémon’s level by 1.',3000),(14,'Repel','Repels weak wild Pokémon for 100 steps.',350),(15,'Super Repel','Repels weak wild Pokémon for 200 steps.',500),(16,'Max Repel','Repels weak wild Pokémon for 250 steps.',700),(17,'Poké Ball','A device for catching wild Pokémon.',200),(18,'Great Ball','A high-performance Poké Ball with a better catch rate.',600),(19,'Ultra Ball','An ultra-high-performance Poké Ball with a high catch rate.',1200),(20,'Master Ball','The best Poké Ball with a 100% catch rate.',10000),(21,'Banana','A very sweet ingredient. This go-to fruit is sweet and rich, and it’s beloved by many Pokémon.',150);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `trainer_id` int NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`trainer_id`),
  KEY `fk_city` (`city_id`),
  CONSTRAINT `fk_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_trainer_player` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (15,8),(18,8),(19,10),(29,10),(1,12),(25,12),(22,16),(24,20),(13,22),(7,24),(20,24),(17,30),(21,30);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokecenter`
--

DROP TABLE IF EXISTS `pokecenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokecenter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `location` varchar(50) NOT NULL,
  `capacity` int NOT NULL,
  `city` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cityid_pokecenter` (`city`),
  CONSTRAINT `fk_cityid_pokecenter` FOREIGN KEY (`city`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokecenter`
--

LOCK TABLES `pokecenter` WRITE;
/*!40000 ALTER TABLE `pokecenter` DISABLE KEYS */;
INSERT INTO `pokecenter` VALUES (1,'Pallet PokeCenter','Main St, Pallet Town',20,1),(2,'Viridian PokeCenter','Greenway Rd, Viridian City',25,2),(3,'Pewter PokeCenter','Rock Ave, Pewter City',30,3),(4,'Cerulean PokeCenter','River Blvd, Cerulean City',35,4),(5,'Vermilion PokeCenter','Harbor Lane, Vermilion City',40,5),(6,'Lavender PokeCenter','Ghost St, Lavender Town',15,6),(7,'Celadon PokeCenter','Market Rd, Celadon City',50,7),(8,'Fuchsia PokeCenter','Safari Ave, Fuchsia City',35,8),(9,'Saffron PokeCenter','Silph Rd, Saffron City',60,9),(10,'Cinnabar PokeCenter','Volcano Path, Cinnabar Island',20,10),(11,'Goldenrod PokeCenter','Flower St, Goldenrod City',45,11),(12,'Ecruteak PokeCenter','Burned Tower Rd, Ecruteak City',30,12),(13,'Olivine PokeCenter','Lighthouse Lane, Olivine City',25,13),(14,'Mahogany PokeCenter','Rage Rd, Mahogany Town',20,14),(15,'Blackthorn PokeCenter','Dragon Ave, Blackthorn City',35,15);
/*!40000 ALTER TABLE `pokecenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pokecenter_view`
--

DROP TABLE IF EXISTS `pokecenter_view`;
/*!50001 DROP VIEW IF EXISTS `pokecenter_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pokecenter_view` AS SELECT 
 1 AS `pc_id`,
 1 AS `pc_name`,
 1 AS `pc_loc`,
 1 AS `pc_cap`,
 1 AS `city_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `level` int NOT NULL,
  `pType` int NOT NULL,
  `sType` int DEFAULT NULL,
  `hp` int NOT NULL,
  `ap` int NOT NULL,
  `speed` int NOT NULL,
  `isShiny` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('Wild','Captured') NOT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pType` (`pType`),
  KEY `fk_sType` (`sType`),
  CONSTRAINT `fk_pType` FOREIGN KEY (`pType`) REFERENCES `pokemontype` (`id`),
  CONSTRAINT `fk_sType` FOREIGN KEY (`sType`) REFERENCES `pokemontype` (`id`),
  CONSTRAINT `chk_pType_sType` CHECK (((`pType` <> `sType`) or (`sType` is null)))
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
INSERT INTO `pokemon` VALUES (1,'Onix',15,9,NULL,40,45,70,0,'Wild','https://img.pokemondb.net/sprites/x-y/normal/onix.png'),(2,'Pikachu',25,4,NULL,35,55,90,0,'Wild','https://img.pokemondb.net/sprites/x-y/normal/pikachu-f.png'),(3,'Bulbasaur',10,5,NULL,45,49,45,0,'Wild','https://img.pokemondb.net/sprites/x-y/normal/bulbasaur.png'),(4,'Charmander',12,2,NULL,39,52,65,0,'Wild','https://img.pokemondb.net/sprites/x-y/normal/charmander.png'),(5,'Squirtle',10,3,NULL,44,48,43,0,'Wild','https://img.pokemondb.net/sprites/x-y/normal/squirtle.png'),(6,'Gengar',40,13,16,70,65,110,0,'Wild','https://img.pokemondb.net/sprites/x-y/normal/gengar.png'),(7,'Dragonite',50,15,13,91,134,80,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/dragonite.png'),(8,'Machamp',45,7,NULL,90,110,55,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/machamp.png'),(9,'Alakazam',40,11,NULL,55,50,120,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/alakazam.png'),(10,'Snorlax',30,1,NULL,160,110,30,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/snorlax.png'),(11,'Lucario',35,7,NULL,70,110,90,1,'Captured','https://img.pokemondb.net/sprites/x-y/shiny/lucario.png'),(12,'Mewtwo',60,11,16,106,150,130,1,'Captured','https://img.pokemondb.net/sprites/x-y/shiny/mewtwo.png'),(13,'Jolteon',30,4,NULL,65,65,130,0,'Wild','https://img.pokemondb.net/sprites/x-y/normal/jolteon.png'),(14,'Blastoise',45,3,NULL,79,83,58,0,'Wild','https://img.pokemondb.net/sprites/x-y/normal/blastoise.png'),(15,'Venusaur',30,5,NULL,80,82,60,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/venusaur.png'),(16,'Mew',50,11,16,100,100,100,1,'Wild','https://img.pokemondb.net/sprites/x-y/shiny/mew.png'),(17,'Charizard',40,2,15,78,84,100,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/charizard.png'),(18,'Pidgeot',25,10,NULL,83,80,91,0,'Wild','https://img.pokemondb.net/sprites/x-y/normal/pidgeot.png'),(19,'Zubat',15,10,NULL,40,45,40,0,'Wild','https://img.pokemondb.net/sprites/x-y/normal/zubat.png'),(20,'Eevee',20,1,NULL,55,50,55,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/eevee.png'),(21,'Ponyta',18,2,NULL,50,65,60,0,'Wild','https://img.pokemondb.net/sprites/x-y/normal/ponyta.png'),(22,'Magikarp',5,3,NULL,20,10,80,0,'Wild','https://img.pokemondb.net/sprites/x-y/normal/magikarp.png'),(23,'Raichu',30,4,NULL,60,90,100,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/raichu.png'),(24,'Arcanine',35,2,NULL,90,110,95,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/arcanine.png'),(25,'Golem',40,9,NULL,80,120,40,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/golem.png'),(26,'Vaporeon',30,3,NULL,130,65,65,0,'Wild','https://img.pokemondb.net/sprites/x-y/normal/vaporeon.png'),(27,'Flareon',30,2,NULL,130,110,65,0,'Wild','https://img.pokemondb.net/sprites/x-y/normal/flareon.png'),(28,'Sylveon',30,17,NULL,95,65,60,1,'Captured','https://img.pokemondb.net/sprites/x-y/normal/sylveon.png'),(29,'Nidoking',40,8,NULL,81,102,85,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/nidoking.png'),(30,'Nidoqueen',40,8,NULL,90,82,76,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/nidoqueen.png'),(31,'Vileplume',30,5,NULL,75,70,50,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/vileplume.png'),(32,'Rhydon',40,9,NULL,105,130,40,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/rhydon.png'),(33,'Exeggutor',45,5,NULL,95,105,55,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/exeggutor.png'),(34,'Dugtrio',35,9,NULL,35,100,120,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/dugtrio.png'),(35,'Lickitung',20,1,NULL,90,60,48,0,'Wild','https://img.pokemondb.net/sprites/x-y/normal/lickitung.png'),(36,'Hitmonlee',45,7,NULL,50,120,87,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/hitmonlee.png'),(37,'Hitmonchan',45,7,NULL,50,105,76,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/hitmonchan.png'),(38,'Scyther',40,12,NULL,70,110,105,0,'Wild','https://img.pokemondb.net/sprites/x-y/normal/scyther.png'),(39,'Pinsir',45,12,NULL,65,125,85,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/pinsir.png'),(40,'Electrode',35,4,NULL,60,50,150,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/electrode.png'),(41,'Magmar',35,2,NULL,65,95,93,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/magmar.png'),(42,'Crobat',45,10,NULL,85,90,130,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/crobat.png'),(43,'Tyranitar',50,13,NULL,100,134,61,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/tyranitar.png'),(44,'Voltorb',22,4,NULL,40,30,100,0,'Wild','https://img.pokemondb.net/sprites/x-y/normal/voltorb.png'),(45,'Marowak',22,9,NULL,60,80,45,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/marowak.png'),(46,'Caterpie',4,12,NULL,45,30,45,1,'Wild','https://img.pokemondb.net/sprites/x-y/shiny/caterpie.png'),(47,'Bellsprout',12,5,8,40,75,50,0,'Wild','https://img.pokemondb.net/sprites/x-y/normal/bellsprout.png'),(49,'Geodude',6,9,13,40,80,20,0,'Captured','https://img.pokemondb.net/sprites/x-y/normal/geodude.png');
/*!40000 ALTER TABLE `pokemon` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_pokemon_insert` AFTER INSERT ON `pokemon` FOR EACH ROW BEGIN
    IF NEW.type = 'Wild' THEN
        INSERT INTO WildPokemon (pokemon_id, route_id) 
        VALUES (NEW.id, FLOOR(1 + RAND() * (SELECT MAX(id) FROM Route)));
    ELSEIF NEW.type = 'Captured' THEN
        INSERT INTO CapturedPokemon (pokemon_id, trainer_id)
        VALUES (NEW.id, FLOOR(1 + RAND() * (SELECT MAX(id) FROM Trainer)));
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_pokemon_delete` BEFORE DELETE ON `pokemon` FOR EACH ROW BEGIN
    IF OLD.type = 'Wild' THEN
        DELETE FROM WildPokemon WHERE pokemon_id = OLD.id;
    ELSEIF OLD.type = 'Captured' THEN
        DELETE FROM CapturedPokemon WHERE pokemon_id = OLD.id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pokemontype`
--

DROP TABLE IF EXISTS `pokemontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemontype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `strongAgainst` int DEFAULT NULL,
  `weakAgainst` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_strongAgainst` (`strongAgainst`),
  KEY `fk_weakAgainst` (`weakAgainst`),
  CONSTRAINT `fk_strongAgainst` FOREIGN KEY (`strongAgainst`) REFERENCES `pokemontype` (`id`),
  CONSTRAINT `fk_weakAgainst` FOREIGN KEY (`weakAgainst`) REFERENCES `pokemontype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemontype`
--

LOCK TABLES `pokemontype` WRITE;
/*!40000 ALTER TABLE `pokemontype` DISABLE KEYS */;
INSERT INTO `pokemontype` VALUES (1,'Normal',1,14),(2,'Fire',5,3),(3,'Water',2,5),(4,'Electric',3,9),(5,'Grass',3,2),(6,'Ice',5,2),(7,'Fighting',1,10),(8,'Poison',5,9),(9,'Ground',2,5),(10,'Flying',7,4),(11,'Psychic',8,17),(12,'Bug',5,2),(13,'Rock',2,7),(14,'Ghost',11,16),(15,'Dragon',15,17),(16,'Dark',1,7),(17,'Steel',18,9),(18,'Fairy',17,7);
/*!40000 ALTER TABLE `pokemontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `poketrainer_view`
--

DROP TABLE IF EXISTS `poketrainer_view`;
/*!50001 DROP VIEW IF EXISTS `poketrainer_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `poketrainer_view` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `pokemons`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `poketypes_view`
--

DROP TABLE IF EXISTS `poketypes_view`;
/*!50001 DROP VIEW IF EXISTS `poketypes_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `poketypes_view` AS SELECT 
 1 AS `Pokemon Name`,
 1 AS `Primary Type`,
 1 AS `Secondary Type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `trainer_id` int NOT NULL,
  `pokecenter_id` int NOT NULL,
  PRIMARY KEY (`trainer_id`),
  KEY `fk_pokecenter` (`pokecenter_id`),
  CONSTRAINT `fk_pokecenter` FOREIGN KEY (`pokecenter_id`) REFERENCES `pokecenter` (`id`),
  CONSTRAINT `fk_trainer_professor` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (3,2),(14,2),(23,10),(28,14),(9,15);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `startingCity` int NOT NULL,
  `endingCity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_startCity` (`startingCity`),
  KEY `fk_endCity` (`endingCity`),
  CONSTRAINT `fk_endCity` FOREIGN KEY (`endingCity`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_startCity` FOREIGN KEY (`startingCity`) REFERENCES `city` (`id`),
  CONSTRAINT `chk_start_end_city` CHECK ((`startingCity` <> `endingCity`))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'Route 1',1,2),(2,'Route 2',2,3),(3,'Route 3',3,4),(4,'Route 4',4,5),(5,'Route 5',5,6),(6,'Route 6',6,7),(7,'Route 7',7,8),(8,'Route 8',8,9),(9,'Route 9',9,10),(10,'Route 10',10,11),(11,'Route 11',11,12),(12,'Route 12',12,13),(13,'Route 13',13,1);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `route_view`
--

DROP TABLE IF EXISTS `route_view`;
/*!50001 DROP VIEW IF EXISTS `route_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `route_view` AS SELECT 
 1 AS `r_id`,
 1 AS `r_name`,
 1 AS `starting_city`,
 1 AS `ending_city`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `age` int NOT NULL,
  `gender` char(1) NOT NULL,
  `badge` int DEFAULT NULL,
  `type` enum('CasualTrainer','Player','Professor','GymLeader') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_badge` (`badge`),
  CONSTRAINT `fk_badge` FOREIGN KEY (`badge`) REFERENCES `badge` (`id`),
  CONSTRAINT `chk_gender` CHECK ((`gender` in (_utf8mb4'F',_utf8mb4'M')))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES (1,'Ash Ketchum',10,'M',1,'Player'),(2,'Misty Waterflower',14,'F',2,'GymLeader'),(3,'Professor Oak',60,'M',NULL,'Professor'),(4,'Brock Stone',15,'M',1,'CasualTrainer'),(5,'Erika Grassleaf',18,'F',4,'GymLeader'),(6,'Karen Darkshade',27,'F',NULL,'CasualTrainer'),(7,'Ethan Johto',12,'M',7,'Player'),(8,'Whitney Milk',16,'F',10,'GymLeader'),(9,'Professor Elm',50,'M',NULL,'Professor'),(10,'Janine Ninja',17,'F',5,'GymLeader'),(11,'Clair Dragon',19,'F',16,'GymLeader'),(12,'Falkner Sky',14,'M',8,'GymLeader'),(13,'Blue Rival',10,'M',1,'Player'),(14,'Professor Birch',45,'M',NULL,'Professor'),(15,'Dawn Berlitz',11,'F',14,'Player'),(16,'Cynthia Champion',25,'F',NULL,'CasualTrainer'),(17,'Lucas Twinleaf',12,'M',NULL,'Player'),(18,'Barry Rush',13,'M',NULL,'Player'),(19,'May Maple',12,'F',NULL,'Player'),(20,'Brendan Birch',12,'M',NULL,'Player'),(21,'Hilda Unova',14,'F',17,'Player'),(22,'Hilbert Unova',14,'M',17,'Player'),(23,'Professor Juniper',40,'F',NULL,'Professor'),(24,'Wally Verdant',10,'M',8,'Player'),(25,'Shauna Kalos',13,'F',NULL,'Player'),(26,'Tierno Dance',13,'M',NULL,'CasualTrainer'),(27,'Trevor Pokédex',12,'M',NULL,'CasualTrainer'),(28,'Professor Kukui',35,'M',NULL,'Professor'),(29,'Hop Galar',11,'M',12,'Player'),(30,'Leon Champion',22,'M',NULL,'CasualTrainer');
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_trainer_insert` AFTER INSERT ON `trainer` FOR EACH ROW BEGIN
    IF NEW.type = 'CasualTrainer' THEN
        INSERT INTO CasualTrainer (trainer_id, route_id) 
        VALUES (NEW.id, FLOOR(1 + RAND() * (SELECT MAX(id) FROM Route)));
    ELSEIF NEW.type = 'Player' THEN
        INSERT INTO Player (trainer_id, city_id) 
        VALUES (NEW.id, FLOOR(1 + RAND() * (SELECT MAX(id) FROM City)));
    ELSEIF NEW.type = 'Professor' THEN
        INSERT INTO Professor (trainer_id, pokecenter_id) 
        VALUES (NEW.id, FLOOR(1 + RAND() * (SELECT MAX(id) FROM PokeCenter)));
    ELSEIF NEW.type = 'GymLeader' THEN
        INSERT INTO GymLeader (trainer_id, gym_id) 
        VALUES (NEW.id, FLOOR(1 + RAND() * (SELECT MAX(id) FROM Gym)));
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_trainer_delete` BEFORE DELETE ON `trainer` FOR EACH ROW BEGIN
    IF OLD.type = 'CasualTrainer' THEN
        DELETE FROM CasualTrainer WHERE trainer_id = OLD.id;
    ELSEIF OLD.type = 'Player' THEN
        DELETE FROM Player WHERE trainer_id = OLD.id;
    ELSEIF OLD.type = 'Professor' THEN
        DELETE FROM Professor WHERE trainer_id = OLD.id;
    ELSEIF OLD.type = 'GymLeader' THEN
        DELETE FROM GymLeader WHERE trainer_id = OLD.id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `wildpokemon`
--

DROP TABLE IF EXISTS `wildpokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wildpokemon` (
  `pokemon_id` int NOT NULL,
  `route_id` int NOT NULL,
  PRIMARY KEY (`pokemon_id`),
  KEY `fk_route_wild` (`route_id`),
  CONSTRAINT `fk_pokemon_wild` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`),
  CONSTRAINT `fk_route_wild` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wildpokemon`
--

LOCK TABLES `wildpokemon` WRITE;
/*!40000 ALTER TABLE `wildpokemon` DISABLE KEYS */;
INSERT INTO `wildpokemon` VALUES (16,1),(27,1),(46,1),(5,2),(35,2),(4,4),(3,5),(13,5),(44,5),(19,7),(38,7),(22,9),(26,9),(47,9),(14,10),(6,11),(2,12),(18,12),(1,13),(21,13);
/*!40000 ALTER TABLE `wildpokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pokemonyasarhoca'
--

--
-- Dumping routines for database 'pokemonyasarhoca'
--
/*!50003 DROP PROCEDURE IF EXISTS `decreasePokeStat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `decreasePokeStat`(IN poke_id INT, IN stat_attribute VARCHAR(25), IN decrement INT)
BEGIN
    -- Check the attribute and update the corresponding stat
    IF stat_attribute = 'hp' THEN
        UPDATE Pokemon
        SET hp = GREATEST(hp - decrement, 0) -- Ensure the value does not go below 0
        WHERE id = poke_id;
        
    ELSEIF stat_attribute = 'ap' THEN
        UPDATE Pokemon
        SET ap = GREATEST(ap - decrement, 0) -- Prevent negative values
        WHERE id = poke_id;
        
    ELSEIF stat_attribute = 'speed' THEN
        UPDATE Pokemon
        SET speed = GREATEST(speed - decrement, 0) -- Prevent negative values
        WHERE id = poke_id;
        
    ELSE
        -- Return an error message if an invalid attribute is provided
        SELECT 'Invalid attribute specified' AS Message;
    END IF;
    
    -- Return a success message after the update
    SELECT CONCAT(stat_attribute, ' of Pokémon with ID ', poke_id, ' has been decremented by ', decrement, '.') AS Message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `increasePokeStat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `increasePokeStat`(IN poke_id INT, IN stat_attribute VARCHAR(25), IN increment INT)
BEGIN
    -- Check the attribute and update the corresponding stat
    IF stat_attribute = 'hp' THEN
        UPDATE Pokemon
        SET hp = hp + increment
        WHERE id = poke_id;
        
    ELSEIF stat_attribute = 'ap' THEN
        UPDATE Pokemon
        SET ap = ap + increment
        WHERE id = poke_id;
        
    ELSEIF stat_attribute = 'speed' THEN
        UPDATE Pokemon
        SET speed = speed + increment
        WHERE id = poke_id;
        
    ELSE
        -- Return an error message if an invalid attribute is provided
        SELECT 'Invalid attribute specified' AS Message;
    END IF;
    
    -- Return a success message after the update
    SELECT CONCAT(stat_attribute, ' of Pokémon with ID ', poke_id, ' has been incremented by ', increment, '.') AS Message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertPokemons` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertPokemons`()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE pokemon_id INT;
    DECLARE pokemon_type ENUM('Wild', 'Captured');
    DECLARE trainer_id INT;
    DECLARE route_id INT;
    
    DECLARE max_route_id INT;
    DECLARE max_trainer_id INT;

    DECLARE poke_cursor CURSOR FOR 
        SELECT id, type, route_id, trainer_id
        FROM Pokemon;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    DELETE FROM WildPokemon;
    DELETE FROM CapturedPokemon;
    
    SELECT MAX(id) INTO max_route_id FROM Route;
    SELECT MAX(id) INTO max_trainer_id FROM Trainer;

    OPEN poke_cursor;

    read_loop: LOOP
        FETCH poke_cursor INTO pokemon_id, pokemon_type, route_id, trainer_id;

        IF done THEN
            LEAVE read_loop;
        END IF;

        IF pokemon_type = 'Captured' THEN
            IF trainer_id IS NULL THEN
                SET trainer_id = FLOOR(1 + (RAND() * max_trainer_id));
            END IF;
            INSERT INTO CapturedPokemon (pokemon_id, trainer_id)
            VALUES (pokemon_id, trainer_id);

        ELSEIF pokemon_type = 'Wild' THEN
            IF route_id IS NULL THEN
                SET route_id = FLOOR(1 + (RAND() * max_route_id));
            END IF;
            INSERT INTO WildPokemon (pokemon_id, route_id)
            VALUES (pokemon_id, route_id);
        END IF;
    END LOOP;

    CLOSE poke_cursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertTrainerDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertTrainerDetails`()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE trainer_id INT;
    DECLARE trainer_type VARCHAR(20);
    DECLARE city_id INT;
    DECLARE pokecenter_id INT;
    DECLARE gym_id INT;
    DECLARE route_id INT;
    
    DECLARE max_city_id INT;
    DECLARE max_pokecenter_id INT;
    DECLARE max_gym_id INT;
    DECLARE max_route_id INT;
    
    DECLARE trainer_cursor CURSOR FOR 
        SELECT id, type, city_id, pokecenter_id, gym_id
        FROM Trainer;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    DELETE FROM Player;
    DELETE FROM CasualTrainer;
    DELETE FROM GymLeader;
    DELETE FROM Professor;
    
    SELECT MAX(id) INTO max_city_id FROM City;
    SELECT MAX(id) INTO max_pokecenter_id FROM PokeCenter;
    SELECT MAX(id) INTO max_gym_id FROM Gym;
    SELECT MAX(id) INTO max_route_id FROM Route;

    OPEN trainer_cursor;

    read_loop: LOOP
        FETCH trainer_cursor INTO trainer_id, trainer_type, city_id, pokecenter_id, gym_id;

        IF done THEN
            LEAVE read_loop;
        END IF;

        IF trainer_type = 'Player' THEN
            IF city_id IS NULL THEN
                SET city_id = FLOOR(1 + (RAND() * max_city_id));
            END IF;
            INSERT INTO Player (trainer_id, city_id)
            VALUES (trainer_id, city_id);

        ELSEIF trainer_type = 'Professor' THEN
            IF pokecenter_id IS NULL THEN
                SET pokecenter_id = FLOOR(1 + (RAND() * max_pokecenter_id));
            END IF;
            INSERT INTO Professor (trainer_id, pokecenter_id)
            VALUES (trainer_id, pokecenter_id);

        ELSEIF trainer_type = 'GymLeader' THEN
            IF gym_id IS NULL THEN
                SET gym_id = FLOOR(1 + (RAND() * max_gym_id));
            END IF;
            INSERT INTO GymLeader (trainer_id, gym_id)
            VALUES (trainer_id, gym_id);

        ELSEIF trainer_type = 'CasualTrainer' THEN
            IF route_id IS NULL THEN
                SET route_id = FLOOR(1 + (RAND() * max_route_id));
            END IF;
            INSERT INTO CasualTrainer (trainer_id, route_id)
            VALUES (trainer_id, route_id);
        END IF;
    END LOOP;

    CLOSE trainer_cursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `gym_view`
--

/*!50001 DROP VIEW IF EXISTS `gym_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gym_view` AS select `g`.`id` AS `gym_id`,`g`.`name` AS `gym_name`,`g`.`location` AS `gym_loc`,`t`.`name` AS `type_name`,`c`.`name` AS `city_name` from ((`gym` `g` join `city` `c`) join `pokemontype` `t`) where ((`t`.`id` = `g`.`gymType`) and (`c`.`id` = `g`.`city`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pokecenter_view`
--

/*!50001 DROP VIEW IF EXISTS `pokecenter_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pokecenter_view` AS select `p`.`id` AS `pc_id`,`p`.`name` AS `pc_name`,`p`.`location` AS `pc_loc`,`p`.`capacity` AS `pc_cap`,`c`.`name` AS `city_name` from (`pokecenter` `p` join `city` `c`) where (`c`.`id` = `p`.`city`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `poketrainer_view`
--

/*!50001 DROP VIEW IF EXISTS `poketrainer_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `poketrainer_view` AS select `t`.`id` AS `id`,`t`.`name` AS `name`,group_concat(`p`.`name` separator ', ') AS `pokemons` from ((`capturedpokemon` `c` join `pokemon` `p` on((`c`.`pokemon_id` = `p`.`id`))) join `trainer` `t` on((`t`.`id` = `c`.`trainer_id`))) group by `t`.`name`,`t`.`id` order by `t`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `poketypes_view`
--

/*!50001 DROP VIEW IF EXISTS `poketypes_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `poketypes_view` AS select `p`.`name` AS `Pokemon Name`,`t`.`name` AS `Primary Type`,`t2`.`name` AS `Secondary Type` from ((`pokemon` `p` join `pokemontype` `t` on((`p`.`pType` = `t`.`id`))) left join `pokemontype` `t2` on((`p`.`sType` = `t2`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `route_view`
--

/*!50001 DROP VIEW IF EXISTS `route_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `route_view` AS select `r`.`id` AS `r_id`,`r`.`name` AS `r_name`,`sc`.`name` AS `starting_city`,`ec`.`name` AS `ending_city` from ((`route` `r` join `city` `sc`) join `city` `ec`) where ((`r`.`startingCity` = `sc`.`id`) and (`r`.`endingCity` = `ec`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-02 13:43:29
select * from pokemon;
