PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE figure (
	id INTEGER NOT NULL, 
	figure_type TEXT, 
	points INTEGER, 
	move TEXT, 
	weapon_skill INTEGER, 
	ballistic_skill INTEGER, 
	strength TEXT, 
	toughness TEXT, 
	wounds TEXT, 
	attacks TEXT, 
	leadership TEXT, 
	save TEXT, figure_name text, max_number integer, 
	PRIMARY KEY (id)
);
INSERT INTO figure VALUES(2,'Ork Boy',6,'5',3,5,'4','4','2','3','6','6','Boss Nob',1);
INSERT INTO figure VALUES(3,'Fire Warrior',8,'6',5,4,'3','3','1','1','6','4','Shas''la',NULL);
INSERT INTO figure VALUES(4,'Fire Warrior',8,'6',5,4,'3','3','1','2','7','4','Shas''ui',1);
INSERT INTO figure VALUES(5,'Fire Warrior',0,'-',NULL,4,'3','3','1','0','4','4','DS8 Tactical Support Turret',1);
INSERT INTO figure VALUES(6,'Pathfinder',6,'7',5,4,'3','3','1','1','6','5','Pathfinder',NULL);
INSERT INTO figure VALUES(7,'Pathfinder',7,'7',5,4,'3','3','1','1','6','5','Gunner',3);
INSERT INTO figure VALUES(8,'Pathfinder',7,'7',5,4,'3','3','1','2','7','5','Shas''ui',1);
INSERT INTO figure VALUES(9,'Fire Warrior Breacher',8,'6',5,4,'3','3','1','1','6','4','Breacher Shas''la',NULL);
INSERT INTO figure VALUES(10,'Fire Warrior Breacher',8,'6',5,4,'3','3','1','2','7','4','Breacher Shas''ui',1);
INSERT INTO figure VALUES(11,'Fire Warrior Breacher',0,'',NULL,4,'3','3','1','0','4','4','DS8 Tactical Support Turret',1);
INSERT INTO figure VALUES(12,'XV25 Stealth Battlesuit',20,'8',5,4,'4','4','2','2','7','3','Steath Shas''ui',NULL);
INSERT INTO figure VALUES(13,'XV25 Stealth Battlesuit',20,'8',5,4,'4','4','2','3','8','3','Stealth Shas''vre',1);
INSERT INTO figure VALUES(14,'Drone',7,'8',5,5,'3','4','1','1','6','5','MV1 Gun',NULL);
INSERT INTO figure VALUES(15,'Drone',7,'8',5,5,'3','4','1','1','6','5','MV4 Shield',NULL);
INSERT INTO figure VALUES(16,'Drone',7,'8',5,5,'3','4','1','1','6','5','MV7 Marker',NULL);
INSERT INTO figure VALUES(17,'Drone',7,'8',5,5,'3','4','1','1','6','5','MV36 Guardian',1);
INSERT INTO figure VALUES(18,'Drone',7,'8',5,5,'3','4','1','1','6','5','MV33 Guardian',1);
INSERT INTO figure VALUES(19,'Drone',7,'8',5,5,'3','4','1','1','6','5','MV31 Pulse Accelerator',1);
INSERT INTO figure VALUES(20,'Drone',7,'8',5,5,'3','4','2','1','6','5','MB3 Recon',1);
INSERT INTO figure VALUES(21,'Kommando',8,'6',3,5,'4','4','1','2','6','6','',NULL);
INSERT INTO figure VALUES(22,'Boss Nob',12,'6',3,5,'4','4','2','3','6','6','Kommando',1);
INSERT INTO figure VALUES(23,'Gretchen',3,'5',5,4,'2','2','1','1','6','6','',NULL);
INSERT INTO figure VALUES(24,'Flash Git',23,'5',3,3,'5','4','2','3','6','4','',NULL);
INSERT INTO figure VALUES(25,'Skitarii Ranger',9,'6',4,3,'3','3','1','1','6','4','',NULL);
INSERT INTO figure VALUES(26,'Skitarii Ranger',10,'6',4,3,'3','3','1','1','6','4','Gunner',3);
INSERT INTO figure VALUES(27,'Skitarii Ranger',10,'6',4,3,'3','3','1','2','7','4','Alpha',1);
INSERT INTO figure VALUES(28,'Skitarii Vanguard',9,'6',4,3,'3','3','1','1','6','4','',NULL);
INSERT INTO figure VALUES(29,'Skitarii Vanguard',10,'6',4,3,'3','3','1','1','6','4','Gunner',3);
INSERT INTO figure VALUES(30,'Skitarii Vanguard',10,'6',4,3,'3','3','1','2','7','4','Alpha',1);
INSERT INTO figure VALUES(31,'Sicarian Ruststalker',14,'8',3,3,'4','3','2','3','6','4','',NULL);
INSERT INTO figure VALUES(32,'Sicarian Ruststalker',15,'8',3,3,'4','3','2','4','7','4','Princeps',1);
INSERT INTO figure VALUES(33,'Sicarian Infiltrator',14,'8',3,3,'4','3','2','2','6','4','',NULL);
INSERT INTO figure VALUES(34,'Sicarian Infiltrator',15,'8',3,3,'4','3','2','3','7','4','Princeps',1);
INSERT INTO figure VALUES(35,'Boss Nob',16,'5',3,5,'5','4','2','3','7','6','Boss Nob',1);
INSERT INTO figure VALUES(36,'Scout',10,'6',3,3,'4','4','1','1','7','4','',NULL);
INSERT INTO figure VALUES(37,'Scout',11,'6',3,3,'4','4','1','1','7','4','Gunner',2);
INSERT INTO figure VALUES(38,'Scout',11,'6',3,3,'4','4','1','2','8','4','Sergeant',1);
INSERT INTO figure VALUES(39,'Tactical Marine',12,'6',3,3,'4','4','1','1','7','3','',NULL);
INSERT INTO figure VALUES(40,'Tactical Marine',13,'6',3,3,'4','4','1','1','7','3','Gunner',2);
INSERT INTO figure VALUES(41,'Tactical Marine',13,'6',3,3,'4','4','1','2','8','3','Sergeant',1);
INSERT INTO figure VALUES(42,'Reiver',16,'6',3,3,'4','4','2','2','7','3','',NULL);
INSERT INTO figure VALUES(43,'Reiver',17,'6',3,3,'4','4','2','3','8','3','Sergeant',1);
INSERT INTO figure VALUES(44,'Intercessor',15,'6',3,3,'4','4','2','2','7','3','',NULL);
INSERT INTO figure VALUES(45,'Intercessor',16,'6',3,3,'4','4','2','2','7','3','Gunner',2);
INSERT INTO figure VALUES(46,'Intercessor',16,'6',3,3,'4','4','2','3','8','3','Sergeant',1);
CREATE TABLE wargear (
	id INTEGER NOT NULL, 
	name TEXT, 
	wargear_range TEXT, 
	wargear_type TEXT, 
	strength TEXT, 
	ap TEXT, 
	damage TEXT, points integer, profile text, 
	PRIMARY KEY (id)
);
INSERT INTO wargear VALUES(1,'Gunthing','5','Heavy 4','6','-1','1',NULL,NULL);
INSERT INTO wargear VALUES(2,'Choppa','Melee','Melee','User','0','1',NULL,NULL);
INSERT INTO wargear VALUES(3,'Slugga','','Pistol 1','4','0','1',NULL,NULL);
INSERT INTO wargear VALUES(4,'Burst Cannon','18','Assault 4','5','0','1',0,NULL);
INSERT INTO wargear VALUES(5,'Fusion Blaster','18','Assault 1','8','-4','D6',4,NULL);
INSERT INTO wargear VALUES(6,'Ion rifle','30','Rapid Fire 1','7','-1','1',3,'Standard');
INSERT INTO wargear VALUES(7,'Ion rifle','30','Heavy D3','8','-1','2',3,'Overcharge');
INSERT INTO wargear VALUES(8,'Markerlight','36','Heavy 1','-','-','-',0,'');
INSERT INTO wargear VALUES(9,'Missile Pod','36','Assault 2','7','-1','D3',7,'');
INSERT INTO wargear VALUES(10,'Photon Grenade','12','Grenade D6','7','-1','D3',0,'');
INSERT INTO wargear VALUES(11,'Pulse blaster','5','Assault 2','6','-2','1',0,'Close range');
INSERT INTO wargear VALUES(12,'Pulse blaster','10','Assault 2','5','-1','1',0,'Medium Range');
INSERT INTO wargear VALUES(13,'Pulse blaster','15','Assault 2','4','0','1',0,'Long range');
INSERT INTO wargear VALUES(14,'Pulse carbine','18','Assault 2','5','0','1',0,'');
INSERT INTO wargear VALUES(15,'Pulse pistol','30','Rapid Fire 1','5','0','1',0,'');
INSERT INTO wargear VALUES(16,'Pulse rifle','30','Rapid Fire 1','5','0','1',0,'');
INSERT INTO wargear VALUES(17,'Rail rifle','30','Rapid Fire 1','6','-4','D3',5,'');
INSERT INTO wargear VALUES(18,'Smart missile system','30','Heavy 4','5','0','1',5,'');
INSERT INTO wargear VALUES(19,'Stikkbomb','6','Grenade D6','3','0','1',0,'');
INSERT INTO wargear VALUES(20,'Power Klaw','Melee','Melee','x2','3','D3',5,'');
INSERT INTO wargear VALUES(21,'Grot Blasta','12','Pistol 1','3','0','1',0,'');
INSERT INTO wargear VALUES(22,'Snazzgun','24','Heavy 3','6','2','2',0,'');
INSERT INTO wargear VALUES(23,'Gitfinda Squig','','','','','',4,'');
INSERT INTO wargear VALUES(24,'Arc Pistol','12','Pistol 1','6','-1','1',0,'');
INSERT INTO wargear VALUES(25,'Arc Rifle','24','Rapid Fire 1','6','-1','1',0,'');
INSERT INTO wargear VALUES(26,'Flechette blaster','12','Pistol 5','3','0','1',0,'');
INSERT INTO wargear VALUES(27,'Galvanic Rifle','30','Rapid Fire 1','4','0','1',0,'');
INSERT INTO wargear VALUES(28,'Phosphor blast pistol','12','Pistol 1','5','-1','1',0,'');
INSERT INTO wargear VALUES(29,'Plasma caliver','18','Assault 2','7','-3','1',3,'Standard');
INSERT INTO wargear VALUES(30,'Plasma caliver','18','Assault 2','8','-3','2',3,'Supercharge');
INSERT INTO wargear VALUES(31,'Radium carbine','18','Assault 3','3','0','1',0,'');
INSERT INTO wargear VALUES(32,'Radium pistol','12','Pistol 1','3','0','1',0,'');
INSERT INTO wargear VALUES(33,'Stubcarbine','18','Pistol 3','4','0','1',NULL,'');
INSERT INTO wargear VALUES(34,'Transuranic arquebus','60','Heavy 1','7','-2','D3',5,'');
INSERT INTO wargear VALUES(35,'Arc maul','Melee','Melee','+2','-1','1',0,'');
INSERT INTO wargear VALUES(36,'Chordclaw','Melee','Melee','User','0','D3',1,'');
INSERT INTO wargear VALUES(37,'Power sword','Melee','Melee','User','-3','1',0,'');
INSERT INTO wargear VALUES(38,'Taser goad','Melee','Melee','+2','0','1',1,'');
INSERT INTO wargear VALUES(39,'Transonic blades','Melee','Melee','+1','0','1',0,'');
INSERT INTO wargear VALUES(40,'Transonic razor','Melee','Melee','User','0','1',0,'');
INSERT INTO wargear VALUES(41,'Enhanced data-tether','','','','','',5,'');
INSERT INTO wargear VALUES(42,'Omnispex','','','','','',1,'');
INSERT INTO wargear VALUES(43,'Astartes Shotgun','12','Assault 2','4','0','1',0,'');
INSERT INTO wargear VALUES(44,'Auto bolt rifle','24','Assault 2','4','0','1',0,'');
INSERT INTO wargear VALUES(45,'Bolt carbine','24','Assault 2','4','0','1',0,'');
INSERT INTO wargear VALUES(46,'Bolt pistol','12','Pistol 1','4','0','1',0,'');
INSERT INTO wargear VALUES(47,'Bolt rifle','30','Rapid Fire 1','4','-1','1',0,'');
INSERT INTO wargear VALUES(48,'Boltgun','24','Rapid Fire 1','4','0','1',0,'');
INSERT INTO wargear VALUES(49,'Combi-flamer','24','Rapid Fire 1','4','0','1',3,'Boltgun');
INSERT INTO wargear VALUES(50,'Combi-flamer','8','Assault D6','4','0','1',3,'Flamer');
INSERT INTO wargear VALUES(51,'Combi-grav','24','Rapid Fire 1','4','0','1',2,'Boltgun');
INSERT INTO wargear VALUES(52,'Combi-grav','18','Rapid Fire 1','5','-3','1',2,'Grav-gun');
INSERT INTO wargear VALUES(53,'Combi-melta','24','Rapid Fire 1','4','0','1',3,'Boltgun');
INSERT INTO wargear VALUES(54,'Combi-melta','12','Assault 1','8','-4','D6',3,'Meltgun');
INSERT INTO wargear VALUES(55,'Combi-plasma','24','Rapid Fire 1','4','0','1',4,'Boltgun');
INSERT INTO wargear VALUES(56,'Combi-plasma','24','Rapid Fire 1','7','-3','1',4,'Plasma gun');
INSERT INTO wargear VALUES(57,'Flamer','8','Assault D6','3','0','1',3,'');
INSERT INTO wargear VALUES(58,'Frag grenade','6','Grenade D6','3','0','1',0,'');
INSERT INTO wargear VALUES(59,'Grav-gun','18','Rapid Fire 1','5','-3','1',2,'');
INSERT INTO wargear VALUES(60,'Grav-pistol','12','Pistol 1','5','-3','1',1,'');
INSERT INTO wargear VALUES(61,'Target lock','','','','','',1,'');
INSERT INTO wargear VALUES(62,'Heavy bolt pistol','12','Pistol 1','4','-1','1',0,'');
INSERT INTO wargear VALUES(63,'Heavy bolter','36','Heavy 3','5','-1','1',3,'');
INSERT INTO wargear VALUES(64,'Krak grenade','6','Grenade 1','6','-1','D3',0,'');
INSERT INTO wargear VALUES(65,'Meltagun','12','Assault 1','8','-4','D6',3,'');
INSERT INTO wargear VALUES(66,'Missile launcher','48','Heavy D6','4','0','1',5,'Frag missile');
INSERT INTO wargear VALUES(67,'Missile launcher','48','Heavy 1','8','-2','D6',5,'Heavy 1');
INSERT INTO wargear VALUES(68,'Plasma gun','24','Rapid Fire 1','7','-3','1',3,'Standard');
INSERT INTO wargear VALUES(69,'Plasma gun','24','Rapid Fire 1','8','-3','2',3,'Supercharge');
INSERT INTO wargear VALUES(70,'Plasma pistol','12','Pistol 1','7','-3','1',1,'Standard');
INSERT INTO wargear VALUES(71,'Plasma pistol','12','Pistol 1','8','-3','2',1,'Supercharge');
INSERT INTO wargear VALUES(72,'Shock grenade','6','Grenade D3','','','',0,'');
INSERT INTO wargear VALUES(73,'Sniper rifle','36','Heavy 1','4','0','1',1,'');
INSERT INTO wargear VALUES(74,'Stalker bolt rifle','36','Heavy 1','4','-2','1',0,'');
INSERT INTO wargear VALUES(75,'Chainsword','Melee','Melee','User','0','1',0,'');
INSERT INTO wargear VALUES(76,'Combat knife','Melee','Melee','User','0','1',0,'');
INSERT INTO wargear VALUES(77,'Power fist','Melee','Melee','x2','-3','D3',4,'');
INSERT INTO wargear VALUES(78,'Power sword','Melee','Melee','User','-3','1',2,'');
INSERT INTO wargear VALUES(79,'Auspex','','','','','',1,'');
INSERT INTO wargear VALUES(80,'Auxiliary grenade launcher','','','','','',0,'');
INSERT INTO wargear VALUES(81,'Camo cloak','','','','','',1,'');
INSERT INTO wargear VALUES(82,'Grapnel launcher','','','','','',1,'');
INSERT INTO wargear VALUES(83,'Grav-chute','','','','','',1,'');
CREATE TABLE keyword (
	id INTEGER NOT NULL, 
	label TEXT, faction_keyword boolean, names text, 
	PRIMARY KEY (id)
);
INSERT INTO keyword VALUES(1,'T''au Empire',TRUE,'');
INSERT INTO keyword VALUES(2,'Ork',TRUE,'');
INSERT INTO keyword VALUES(3,'Infantry',FALSE,'');
INSERT INTO keyword VALUES(4,'Kommando',FALSE,'');
INSERT INTO keyword VALUES(5,'Nob',FALSE,'');
INSERT INTO keyword VALUES(6,'Gretchen',FALSE,'');
INSERT INTO keyword VALUES(7,'Evil Sunz',FALSE,'');
INSERT INTO keyword VALUES(8,'Fire Warrior',FALSE,'');
INSERT INTO keyword VALUES(9,'Pathfinder',FALSE,'');
INSERT INTO keyword VALUES(10,'Fire Warrior Breacher',FALSE,'');
INSERT INTO keyword VALUES(11,'Battlesuit',FALSE,'');
INSERT INTO keyword VALUES(12,'Jet Pack',FALSE,'');
INSERT INTO keyword VALUES(13,'Fly',FALSE,'');
INSERT INTO keyword VALUES(14,'XV25 Stealth Battlesuit',FALSE,'');
INSERT INTO keyword VALUES(15,'Drone',FALSE,'');
INSERT INTO keyword VALUES(16,'Common',FALSE,'');
INSERT INTO keyword VALUES(17,'Specialist',FALSE,'');
INSERT INTO keyword VALUES(18,'Leader',FALSE,NULL);
INSERT INTO keyword VALUES(19,'Combat',FALSE,NULL);
INSERT INTO keyword VALUES(20,'Comms',FALSE,NULL);
INSERT INTO keyword VALUES(21,'Demolitions',FALSE,NULL);
INSERT INTO keyword VALUES(22,'Heavy',FALSE,NULL);
INSERT INTO keyword VALUES(23,'Kommando',NULL,'Kommando');
INSERT INTO keyword VALUES(24,'Common',NULL,'');
INSERT INTO keyword VALUES(25,'Gretchen',NULL,'Gretchen');
INSERT INTO keyword VALUES(26,'Freebooterz',NULL,'Freebooterz');
INSERT INTO keyword VALUES(27,'Flash Git',NULL,'Flash Git');
INSERT INTO keyword VALUES(28,'Adeptus Mechanicus',NULL,'');
INSERT INTO keyword VALUES(29,'Imperium',NULL,'');
INSERT INTO keyword VALUES(30,'Skitarii',NULL,'');
INSERT INTO keyword VALUES(31,'Skitarri Ranger',NULL,'');
INSERT INTO keyword VALUES(32,'Skitarii Vanguard',NULL,'');
INSERT INTO keyword VALUES(33,'Skitari Ruststalker',NULL,'');
INSERT INTO keyword VALUES(34,'Sicarian Infiltrator',NULL,'');
INSERT INTO keyword VALUES(35,'Adeptus Astartes',NULL,'');
INSERT INTO keyword VALUES(38,'Scout',NULL,'');
INSERT INTO keyword VALUES(39,'Tactical Marine',NULL,'');
INSERT INTO keyword VALUES(40,'Primaris',NULL,'');
INSERT INTO keyword VALUES(41,'Reiver',NULL,'');
INSERT INTO keyword VALUES(42,'Intercessor',NULL,'');
CREATE TABLE ability (
	id INTEGER NOT NULL, 
	name TEXT, 
	text TEXT, 
	PRIMARY KEY (id)
);
INSERT INTO ability VALUES(1,'Choppa','Each time the bearer fights, it can make 1 additional attack with this weapon');
INSERT INTO ability VALUES(2,'Fusion blaster','If the target is within half range of this weapon, roll two dice when inflicting damage with it and discard the lowest result');
INSERT INTO ability VALUES(3,'Ion rifle overcharge','If you make one or more unmodified hit rolls of 1, the bearer suffers a mortal wound after all of this weapon''s shots have been resolved');
INSERT INTO ability VALUES(4,'Markerlights','Markerlights');
INSERT INTO ability VALUES(5,'Photon grenade','This weapon does not inflict any damage. Your opponent must subtract 1 from hit rolls made for INFANTRY models that have suffered any hits from photon grenades until the end of the battle round');
INSERT INTO ability VALUES(6,'Rail rifle','For each wound roll of 6+ made for this weapon, the target model suffers a mortal wound in addition to the normal damage');
INSERT INTO ability VALUES(7,'Smart missile system','This weapon can be fired at models that are not visible to the bearer. If the target is not visible to the bearer, a 6 is required for a successful hit roll, irrespective of the firing model''s Ballistic Skill or any modifiers.');
INSERT INTO ability VALUES(8,'Support Subroutines','Drones cannot be specialists, are not part of a fire team and cannot gain experience.');
INSERT INTO ability VALUES(9,'For the Greater Good','When an enemy model declares a charge against a model from your kill team, models from your kill team with this ability within 6" of one of the charging model''s targets may fire Overwatch as if they were also targeted. Once a model has done so, they cannot fire Overwatch or Retreat for the rest of the phase.');
INSERT INTO ability VALUES(10,'Bonding Knife Ritual','You can subtract 1 from Nerve tests for Breacher Shas’las or Breacher Shas’uis from your kill team within 3" of any friendly models with this ability that are not shaken.');
INSERT INTO ability VALUES(11,'DS8 Tactical Support Turret','A Tactical Support Turret is set up within 2" of the model it accompanies when that model is set up on the battlefield. It is treated as a separate model, but cannot move for any reason. If this model is more than 2" from the model it accompanies at any point, it is removed from the battlefield. It does not count as having been taken out of action. Tactical Support Turrets may not be specialists, are not part of a fire team (pg 204) and do not gain experience.');
INSERT INTO ability VALUES(12,'Target Lock','A model with a target lock does not suffer the penalty to their hit rolls for Advancing and firing Assault weapons.');
INSERT INTO ability VALUES(13,'Camouflage Fields','Your opponent must subtract 1 from all hit rolls for attacks that target this model.');
INSERT INTO ability VALUES(14,'Saviour Protocols','If a DRONE is within 3" of a friendly T’AU EMPIRE INFANTRY model when an enemy attack successfully wounds it, you can inflict a mortal wound on the Drone, and the target model does not suffer any damage from this attack.');
INSERT INTO ability VALUES(15,'Gravity Wave Projector (MV33 Grav-inhibitor Drone)','Enemy models beginning a charge move within 12" of any Grav-inhibitor Drones reduce their charge distance by D3".');
INSERT INTO ability VALUES(16,'Guardian Fields (Guardian Drone only)','A Guardian Drone has a 5+ invulnerable save. Friendly T’AU EMPIRE models within 6" of this model have a 6+ invulnerable save.');
INSERT INTO ability VALUES(17,'Pulse Accelerator (MV31 Pulse Accelerator Drone only)','Whilst a T’AU EMPIRE INFANTRY model is within 3" of a friendly Pulse Accelerator Drone, increase the Range characteristic of that model’s pulse pistol, pulse carbine or pulse rifle by 6".');
INSERT INTO ability VALUES(18,'Recon Suite (MB3 Recon Drone only)','At the start of the Shooting phase, you can choose a PATHFINDER from your kill team within 6" of a friendly Recon Drone. Until the end of the phase, that model does not suffer penalties to their hit and Injury rolls due to their target being obscured.');
INSERT INTO ability VALUES(19,'Shield Generator','A model with a shield generator has a 4+ invulnerable save.');
INSERT INTO ability VALUES(20,'’Ere We Go',' Re-roll failed charge rolls for a model with this ability.');
INSERT INTO ability VALUES(21,'Sneaky Gits','When an enemy player makes a hit roll for a shooting attack that targets this model, and this model is obscured, that hit roll suffers an additional -1 modifier.');
INSERT INTO ability VALUES(22,'Power Whiff','When attacking with this weapon, you must subtract 1 from the hit roll.');
INSERT INTO ability VALUES(23,'Crazy-gun Show-off','After this model has shot in the Shooting phase, roll a D6. On a 6 the model can immediately shoot again, but can only target the nearest enemy model');
INSERT INTO ability VALUES(24,'Gitfinda Squig','Add 1 to hit rolls for shooting attacks made by a model with a gitfinda squig.');
INSERT INTO ability VALUES(25,'Enhanced Data-tether','You can re-roll failed Nerve tests for SKITARII models while a friendly model with an enhanced data-tether is on the battlefield and not shaken.');
INSERT INTO ability VALUES(26,'Canticles of the Omnissiah','(pg 107)');
INSERT INTO ability VALUES(27,'Bionics','This model has a 6+ invulnerable save.');
INSERT INTO ability VALUES(28,'Omnispex','At the start of each Shooting phase, you can choose another SKITARII model within 3" of a friendly model equipped with an omnispex that is not shaken. That model does not suffer penalties to their hit or injury rolls due to their target being obscured.');
INSERT INTO ability VALUES(29,'Rad-saturation','Reduce the Toughness characteristic of enemy models by 1 whilst they are within 1" of one or more models with this ability.');
INSERT INTO ability VALUES(30,'Neurostatic Aura','Subtract 1 from the Leadership characteristic of enemy models whilst they are within 3" of one or more models with this ability.');
INSERT INTO ability VALUES(31,'Galvanic Rifle','Each time you make a wound roll of 6+ for this weapon, that hit is resolved with an AP of -1.');
INSERT INTO ability VALUES(32,'Phosphor blast pistol','Attacks made with this weapon do not suffer the penalty to hit rolls for the target being obscured.');
INSERT INTO ability VALUES(33,'Plasma caliver','On an unmodified hit roll of 1, the bearer is taken out of action after all of this weapon’s shots have been resolved.');
INSERT INTO ability VALUES(34,'Radium carbine','Each time you make a wound roll of 6+ for this weapon, that hit is resolved with a Damage of 3.');
INSERT INTO ability VALUES(35,'Radium pistol','Each time you make a wound roll of 6+ for this weapon, that hit is resolved with a Damage of 2.');
INSERT INTO ability VALUES(36,'Transuranic arquebus','This weapon cannot be fired if the firing model moved during the Movement phase. A model firing a transuranic arquebus does not suffer the penalty to hit rolls for the target being at long range. Each time you make a wound roll of 6+ for this weapon, it inflicts a mortal wound in addition to the normal damage.');
INSERT INTO ability VALUES(37,'Chordclaw','A chordclaw can only be used to make one attack each time this model fights. Each time you make a wound roll of 6+ with this weapon, the target suffers D3 mortal wounds instead of the normal damage.');
INSERT INTO ability VALUES(38,'','Each hit roll of 6+ with this weapon causes 3 hits rather than 1.');
INSERT INTO ability VALUES(39,'Transonic blades','Each time you make a wound roll of 6+ with this weapon, the target suffers a mortal wound instead of the normal damage.');
INSERT INTO ability VALUES(40,'Transonic razor','Each time you make a wound roll of 6+ with this weapon, the target suffers a mortal wound instead of the normal damage.');
INSERT INTO ability VALUES(41,'And They Shall Know No Fear','You can re-roll failed Nerve tests for this model');
INSERT INTO ability VALUES(42,'Transhuman Physiology','Ignore the penalty to this model''s hit rolls from one flesh wound it has suffered');
INSERT INTO ability VALUES(43,'Grapnel Launcher','A model with a grapnel launcher can climb any distance vertically (up or down) when it makes a normal move – do not measure the distance moved in this way.');
INSERT INTO ability VALUES(44,'Grav-chute','A model with a grav-chute never suffers falling damage, and never falls on another model. If it would, instead place this model as close as possible to the point where it would have landed. This can bring it within 1" of an enemy model.');
INSERT INTO ability VALUES(45,'Terror Troops','Enemy models must subtract 1 from their Leadership if they are within 3" of any Reiver or Reiver Sergeant models.');
INSERT INTO ability VALUES(46,'Auxiliary Grenade Launcher','If a model is armed with an auxiliary grenade launcher, increase the range of any Grenade weapons they have to 30".');
INSERT INTO ability VALUES(47,'Camo Cloak','When an opponent makes a hit roll for a shooting attack that targets a model equipped with a camo cloak, and that model is obscured, that hit roll suffers an additional -1 modifier.');
INSERT INTO ability VALUES(48,'Auspex','At the start of the Shooting phase, you can choose another ADEPTUS ASTARTES model within 3" of a friendly model equipped with an auspex that is not shaken. That model does not suffer penalties to their hit or injury rolls due to their target being obscured.');
INSERT INTO ability VALUES(49,'Astartes Shotgun','If the target is within half range, add 1 to this weapon''s Strength.');
INSERT INTO ability VALUES(50,'Combi-flamer Flamer','This weapon automatically hits its target.');
INSERT INTO ability VALUES(51,'Combi-grav Grav-gun','If the target has a Save characteristic of 3+ or better, this weapon has a Damage of D3.');
INSERT INTO ability VALUES(52,'Combi-melta Meltagun','If the target is within half range of this weapon, roll two dice when inflicting damage with it and discard the lowest result.');
INSERT INTO ability VALUES(53,'Combi-plasma Plasma gun','See plasma gun');
INSERT INTO ability VALUES(54,'Flamer','This weapon automatically hits its target.');
INSERT INTO ability VALUES(55,'Grav-gun','If the target has a Save characteristic of 3+ or better, this weapon has a Damage of D3.');
INSERT INTO ability VALUES(56,'Grav-pistol','If the target has a Save characteristic of 3+ or better, this weapon has a Damage of D3.');
INSERT INTO ability VALUES(57,'Meltagun','If the target is within half range of this weapon, roll two dice when inflicting damage with it and discard the lowest result.');
INSERT INTO ability VALUES(58,'Plasma gun Supercharge','On an unmodified hit roll of 1, the bearer is taken out of action after all of this weapon’s shots have been resolved.');
INSERT INTO ability VALUES(59,'Plasma pistol Supercharge','On an unmodified hit roll of 1, the bearer is taken out of action.');
INSERT INTO ability VALUES(60,'Shock grenade','This weapon does not inflict any damage. If an enemy INFANTRY model is hit by any shock grenades, it is stunned; until the end of the next battle round that model cannot fire Overwatch or be Readied, and your opponent must subtract 1 from hit rolls made for the model.');
INSERT INTO ability VALUES(61,'Sniper rifle','A model firing a sniper rifle does not suffer the penalty to hit rolls for the target being at long range. If you roll a wound roll of 6+ for this weapon, it inflicts a mortal wound in addition to its normal damage.');
INSERT INTO ability VALUES(62,'Chainsword','Each time the bearer fights, it can make 1 additional attack with this weapon.');
INSERT INTO ability VALUES(63,'Combat knife','Each time the bearer fights, it can make 1 additional attack with this weapon.');
INSERT INTO ability VALUES(64,'Power fist','When attacking with this weapon, you must subtract 1 from the hit roll.');
INSERT INTO ability VALUES(65,'Red Ones Go Fasta','Add 1 to the Move characteristic of models in your kill team, and add 1 to Advance and charge rolls made for them. In addition, these models do not suffer the penalty to their hit rolls for shooting Assault weapons during a battle round in which they Advanced');
CREATE TABLE roster (
	id INTEGER NOT NULL, 
	name TEXT, player_name text, 
	PRIMARY KEY (id)
);
INSERT INTO roster VALUES(1,'T''au Viola Sept v1','Mike');
INSERT INTO roster VALUES(2,'Da Ladz','Julian');
INSERT INTO roster VALUES(3,'Ad Mech','Mike');
INSERT INTO roster VALUES(4,'Adeptus Astartes 12/07/2019 Tournament','Dylan');
CREATE TABLE figure_keyword_secondary (
	figure_id INTEGER, 
	keyword_id INTEGER, 
	FOREIGN KEY(figure_id) REFERENCES figure (id), 
	FOREIGN KEY(keyword_id) REFERENCES keyword (id)
);
INSERT INTO figure_keyword_secondary VALUES(2,2);
INSERT INTO figure_keyword_secondary VALUES(2,3);
INSERT INTO figure_keyword_secondary VALUES(3,1);
INSERT INTO figure_keyword_secondary VALUES(3,3);
INSERT INTO figure_keyword_secondary VALUES(3,8);
INSERT INTO figure_keyword_secondary VALUES(4,1);
INSERT INTO figure_keyword_secondary VALUES(4,3);
INSERT INTO figure_keyword_secondary VALUES(4,8);
INSERT INTO figure_keyword_secondary VALUES(5,3);
INSERT INTO figure_keyword_secondary VALUES(5,8);
INSERT INTO figure_keyword_secondary VALUES(6,1);
INSERT INTO figure_keyword_secondary VALUES(6,3);
INSERT INTO figure_keyword_secondary VALUES(6,9);
INSERT INTO figure_keyword_secondary VALUES(7,1);
INSERT INTO figure_keyword_secondary VALUES(7,3);
INSERT INTO figure_keyword_secondary VALUES(7,9);
INSERT INTO figure_keyword_secondary VALUES(8,1);
INSERT INTO figure_keyword_secondary VALUES(8,3);
INSERT INTO figure_keyword_secondary VALUES(8,9);
INSERT INTO figure_keyword_secondary VALUES(9,3);
INSERT INTO figure_keyword_secondary VALUES(9,10);
INSERT INTO figure_keyword_secondary VALUES(10,1);
INSERT INTO figure_keyword_secondary VALUES(10,3);
INSERT INTO figure_keyword_secondary VALUES(10,10);
INSERT INTO figure_keyword_secondary VALUES(11,1);
INSERT INTO figure_keyword_secondary VALUES(11,3);
INSERT INTO figure_keyword_secondary VALUES(11,10);
INSERT INTO figure_keyword_secondary VALUES(12,1);
INSERT INTO figure_keyword_secondary VALUES(12,3);
INSERT INTO figure_keyword_secondary VALUES(12,11);
INSERT INTO figure_keyword_secondary VALUES(12,12);
INSERT INTO figure_keyword_secondary VALUES(12,13);
INSERT INTO figure_keyword_secondary VALUES(12,14);
INSERT INTO figure_keyword_secondary VALUES(13,1);
INSERT INTO figure_keyword_secondary VALUES(13,3);
INSERT INTO figure_keyword_secondary VALUES(13,11);
INSERT INTO figure_keyword_secondary VALUES(13,12);
INSERT INTO figure_keyword_secondary VALUES(13,13);
INSERT INTO figure_keyword_secondary VALUES(13,14);
INSERT INTO figure_keyword_secondary VALUES(14,1);
INSERT INTO figure_keyword_secondary VALUES(14,13);
INSERT INTO figure_keyword_secondary VALUES(14,15);
INSERT INTO figure_keyword_secondary VALUES(15,1);
INSERT INTO figure_keyword_secondary VALUES(15,13);
INSERT INTO figure_keyword_secondary VALUES(15,15);
INSERT INTO figure_keyword_secondary VALUES(16,1);
INSERT INTO figure_keyword_secondary VALUES(16,13);
INSERT INTO figure_keyword_secondary VALUES(16,15);
INSERT INTO figure_keyword_secondary VALUES(17,1);
INSERT INTO figure_keyword_secondary VALUES(17,13);
INSERT INTO figure_keyword_secondary VALUES(17,15);
INSERT INTO figure_keyword_secondary VALUES(18,1);
INSERT INTO figure_keyword_secondary VALUES(18,13);
INSERT INTO figure_keyword_secondary VALUES(18,15);
INSERT INTO figure_keyword_secondary VALUES(19,1);
INSERT INTO figure_keyword_secondary VALUES(19,13);
INSERT INTO figure_keyword_secondary VALUES(19,15);
INSERT INTO figure_keyword_secondary VALUES(20,1);
INSERT INTO figure_keyword_secondary VALUES(20,13);
INSERT INTO figure_keyword_secondary VALUES(20,15);
INSERT INTO figure_keyword_secondary VALUES(21,2);
INSERT INTO figure_keyword_secondary VALUES(21,3);
INSERT INTO figure_keyword_secondary VALUES(21,4);
INSERT INTO figure_keyword_secondary VALUES(22,3);
INSERT INTO figure_keyword_secondary VALUES(22,4);
INSERT INTO figure_keyword_secondary VALUES(23,6);
INSERT INTO figure_keyword_secondary VALUES(24,3);
INSERT INTO figure_keyword_secondary VALUES(24,26);
INSERT INTO figure_keyword_secondary VALUES(24,27);
INSERT INTO figure_keyword_secondary VALUES(25,3);
INSERT INTO figure_keyword_secondary VALUES(25,29);
INSERT INTO figure_keyword_secondary VALUES(25,30);
INSERT INTO figure_keyword_secondary VALUES(25,31);
INSERT INTO figure_keyword_secondary VALUES(26,30);
INSERT INTO figure_keyword_secondary VALUES(26,31);
INSERT INTO figure_keyword_secondary VALUES(26,3);
INSERT INTO figure_keyword_secondary VALUES(26,29);
INSERT INTO figure_keyword_secondary VALUES(27,1);
INSERT INTO figure_keyword_secondary VALUES(27,3);
INSERT INTO figure_keyword_secondary VALUES(27,29);
INSERT INTO figure_keyword_secondary VALUES(27,30);
INSERT INTO figure_keyword_secondary VALUES(27,31);
INSERT INTO figure_keyword_secondary VALUES(28,3);
INSERT INTO figure_keyword_secondary VALUES(28,29);
INSERT INTO figure_keyword_secondary VALUES(28,30);
INSERT INTO figure_keyword_secondary VALUES(28,32);
INSERT INTO figure_keyword_secondary VALUES(29,3);
INSERT INTO figure_keyword_secondary VALUES(29,29);
INSERT INTO figure_keyword_secondary VALUES(29,30);
INSERT INTO figure_keyword_secondary VALUES(29,32);
INSERT INTO figure_keyword_secondary VALUES(30,3);
INSERT INTO figure_keyword_secondary VALUES(30,29);
INSERT INTO figure_keyword_secondary VALUES(30,30);
INSERT INTO figure_keyword_secondary VALUES(30,32);
INSERT INTO figure_keyword_secondary VALUES(31,29);
INSERT INTO figure_keyword_secondary VALUES(32,3);
INSERT INTO figure_keyword_secondary VALUES(32,29);
INSERT INTO figure_keyword_secondary VALUES(32,30);
INSERT INTO figure_keyword_secondary VALUES(32,34);
INSERT INTO figure_keyword_secondary VALUES(33,3);
INSERT INTO figure_keyword_secondary VALUES(33,29);
INSERT INTO figure_keyword_secondary VALUES(33,30);
INSERT INTO figure_keyword_secondary VALUES(33,34);
INSERT INTO figure_keyword_secondary VALUES(34,3);
INSERT INTO figure_keyword_secondary VALUES(34,29);
INSERT INTO figure_keyword_secondary VALUES(34,30);
INSERT INTO figure_keyword_secondary VALUES(34,34);
INSERT INTO figure_keyword_secondary VALUES(36,3);
INSERT INTO figure_keyword_secondary VALUES(36,38);
INSERT INTO figure_keyword_secondary VALUES(36,29);
INSERT INTO figure_keyword_secondary VALUES(37,3);
INSERT INTO figure_keyword_secondary VALUES(37,29);
INSERT INTO figure_keyword_secondary VALUES(37,38);
INSERT INTO figure_keyword_secondary VALUES(38,3);
INSERT INTO figure_keyword_secondary VALUES(38,29);
INSERT INTO figure_keyword_secondary VALUES(38,38);
INSERT INTO figure_keyword_secondary VALUES(39,3);
INSERT INTO figure_keyword_secondary VALUES(39,29);
INSERT INTO figure_keyword_secondary VALUES(39,39);
INSERT INTO figure_keyword_secondary VALUES(40,3);
INSERT INTO figure_keyword_secondary VALUES(40,29);
INSERT INTO figure_keyword_secondary VALUES(40,39);
INSERT INTO figure_keyword_secondary VALUES(41,3);
INSERT INTO figure_keyword_secondary VALUES(41,39);
INSERT INTO figure_keyword_secondary VALUES(41,29);
INSERT INTO figure_keyword_secondary VALUES(42,3);
INSERT INTO figure_keyword_secondary VALUES(42,29);
INSERT INTO figure_keyword_secondary VALUES(42,40);
INSERT INTO figure_keyword_secondary VALUES(42,41);
INSERT INTO figure_keyword_secondary VALUES(43,41);
INSERT INTO figure_keyword_secondary VALUES(43,40);
INSERT INTO figure_keyword_secondary VALUES(43,3);
INSERT INTO figure_keyword_secondary VALUES(43,29);
INSERT INTO figure_keyword_secondary VALUES(44,3);
INSERT INTO figure_keyword_secondary VALUES(44,29);
INSERT INTO figure_keyword_secondary VALUES(44,40);
INSERT INTO figure_keyword_secondary VALUES(44,42);
INSERT INTO figure_keyword_secondary VALUES(45,3);
INSERT INTO figure_keyword_secondary VALUES(45,42);
INSERT INTO figure_keyword_secondary VALUES(45,40);
INSERT INTO figure_keyword_secondary VALUES(45,29);
INSERT INTO figure_keyword_secondary VALUES(46,3);
INSERT INTO figure_keyword_secondary VALUES(46,42);
INSERT INTO figure_keyword_secondary VALUES(46,29);
INSERT INTO figure_keyword_secondary VALUES(46,40);
CREATE TABLE figure_ability_secondary (
	figure_id INTEGER, 
	ability_id INTEGER, 
	FOREIGN KEY(figure_id) REFERENCES figure (id), 
	FOREIGN KEY(ability_id) REFERENCES ability (id)
);
INSERT INTO figure_ability_secondary VALUES(3,9);
INSERT INTO figure_ability_secondary VALUES(3,10);
INSERT INTO figure_ability_secondary VALUES(3,11);
INSERT INTO figure_ability_secondary VALUES(4,9);
INSERT INTO figure_ability_secondary VALUES(4,10);
INSERT INTO figure_ability_secondary VALUES(4,11);
INSERT INTO figure_ability_secondary VALUES(5,9);
INSERT INTO figure_ability_secondary VALUES(5,10);
INSERT INTO figure_ability_secondary VALUES(5,11);
INSERT INTO figure_ability_secondary VALUES(6,9);
INSERT INTO figure_ability_secondary VALUES(6,10);
INSERT INTO figure_ability_secondary VALUES(7,9);
INSERT INTO figure_ability_secondary VALUES(7,10);
INSERT INTO figure_ability_secondary VALUES(8,9);
INSERT INTO figure_ability_secondary VALUES(8,10);
INSERT INTO figure_ability_secondary VALUES(9,9);
INSERT INTO figure_ability_secondary VALUES(9,10);
INSERT INTO figure_ability_secondary VALUES(9,11);
INSERT INTO figure_ability_secondary VALUES(10,9);
INSERT INTO figure_ability_secondary VALUES(10,10);
INSERT INTO figure_ability_secondary VALUES(10,11);
INSERT INTO figure_ability_secondary VALUES(11,9);
INSERT INTO figure_ability_secondary VALUES(11,10);
INSERT INTO figure_ability_secondary VALUES(11,11);
INSERT INTO figure_ability_secondary VALUES(12,9);
INSERT INTO figure_ability_secondary VALUES(12,10);
INSERT INTO figure_ability_secondary VALUES(12,12);
INSERT INTO figure_ability_secondary VALUES(12,13);
INSERT INTO figure_ability_secondary VALUES(13,9);
INSERT INTO figure_ability_secondary VALUES(13,10);
INSERT INTO figure_ability_secondary VALUES(13,12);
INSERT INTO figure_ability_secondary VALUES(13,13);
INSERT INTO figure_ability_secondary VALUES(14,8);
INSERT INTO figure_ability_secondary VALUES(14,9);
INSERT INTO figure_ability_secondary VALUES(14,14);
INSERT INTO figure_ability_secondary VALUES(14,19);
INSERT INTO figure_ability_secondary VALUES(15,8);
INSERT INTO figure_ability_secondary VALUES(15,9);
INSERT INTO figure_ability_secondary VALUES(15,14);
INSERT INTO figure_ability_secondary VALUES(15,19);
INSERT INTO figure_ability_secondary VALUES(16,8);
INSERT INTO figure_ability_secondary VALUES(16,9);
INSERT INTO figure_ability_secondary VALUES(16,14);
INSERT INTO figure_ability_secondary VALUES(16,19);
INSERT INTO figure_ability_secondary VALUES(17,8);
INSERT INTO figure_ability_secondary VALUES(17,9);
INSERT INTO figure_ability_secondary VALUES(17,14);
INSERT INTO figure_ability_secondary VALUES(17,16);
INSERT INTO figure_ability_secondary VALUES(18,8);
INSERT INTO figure_ability_secondary VALUES(18,9);
INSERT INTO figure_ability_secondary VALUES(18,14);
INSERT INTO figure_ability_secondary VALUES(18,15);
INSERT INTO figure_ability_secondary VALUES(19,8);
INSERT INTO figure_ability_secondary VALUES(19,9);
INSERT INTO figure_ability_secondary VALUES(19,14);
INSERT INTO figure_ability_secondary VALUES(19,17);
INSERT INTO figure_ability_secondary VALUES(20,8);
INSERT INTO figure_ability_secondary VALUES(20,9);
INSERT INTO figure_ability_secondary VALUES(20,14);
INSERT INTO figure_ability_secondary VALUES(20,18);
INSERT INTO figure_ability_secondary VALUES(21,21);
INSERT INTO figure_ability_secondary VALUES(21,20);
INSERT INTO figure_ability_secondary VALUES(22,20);
INSERT INTO figure_ability_secondary VALUES(22,21);
INSERT INTO figure_ability_secondary VALUES(24,20);
INSERT INTO figure_ability_secondary VALUES(24,23);
INSERT INTO figure_ability_secondary VALUES(24,24);
INSERT INTO figure_ability_secondary VALUES(25,25);
INSERT INTO figure_ability_secondary VALUES(25,26);
INSERT INTO figure_ability_secondary VALUES(25,27);
INSERT INTO figure_ability_secondary VALUES(25,28);
INSERT INTO figure_ability_secondary VALUES(26,27);
INSERT INTO figure_ability_secondary VALUES(26,28);
INSERT INTO figure_ability_secondary VALUES(26,26);
INSERT INTO figure_ability_secondary VALUES(26,25);
INSERT INTO figure_ability_secondary VALUES(27,25);
INSERT INTO figure_ability_secondary VALUES(27,26);
INSERT INTO figure_ability_secondary VALUES(27,27);
INSERT INTO figure_ability_secondary VALUES(27,28);
INSERT INTO figure_ability_secondary VALUES(28,27);
INSERT INTO figure_ability_secondary VALUES(28,29);
INSERT INTO figure_ability_secondary VALUES(28,26);
INSERT INTO figure_ability_secondary VALUES(28,28);
INSERT INTO figure_ability_secondary VALUES(28,25);
INSERT INTO figure_ability_secondary VALUES(29,27);
INSERT INTO figure_ability_secondary VALUES(29,29);
INSERT INTO figure_ability_secondary VALUES(29,28);
INSERT INTO figure_ability_secondary VALUES(29,26);
INSERT INTO figure_ability_secondary VALUES(29,25);
INSERT INTO figure_ability_secondary VALUES(30,29);
INSERT INTO figure_ability_secondary VALUES(30,25);
INSERT INTO figure_ability_secondary VALUES(30,27);
INSERT INTO figure_ability_secondary VALUES(30,26);
INSERT INTO figure_ability_secondary VALUES(30,28);
INSERT INTO figure_ability_secondary VALUES(31,26);
INSERT INTO figure_ability_secondary VALUES(31,27);
INSERT INTO figure_ability_secondary VALUES(32,27);
INSERT INTO figure_ability_secondary VALUES(32,26);
INSERT INTO figure_ability_secondary VALUES(33,1);
INSERT INTO figure_ability_secondary VALUES(33,26);
INSERT INTO figure_ability_secondary VALUES(33,27);
INSERT INTO figure_ability_secondary VALUES(34,26);
INSERT INTO figure_ability_secondary VALUES(34,27);
INSERT INTO figure_ability_secondary VALUES(33,30);
INSERT INTO figure_ability_secondary VALUES(34,30);
INSERT INTO figure_ability_secondary VALUES(36,41);
INSERT INTO figure_ability_secondary VALUES(36,42);
INSERT INTO figure_ability_secondary VALUES(37,41);
INSERT INTO figure_ability_secondary VALUES(37,42);
INSERT INTO figure_ability_secondary VALUES(38,42);
INSERT INTO figure_ability_secondary VALUES(38,41);
INSERT INTO figure_ability_secondary VALUES(39,42);
INSERT INTO figure_ability_secondary VALUES(39,41);
INSERT INTO figure_ability_secondary VALUES(40,41);
INSERT INTO figure_ability_secondary VALUES(40,42);
INSERT INTO figure_ability_secondary VALUES(41,41);
INSERT INTO figure_ability_secondary VALUES(41,42);
INSERT INTO figure_ability_secondary VALUES(42,41);
INSERT INTO figure_ability_secondary VALUES(42,42);
INSERT INTO figure_ability_secondary VALUES(42,45);
INSERT INTO figure_ability_secondary VALUES(43,42);
INSERT INTO figure_ability_secondary VALUES(43,41);
INSERT INTO figure_ability_secondary VALUES(43,45);
INSERT INTO figure_ability_secondary VALUES(44,41);
INSERT INTO figure_ability_secondary VALUES(44,42);
INSERT INTO figure_ability_secondary VALUES(45,42);
INSERT INTO figure_ability_secondary VALUES(45,41);
INSERT INTO figure_ability_secondary VALUES(46,42);
INSERT INTO figure_ability_secondary VALUES(46,41);
CREATE TABLE wargear_ability_secondary (
	wargear_id INTEGER, 
	ability_id INTEGER, 
	FOREIGN KEY(wargear_id) REFERENCES wargear (id), 
	FOREIGN KEY(ability_id) REFERENCES ability (id)
);
INSERT INTO wargear_ability_secondary VALUES(2,1);
INSERT INTO wargear_ability_secondary VALUES(5,2);
INSERT INTO wargear_ability_secondary VALUES(7,3);
INSERT INTO wargear_ability_secondary VALUES(8,4);
INSERT INTO wargear_ability_secondary VALUES(10,5);
INSERT INTO wargear_ability_secondary VALUES(17,6);
INSERT INTO wargear_ability_secondary VALUES(18,7);
INSERT INTO wargear_ability_secondary VALUES(20,22);
INSERT INTO wargear_ability_secondary VALUES(27,31);
INSERT INTO wargear_ability_secondary VALUES(28,32);
INSERT INTO wargear_ability_secondary VALUES(30,33);
INSERT INTO wargear_ability_secondary VALUES(31,34);
INSERT INTO wargear_ability_secondary VALUES(32,35);
INSERT INTO wargear_ability_secondary VALUES(34,36);
INSERT INTO wargear_ability_secondary VALUES(36,37);
INSERT INTO wargear_ability_secondary VALUES(38,38);
INSERT INTO wargear_ability_secondary VALUES(39,39);
INSERT INTO wargear_ability_secondary VALUES(40,40);
INSERT INTO wargear_ability_secondary VALUES(61,12);
INSERT INTO wargear_ability_secondary VALUES(43,49);
INSERT INTO wargear_ability_secondary VALUES(50,50);
INSERT INTO wargear_ability_secondary VALUES(52,51);
INSERT INTO wargear_ability_secondary VALUES(54,52);
INSERT INTO wargear_ability_secondary VALUES(56,53);
INSERT INTO wargear_ability_secondary VALUES(57,54);
INSERT INTO wargear_ability_secondary VALUES(59,55);
INSERT INTO wargear_ability_secondary VALUES(60,56);
INSERT INTO wargear_ability_secondary VALUES(65,57);
INSERT INTO wargear_ability_secondary VALUES(69,58);
INSERT INTO wargear_ability_secondary VALUES(71,59);
INSERT INTO wargear_ability_secondary VALUES(72,60);
INSERT INTO wargear_ability_secondary VALUES(73,61);
INSERT INTO wargear_ability_secondary VALUES(75,62);
INSERT INTO wargear_ability_secondary VALUES(76,63);
INSERT INTO wargear_ability_secondary VALUES(77,64);
INSERT INTO wargear_ability_secondary VALUES(83,44);
INSERT INTO wargear_ability_secondary VALUES(82,43);
INSERT INTO wargear_ability_secondary VALUES(80,46);
CREATE TABLE tactic (
	id INTEGER NOT NULL, 
	name TEXT, 
	cost INTEGER, 
	text TEXT, 
	keyword_id INTEGER, passive text, 
	PRIMARY KEY (id), 
	FOREIGN KEY(keyword_id) REFERENCES keyword (id)
);
INSERT INTO tactic VALUES(2,'Decisive Move',1,'Use this Tactic at the start of the Movement phase. Pick a model from your kill team and make a move with it before any other models (including an Advance move, Fall Back move or charge attempt if you wish). If another player uses this Tactic, roll off: the winner goes first.',16,NULL);
INSERT INTO tactic VALUES(3,'Decisive Strike',2,'Use this Tactic at the start of the Fight phase. Pick a model from your kill team that is eligible to fight and fight with it before any other models. If another player uses this Tactic, roll off: the winner goes first.',16,NULL);
INSERT INTO tactic VALUES(4,'Decisive Shot',2,'Use this Tactic at the start of the Shooting phase. Pick a model from your kill team that is eligible to shoot and shoot with it before any other models. If another player uses this Tactic, roll off: the winner goes first.',16,NULL);
INSERT INTO tactic VALUES(5,'Insane Bravery',1,'Use this Tactic before taking any Nerve tests in the Morale phase. You can automatically pass a single Nerve test for a model from your kill team.',16,NULL);
INSERT INTO tactic VALUES(6,'Tactical Re-Roll',1,'Re-roll a single Advance roll, charge roll, Psychic test, Deny the Witch test, hit roll, wound roll, saving throw, Injury roll or Nerve test.',16,NULL);
INSERT INTO tactic VALUES(7,'Gritted Teeth',1,'Use this Tactic when you choose a model with one or more flesh wounds to shoot in the Shooting phase or fight in the Fight phase. Until the end of the phase, this model’s attacks do not suffer any penalty to their hit rolls from this model’s flesh wound(s).',16,NULL);
INSERT INTO tactic VALUES(8,'Outflank',1,'Use this Tactic at the end of the Movement phase. Choose a model from your kill team that was set up in Reserve and set them up within 1" of the edge of the battlefield and more than 5" away from any enemy models',16,NULL);
INSERT INTO tactic VALUES(9,'Lead By Example',1,replace(replace('Level 1 Leader Tactic\r\nUse this Tactic when you pick a Leader from\r\nyour kill team to fight in the Fight phase. Choose another friendly model within 3" of them that is eligible to fight. You can fight with each of these models, in an order of your choice, before the next player’s turn.','\r',char(13)),'\n',char(10)),17,NULL);
INSERT INTO tactic VALUES(10,'Up and at Um!',1,replace(replace('Level 1 Combat Tactic\r\nUse this Tactic in the Fight phase, after attacking with a model from your kill team. Pick a Combat specialist from your kill team that has not yet attacked this phase: you can immediately fight with them.','\r',char(13)),'\n',char(10)),19,NULL);
INSERT INTO tactic VALUES(11,'Rousing Transmission',1,replace(replace('Level 1 Comms Tactic\r\nUse this Tactic in the Morale phase before taking any Nerve tests. Until the end of the phase you\r\ncan subtract 1 from Nerve tests for models from your kill team as though the Comms specialist was within 2" of them.','\r',char(13)),'\n',char(10)),17,NULL);
INSERT INTO tactic VALUES(12,'Custom Ammo',1,replace(replace('Level 1 Demolitions Tactic\r\nUse this Tactic when you pick a Demolitions specialist from your kill team to shoot in the Shooting phase. You can add 1 to wound rolls for that model’s ranged weapons in this phase.','\r',char(13)),'\n',char(10)),17,NULL);
INSERT INTO tactic VALUES(13,'More Bullets',1,replace(replace('Level 1 Heavy Tactic\r\nUse this Tactic when you pick a Heavy specialist from your kill team to shoot in the Shooting phase. You can add 1 to the number of shots fired by that model’s ranged weapons, with the exception of weapons that would otherwise fire 1 shot (e.g. an Assault 2 weapon would fire 3 shots, but a Rapid Fire 1 weapon at long range would fire 1 shot) in this Shooting phase.','\r',char(13)),'\n',char(10)),17,NULL);
INSERT INTO tactic VALUES(14,'Stim Shot',1,replace(replace('Level 1 Medic Tactic\r\nUse this Tactic at the start of the Movement phase. Pick a model from your kill team within 2" of a friendly Medic specialist that is not shaken. You can add 1 to Advance rolls and charge rolls for that model, and add 1 to that model’s Attacks characteristic until the end of the battle round.','\r',char(13)),'\n',char(10)),17,NULL);
INSERT INTO tactic VALUES(15,'Quick March ',1,replace(replace('Level 1 Scout Tactic\r\nUse this Tactic when you pick a Scout specialist from your kill team to move in the Movement phase. You can either increase the model’s Move characteristic by 2" this phase or you can re-roll the dice when this model Advances in this phase.','\r',char(13)),'\n',char(10)),17,NULL);
INSERT INTO tactic VALUES(16,'Careful Aim',1,replace(replace('Level 1 Sniper Tactic\r\nUse this Tactic when you choose a Sniper specialist from your kill team to shoot in the Shooting phase. You can add 1 to hit rolls for that model until the end of the phase.','\r',char(13)),'\n',char(10)),17,NULL);
INSERT INTO tactic VALUES(18,'Killing Frenzy',1,replace(replace('Level 1 Zealot Tactic\r\nUse this Tactic when you pick a Zealot specialist from your kill team to fight in the Fight phase. Until the end of the phase, each time you make a hit roll of 6+ for that model you can make an additional attack with the same weapon against the same target. These attacks cannot themselves generate any further attacks.','\r',char(13)),'\n',char(10)),17,NULL);
INSERT INTO tactic VALUES(19,'Uplinked Markerlight',2,'Use this Tactic after an enemy model has been hit by a markerlight fired by a model from your kill team. Place D3+1 markerlight counters next to that model instead of only 1.',1,NULL);
INSERT INTO tactic VALUES(20,'Breach and Clear',1,'Use this Tactic in your turn in the shooting phase, when a FIRE WARRIOR BREACHER from your kill team targets an emey model that is obscured. Re-roll failed wound rolls made for the FIRE WARRIOR BREACHER against that enemy model until the end of this phase.',1,NULL);
INSERT INTO tactic VALUES(21,'Recon Sweep',1,'Use this Tactic in the Shooting phase when you pick a PATHFINDER from your kill team to shoot. Instead of shooting, that model can immediately make a normal move as if it were the Movement phase, but instead of moving up to their Move characteristic they move up to 2D6".',1,NULL);
INSERT INTO tactic VALUES(22,'Stimulant Injector',1,replace(replace('Use this Tactic when a model from your kill team (other than a DRONE) loses a wound. Roll a D6\r\nfor that wound, and each other wound lost by that model for the rest of the phase; on a 5+ that wound is not lost.','\r',char(13)),'\n',char(10)),1,NULL);
INSERT INTO tactic VALUES(23,'KRUMP ’EM!',1,'Use this Tactic when you choose a model in your kill team to fight in the Fight phase. Increase the Strength characteristic of that model by 1 until the end of the phase.',NULL,NULL);
INSERT INTO tactic VALUES(24,'GNASHER SQUIG',2,'Use this Tactic at the start of the Fight phase. Pick an enemy model that is within 1" of any of your models and roll a D6. On a 4+, that enemy model suffers 1 mortal wound.',NULL,NULL);
INSERT INTO tactic VALUES(25,'DAKKA DAKKA DAKKA',1,'Use this Tactic at the start of the Fight phase. Pick an enemy model that is within 1" of any of your models and roll a D6. On a 4+, that enemy model suffers 1 mortal wound.',NULL,NULL);
INSERT INTO tactic VALUES(26,'JUST A FLESH WOUND',2,'Use this Tactic when a model from your kill team is taken out of action. Roll a D6. On a 4+ that model suffers a flesh wound instead.',NULL,NULL);
INSERT INTO tactic VALUES(27,'GROT SHIELD',2,'Use this Tactic at the start of the Shooting phase. Pick a model from your kill team that is within 2" of a GRETCHIN model. Until the end of the phase, while that Gretchin model is on the battlefield, any attacks which target the chosen model are resolved against that Gretchin model instead.',NULL,NULL);
INSERT INTO tactic VALUES(28,'MEK’S SPECIAL STIKKBOMB',2,'Use this Tactic when you choose a model from your kill team to attack with a stikkbomb. Until the end of the phase, change the weapon’s type to Grenade D3 and add 1 to its Strength and Damage characteristics.',NULL,NULL);
INSERT INTO tactic VALUES(29,'KUNNIN’ INFILTRATORS',2,'Use this Tactic at the end of the Movement phase. Choose up to three KOMMANDOmodels from your kill team that were set up in Reserve and set them up anywhere on the battlefield that is more than 5" away from any enemy models.”',NULL,NULL);
INSERT INTO tactic VALUES(30,'DEAD ''ARD',1,'Use this Tactic when a model from your kill team suffers a mortal wound. Roll a D6 for that mortal wound, and each other mortal wound suffered by that model for the rest of the phase: on a 5+ the mortal wound is ignored and has no effect',NULL,NULL);
INSERT INTO tactic VALUES(31,'INDISCRIMINATE DAKKA',1,'Use this Tactic after firing Overwatch with one of your models. You can immediately fire Overwatch again.',NULL,NULL);
INSERT INTO tactic VALUES(32,'PYROMANIAC',1,'Use this Tactic when you choose for a model to shoot with a burna. The burna makes D6 attacks instead of D3 this phase.',NULL,NULL);
INSERT INTO tactic VALUES(33,'ITCHIN'' FOR A FIGHT!',2,'Use this Tactic when you choose a model in your kill team to fight in the Fight phase. You can make one additional attack with that model for each enemy model within 1" of it.',NULL,NULL);
INSERT INTO tactic VALUES(34,'ERE WE GO, ’ERE WE GO!',1,'Use this Tactic after making a charge roll for one of your models. Re-roll one of the dice',NULL,NULL);
INSERT INTO tactic VALUES(35,'WAAAGH!',2,'Use this Tactic when it is your turn to move in the Movement phase and your Leader is on the battlefield and not shaken. For the duration of that phase, add 1" to the Move characteristic of all models in your kill team, and add 1 to their Advance and charge rolls.',NULL,NULL);
INSERT INTO tactic VALUES(36,'CONQUEROR DOCTRINA IMPERATIVE',2,replace(replace('\r\nUse this Tactic when you choose a model in your kill team to fight in the Fight phase. Add 1 to hit rolls for the model until the end of the phase. If the model is within 6" of a friendly model equipped with an enhanced data-tether, you can add 2 to the hit rolls instead.','\r',char(13)),'\n',char(10)),NULL,NULL);
INSERT INTO tactic VALUES(37,'PROTECTOR DOCTRINA IMPERATIVE',2,replace(replace('Use this Tactic when you choose a model in your kill team to shoot in the Shooting phase. Add\r\n1 to hit rolls for the model until the end of the phase. If the model is within 6" of a friendly model equipped with an enhanced data-tether, you can add 2 to the hit rolls instead.','\r',char(13)),'\n',char(10)),NULL,NULL);
INSERT INTO tactic VALUES(38,'Dunestrider',1,replace(replace('Use this Tactic in the Movement phase when a model from your kill team Advances. Roll two dice and pick which result to use when making the Advance roll.\r\n','\r',char(13)),'\n',char(10)),NULL,NULL);
INSERT INTO tactic VALUES(39,'Gloria Mechanicus',1,'Use this Tactic after determining which Canticle of the Omnissiah is in effect this battle round. Randomly determine a Canticle of the Omnissiah – that Canticle is in effect instead.',NULL,NULL);
INSERT INTO tactic VALUES(40,'Death to the Traitors!',1,replace(replace('Use this Tactic when you choose a model from your kill team to fight in the Fight phase. Until the end of that phase, each time you make a hit roll\r\nof 6+ for that model and the target is a HERETIC ASTARTES model, you can immediately make an extra attack against the same model using the same weapon. These attacks cannot themselves generate any further attacks.','\r',char(13)),'\n',char(10)),NULL,NULL);
INSERT INTO tactic VALUES(41,'Honour the Chapter',2,'Use this Tactic at the end of the Fight phase. Pick a model from your kill team. That model can immediately fight an additional time.',NULL,NULL);
INSERT INTO tactic VALUES(42,'Armor of Contempt',1,'Use this Tactic when a model from your kill team suffers a mortal wound. Roll a D6 for that mortal wound, and each other mortal wound suffered by that model for the rest of the phase; on a 5+ the mortal wound is ignored and has no effect.',NULL,NULL);
INSERT INTO tactic VALUES(43,'Hellfire Shells',2,'Use this Tactic when you choose a model in your kill team to shoot with a heavy bolter. You can only make a single hit roll for the weapon this phase, however, if it hits, the target suffers D3 mortal wounds instead of the normal damage.',NULL,NULL);
INSERT INTO tactic VALUES(44,'Masterful Marksmanship',1,'Use this Tactic in the Shooting phase when you choose an INTERCESSOR from your kill team to shoot with a stalker bolt rifle. Until the end of that phase, you can add 1 to hit and wound rolls for that model.',NULL,NULL);
INSERT INTO tactic VALUES(45,'Shock and Awe',2,'Use this Tactic when you declare a REIVER from your kill team will attempt to charge. Before any Overwatch attacks are made, you can make a single shooting attack using this model’s shock grenades against a target of the charge. If the attack is successful, that target may not fire Overwatch this phase in addition to the normal effects of the grenade.',NULL,NULL);
CREATE TABLE specialization (
	id INTEGER NOT NULL, 
	name TEXT, 
	tactic_id INTEGER, passive text, 
	PRIMARY KEY (id), 
	FOREIGN KEY(tactic_id) REFERENCES tactic (id)
);
INSERT INTO specialization VALUES(2,'Leader',9,replace(replace('Resourceful: As long as this model is on the battlefield and not shaken, you\r\ngain an additional Command Point at the beginning of the battle round.','\r',char(13)),'\n',char(10)));
INSERT INTO specialization VALUES(3,'Combat',10,'Expert Fighter: Add 1 to this model’s Attacks characteristic.');
INSERT INTO specialization VALUES(4,'Comms',11,replace(replace('Scanner: Once per Shooting phase, when you pick a\r\nmodel from your kill team to shoot that is within 6" of this model, if this model is not shaken, you can add 1 to hit rolls for that model in this phase.','\r',char(13)),'\n',char(10)));
INSERT INTO specialization VALUES(5,'Demolitions',12,replace(replace('Breacher: You can add 1 to this model’s wound rolls against targets\r\nthat are obscured.','\r',char(13)),'\n',char(10)));
INSERT INTO specialization VALUES(6,'Heavy',13,'Relentless: This model does not suffer the -1 penalty for shooting with a Heavy weapon after moving in the preceding Movement phase, or for shooting an Assault weapon after advancing.');
INSERT INTO specialization VALUES(7,'Medic',14,'Reassuring: This model is never treated as being shaken when taking Nerve tests');
INSERT INTO specialization VALUES(8,'Scout',15,'Swift: You can re-roll Advance rolls for this model.');
INSERT INTO specialization VALUES(9,'Sniper',16,replace(replace('Marksman: You can re-roll hit rolls of 1 for this model\r\nwhen it makes a shooting attack.','\r',char(13)),'\n',char(10)));
INSERT INTO specialization VALUES(10,'Veteran',NULL,replace(replace('Grizzled: This model ignores penalties to its Leadership\r\ncharacteristic and Nerve tests.','\r',char(13)),'\n',char(10)));
INSERT INTO specialization VALUES(11,'Zealot',18,replace(replace('Frenzied: You can add 1 to this model’s Attacks and Strength characteristics in a\r\nbattle round in which they charged.','\r',char(13)),'\n',char(10)));
CREATE TABLE rosterentry (
	id INTEGER NOT NULL, 
	name TEXT, 
	figure_id INTEGER, 
	specialization_id INTEGER, 
	roster_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(figure_id) REFERENCES figure (id), 
	FOREIGN KEY(specialization_id) REFERENCES specialization (id), 
	FOREIGN KEY(roster_id) REFERENCES roster (id)
);
INSERT INTO rosterentry VALUES(1,'Hamulet',13,2,1);
INSERT INTO rosterentry VALUES(2,'Slugga John',21,NULL,2);
INSERT INTO rosterentry VALUES(3,'K1',21,NULL,2);
INSERT INTO rosterentry VALUES(4,'Chumbo',12,8,1);
INSERT INTO rosterentry VALUES(5,'Yammy',12,10,1);
INSERT INTO rosterentry VALUES(6,'Abe',12,0,1);
INSERT INTO rosterentry VALUES(7,'Betsy',14,NULL,1);
INSERT INTO rosterentry VALUES(8,'Ciara',14,NULL,1);
INSERT INTO rosterentry VALUES(9,'Debra',14,NULL,1);
INSERT INTO rosterentry VALUES(10,'Earl',14,NULL,1);
INSERT INTO rosterentry VALUES(11,'Lok'' Nar''osh',22,10,2);
INSERT INTO rosterentry VALUES(12,'Blorpie',21,NULL,2);
INSERT INTO rosterentry VALUES(13,'Norpie',21,NULL,2);
INSERT INTO rosterentry VALUES(14,'Mork''lok',21,NULL,2);
INSERT INTO rosterentry VALUES(15,'K2',21,NULL,2);
INSERT INTO rosterentry VALUES(16,'K3',21,NULL,2);
INSERT INTO rosterentry VALUES(17,'Klambochar',21,NULL,2);
INSERT INTO rosterentry VALUES(18,'Kapn'' Krunk',24,6,2);
INSERT INTO rosterentry VALUES(19,'Commandant Spliff',23,2,2);
INSERT INTO rosterentry VALUES(20,'Stab Lad',2,3,2);
INSERT INTO rosterentry VALUES(21,'Glenn',6,4,NULL);
INSERT INTO rosterentry VALUES(22,'Glenn',6,4,NULL);
INSERT INTO rosterentry VALUES(23,'',6,4,NULL);
INSERT INTO rosterentry VALUES(24,'',6,4,NULL);
INSERT INTO rosterentry VALUES(25,'jeb',8,4,NULL);
INSERT INTO rosterentry VALUES(26,'susan',8,2,NULL);
INSERT INTO rosterentry VALUES(28,'Jebediah',7,4,NULL);
INSERT INTO rosterentry VALUES(30,'Hank',7,0,NULL);
INSERT INTO rosterentry VALUES(31,'',7,0,NULL);
INSERT INTO rosterentry VALUES(32,'',7,NULL,NULL);
INSERT INTO rosterentry VALUES(33,'Orange',7,0,1);
INSERT INTO rosterentry VALUES(34,'Red',7,0,1);
INSERT INTO rosterentry VALUES(35,'Twinnie',4,0,NULL);
INSERT INTO rosterentry VALUES(36,'Bossy',4,2,1);
INSERT INTO rosterentry VALUES(37,'Yellow',7,0,1);
INSERT INTO rosterentry VALUES(38,'Normie',7,0,1);
INSERT INTO rosterentry VALUES(39,'Pulsey',6,0,1);
INSERT INTO rosterentry VALUES(40,'Deppy',25,3,3);
INSERT INTO rosterentry VALUES(41,'',NULL,NULL,NULL);
INSERT INTO rosterentry VALUES(42,'',NULL,NULL,NULL);
INSERT INTO rosterentry VALUES(43,'Abbey',39,0,4);
INSERT INTO rosterentry VALUES(44,'Betsy',46,2,4);
CREATE TABLE rosterentry_wargear_secondary (
	rosterentry_id INTEGER, 
	wargear_id INTEGER, 
	FOREIGN KEY(rosterentry_id) REFERENCES rosterentry (id), 
	FOREIGN KEY(wargear_id) REFERENCES wargear (id)
);
INSERT INTO rosterentry_wargear_secondary VALUES(2,2);
INSERT INTO rosterentry_wargear_secondary VALUES(2,3);
INSERT INTO rosterentry_wargear_secondary VALUES(3,2);
INSERT INTO rosterentry_wargear_secondary VALUES(3,3);
INSERT INTO rosterentry_wargear_secondary VALUES(2,19);
INSERT INTO rosterentry_wargear_secondary VALUES(3,19);
INSERT INTO rosterentry_wargear_secondary VALUES(4,4);
INSERT INTO rosterentry_wargear_secondary VALUES(5,4);
INSERT INTO rosterentry_wargear_secondary VALUES(7,14);
INSERT INTO rosterentry_wargear_secondary VALUES(8,14);
INSERT INTO rosterentry_wargear_secondary VALUES(9,14);
INSERT INTO rosterentry_wargear_secondary VALUES(10,14);
INSERT INTO rosterentry_wargear_secondary VALUES(11,3);
INSERT INTO rosterentry_wargear_secondary VALUES(11,20);
INSERT INTO rosterentry_wargear_secondary VALUES(12,2);
INSERT INTO rosterentry_wargear_secondary VALUES(12,3);
INSERT INTO rosterentry_wargear_secondary VALUES(13,2);
INSERT INTO rosterentry_wargear_secondary VALUES(13,3);
INSERT INTO rosterentry_wargear_secondary VALUES(14,2);
INSERT INTO rosterentry_wargear_secondary VALUES(14,3);
INSERT INTO rosterentry_wargear_secondary VALUES(15,3);
INSERT INTO rosterentry_wargear_secondary VALUES(15,2);
INSERT INTO rosterentry_wargear_secondary VALUES(16,3);
INSERT INTO rosterentry_wargear_secondary VALUES(16,2);
INSERT INTO rosterentry_wargear_secondary VALUES(17,2);
INSERT INTO rosterentry_wargear_secondary VALUES(17,3);
INSERT INTO rosterentry_wargear_secondary VALUES(18,22);
INSERT INTO rosterentry_wargear_secondary VALUES(18,2);
INSERT INTO rosterentry_wargear_secondary VALUES(18,23);
INSERT INTO rosterentry_wargear_secondary VALUES(19,21);
INSERT INTO rosterentry_wargear_secondary VALUES(20,3);
INSERT INTO rosterentry_wargear_secondary VALUES(20,20);
INSERT INTO rosterentry_wargear_secondary VALUES(1,5);
INSERT INTO rosterentry_wargear_secondary VALUES(21,14);
INSERT INTO rosterentry_wargear_secondary VALUES(22,14);
INSERT INTO rosterentry_wargear_secondary VALUES(23,17);
INSERT INTO rosterentry_wargear_secondary VALUES(24,17);
INSERT INTO rosterentry_wargear_secondary VALUES(25,17);
INSERT INTO rosterentry_wargear_secondary VALUES(26,17);
INSERT INTO rosterentry_wargear_secondary VALUES(28,17);
INSERT INTO rosterentry_wargear_secondary VALUES(30,17);
INSERT INTO rosterentry_wargear_secondary VALUES(31,17);
INSERT INTO rosterentry_wargear_secondary VALUES(32,17);
INSERT INTO rosterentry_wargear_secondary VALUES(33,17);
INSERT INTO rosterentry_wargear_secondary VALUES(34,17);
INSERT INTO rosterentry_wargear_secondary VALUES(35,10);
INSERT INTO rosterentry_wargear_secondary VALUES(35,16);
INSERT INTO rosterentry_wargear_secondary VALUES(36,10);
INSERT INTO rosterentry_wargear_secondary VALUES(36,16);
INSERT INTO rosterentry_wargear_secondary VALUES(6,4);
INSERT INTO rosterentry_wargear_secondary VALUES(1,61);
INSERT INTO rosterentry_wargear_secondary VALUES(37,17);
INSERT INTO rosterentry_wargear_secondary VALUES(38,17);
INSERT INTO rosterentry_wargear_secondary VALUES(39,8);
INSERT INTO rosterentry_wargear_secondary VALUES(39,10);
INSERT INTO rosterentry_wargear_secondary VALUES(39,14);
INSERT INTO rosterentry_wargear_secondary VALUES(40,25);
INSERT INTO rosterentry_wargear_secondary VALUES(43,46);
INSERT INTO rosterentry_wargear_secondary VALUES(43,48);
INSERT INTO rosterentry_wargear_secondary VALUES(43,58);
INSERT INTO rosterentry_wargear_secondary VALUES(43,64);
INSERT INTO rosterentry_wargear_secondary VALUES(44,44);
INSERT INTO rosterentry_wargear_secondary VALUES(44,46);
INSERT INTO rosterentry_wargear_secondary VALUES(44,58);
INSERT INTO rosterentry_wargear_secondary VALUES(44,64);
CREATE TABLE faction (
	id INTEGER NOT NULL, 
	name TEXT, 
	keyword_id INTEGER, is_subfaction boolean default FALSE, 
	PRIMARY KEY (id), 
	FOREIGN KEY(keyword_id) REFERENCES keyword (id)
);
INSERT INTO faction VALUES(1,'T''au Empire',1,0);
INSERT INTO faction VALUES(2,'Orks',2,0);
INSERT INTO faction VALUES(3,'Common',16,0);
INSERT INTO faction VALUES(4,'Evil Sunz',7,1);
INSERT INTO faction VALUES(5,'Adeptus Mechanicus',28,0);
INSERT INTO faction VALUES(6,'Adeptus Astartes',35,0);
CREATE TABLE faction_ability_secondary (
	faction_id INTEGER, 
	ability_id INTEGER, 
	FOREIGN KEY(faction_id) REFERENCES faction (id), 
	FOREIGN KEY(ability_id) REFERENCES ability (id)
);
INSERT INTO faction_ability_secondary VALUES(5,25);
INSERT INTO faction_ability_secondary VALUES(5,26);
INSERT INTO faction_ability_secondary VALUES(5,27);
INSERT INTO faction_ability_secondary VALUES(5,28);
INSERT INTO faction_ability_secondary VALUES(5,29);
INSERT INTO faction_ability_secondary VALUES(5,30);
INSERT INTO faction_ability_secondary VALUES(4,65);
CREATE TABLE figure_faction_secondary (
	figure_id INTEGER, 
	faction_id INTEGER, 
	FOREIGN KEY(figure_id) REFERENCES figure (id), 
	FOREIGN KEY(faction_id) REFERENCES faction (id)
);
INSERT INTO figure_faction_secondary VALUES(2,2);
INSERT INTO figure_faction_secondary VALUES(22,2);
INSERT INTO figure_faction_secondary VALUES(23,2);
INSERT INTO figure_faction_secondary VALUES(24,2);
INSERT INTO figure_faction_secondary VALUES(25,5);
INSERT INTO figure_faction_secondary VALUES(26,5);
INSERT INTO figure_faction_secondary VALUES(27,5);
INSERT INTO figure_faction_secondary VALUES(28,5);
INSERT INTO figure_faction_secondary VALUES(29,5);
INSERT INTO figure_faction_secondary VALUES(30,5);
INSERT INTO figure_faction_secondary VALUES(31,5);
INSERT INTO figure_faction_secondary VALUES(32,5);
INSERT INTO figure_faction_secondary VALUES(33,5);
INSERT INTO figure_faction_secondary VALUES(34,5);
INSERT INTO figure_faction_secondary VALUES(35,2);
INSERT INTO figure_faction_secondary VALUES(36,6);
INSERT INTO figure_faction_secondary VALUES(37,6);
INSERT INTO figure_faction_secondary VALUES(38,6);
INSERT INTO figure_faction_secondary VALUES(39,6);
INSERT INTO figure_faction_secondary VALUES(40,6);
INSERT INTO figure_faction_secondary VALUES(41,6);
INSERT INTO figure_faction_secondary VALUES(42,6);
INSERT INTO figure_faction_secondary VALUES(43,6);
INSERT INTO figure_faction_secondary VALUES(44,6);
INSERT INTO figure_faction_secondary VALUES(45,6);
INSERT INTO figure_faction_secondary VALUES(46,6);
INSERT INTO figure_faction_secondary VALUES(3,1);
INSERT INTO figure_faction_secondary VALUES(4,1);
INSERT INTO figure_faction_secondary VALUES(5,1);
INSERT INTO figure_faction_secondary VALUES(6,1);
INSERT INTO figure_faction_secondary VALUES(7,1);
INSERT INTO figure_faction_secondary VALUES(8,1);
INSERT INTO figure_faction_secondary VALUES(9,1);
INSERT INTO figure_faction_secondary VALUES(10,1);
INSERT INTO figure_faction_secondary VALUES(11,1);
INSERT INTO figure_faction_secondary VALUES(12,1);
INSERT INTO figure_faction_secondary VALUES(13,1);
INSERT INTO figure_faction_secondary VALUES(14,1);
INSERT INTO figure_faction_secondary VALUES(15,1);
INSERT INTO figure_faction_secondary VALUES(16,1);
INSERT INTO figure_faction_secondary VALUES(17,1);
INSERT INTO figure_faction_secondary VALUES(18,1);
INSERT INTO figure_faction_secondary VALUES(19,1);
INSERT INTO figure_faction_secondary VALUES(20,1);
INSERT INTO figure_faction_secondary VALUES(21,2);
CREATE TABLE tactic_faction_secondary (
	tactic_id INTEGER, 
	faction_id INTEGER, 
	FOREIGN KEY(tactic_id) REFERENCES tactic (id), 
	FOREIGN KEY(faction_id) REFERENCES faction (id)
);
INSERT INTO tactic_faction_secondary VALUES(2,3);
INSERT INTO tactic_faction_secondary VALUES(3,3);
INSERT INTO tactic_faction_secondary VALUES(4,3);
INSERT INTO tactic_faction_secondary VALUES(5,3);
INSERT INTO tactic_faction_secondary VALUES(6,3);
INSERT INTO tactic_faction_secondary VALUES(7,3);
INSERT INTO tactic_faction_secondary VALUES(8,3);
INSERT INTO tactic_faction_secondary VALUES(19,1);
INSERT INTO tactic_faction_secondary VALUES(20,1);
INSERT INTO tactic_faction_secondary VALUES(21,1);
INSERT INTO tactic_faction_secondary VALUES(22,1);
INSERT INTO tactic_faction_secondary VALUES(23,2);
INSERT INTO tactic_faction_secondary VALUES(24,2);
INSERT INTO tactic_faction_secondary VALUES(25,2);
INSERT INTO tactic_faction_secondary VALUES(26,2);
INSERT INTO tactic_faction_secondary VALUES(27,2);
INSERT INTO tactic_faction_secondary VALUES(28,2);
INSERT INTO tactic_faction_secondary VALUES(29,2);
INSERT INTO tactic_faction_secondary VALUES(30,2);
INSERT INTO tactic_faction_secondary VALUES(31,2);
INSERT INTO tactic_faction_secondary VALUES(32,2);
INSERT INTO tactic_faction_secondary VALUES(33,2);
INSERT INTO tactic_faction_secondary VALUES(34,2);
INSERT INTO tactic_faction_secondary VALUES(35,2);
INSERT INTO tactic_faction_secondary VALUES(36,5);
INSERT INTO tactic_faction_secondary VALUES(37,5);
INSERT INTO tactic_faction_secondary VALUES(38,5);
INSERT INTO tactic_faction_secondary VALUES(39,5);
INSERT INTO tactic_faction_secondary VALUES(40,6);
INSERT INTO tactic_faction_secondary VALUES(41,6);
INSERT INTO tactic_faction_secondary VALUES(42,6);
INSERT INTO tactic_faction_secondary VALUES(43,6);
INSERT INTO tactic_faction_secondary VALUES(44,6);
INSERT INTO tactic_faction_secondary VALUES(45,6);
CREATE TABLE roster_faction_secondary (
	roster_id INTEGER, 
	faction_id INTEGER, 
	FOREIGN KEY(roster_id) REFERENCES roster (id), 
	FOREIGN KEY(faction_id) REFERENCES faction (id)
);
INSERT INTO roster_faction_secondary VALUES(2,2);
INSERT INTO roster_faction_secondary VALUES(1,1);
INSERT INTO roster_faction_secondary VALUES(2,4);
INSERT INTO roster_faction_secondary VALUES(3,5);
INSERT INTO roster_faction_secondary VALUES(4,6);
CREATE TABLE user (
	id INTEGER NOT NULL, 
	username VARCHAR(64), 
	email VARCHAR(120), 
	password_hash VARCHAR(128), 
	PRIMARY KEY (id)
);
INSERT INTO user VALUES(1,'mike','michaelsobczak54@gmail.com','pbkdf2:sha256:150000$Ld3qLwAi$6d8e8c8be358b50195cd1d0e520c5089bdba355e93ebda08d2d4338e33aca6b9');
INSERT INTO user VALUES(2,'juliantoker','juliantoker@gmail.com','pbkdf2:sha256:150000$uZ2SOViw$6747ae6f7d2c8dd3784911c0d82fc6fb16311e859a09efa190beb9d3e5d1f943');
INSERT INTO user VALUES(3,'dylan','dylanmercer720@gmail.com','pbkdf2:sha256:150000$Wkh87Icp$9ad4e468cef641e6942929481e48c71ca8b7a2b2018393a986dc7d71b7a1a476');
CREATE TABLE user_roster_secondary (
	user_id INTEGER, 
	roster_id INTEGER, 
	FOREIGN KEY(user_id) REFERENCES user (id), 
	FOREIGN KEY(roster_id) REFERENCES roster (id)
);
INSERT INTO user_roster_secondary VALUES(1,1);
INSERT INTO user_roster_secondary VALUES(2,2);
INSERT INTO user_roster_secondary VALUES(1,3);
INSERT INTO user_roster_secondary VALUES(3,4);
CREATE TABLE user_role_secondary (
	user_id INTEGER, 
	role_id INTEGER, 
	FOREIGN KEY(user_id) REFERENCES user (id), 
	FOREIGN KEY(role_id) REFERENCES role (id)
);
INSERT INTO user_role_secondary VALUES(1,1);
INSERT INTO user_role_secondary VALUES(2,3);
CREATE TABLE role (
	id INTEGER NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);
INSERT INTO role VALUES(1,'Admin');
INSERT INTO role VALUES(2,'Editor');
INSERT INTO role VALUES(3,'User');
INSERT INTO role VALUES(4,'Premium');
CREATE TABLE alembic_version (
	version_num VARCHAR(32) NOT NULL, 
	CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num)
);
INSERT INTO alembic_version VALUES('7725df8db534');
CREATE TABLE figure_wargear_secondary (
	figure_id INTEGER, 
	wargear_id INTEGER, 
	FOREIGN KEY(figure_id) REFERENCES figure (id), 
	FOREIGN KEY(wargear_id) REFERENCES wargear (id)
);
INSERT INTO figure_wargear_secondary VALUES(2,2);
INSERT INTO figure_wargear_secondary VALUES(2,3);
INSERT INTO figure_wargear_secondary VALUES(2,19);
INSERT INTO figure_wargear_secondary VALUES(6,14);
INSERT INTO figure_wargear_secondary VALUES(7,14);
INSERT INTO figure_wargear_secondary VALUES(8,14);
INSERT INTO figure_wargear_secondary VALUES(8,17);
INSERT INTO figure_wargear_secondary VALUES(12,4);
INSERT INTO figure_wargear_secondary VALUES(13,4);
INSERT INTO figure_wargear_secondary VALUES(13,5);
INSERT INTO figure_wargear_secondary VALUES(14,14);
INSERT INTO figure_wargear_secondary VALUES(16,8);
INSERT INTO figure_wargear_secondary VALUES(35,2);
INSERT INTO figure_wargear_secondary VALUES(35,3);
INSERT INTO figure_wargear_secondary VALUES(35,20);
INSERT INTO figure_wargear_secondary VALUES(36,64);
INSERT INTO figure_wargear_secondary VALUES(36,73);
INSERT INTO figure_wargear_secondary VALUES(36,48);
INSERT INTO figure_wargear_secondary VALUES(36,81);
INSERT INTO figure_wargear_secondary VALUES(36,43);
INSERT INTO figure_wargear_secondary VALUES(36,46);
INSERT INTO figure_wargear_secondary VALUES(36,76);
INSERT INTO figure_wargear_secondary VALUES(36,58);
INSERT INTO figure_wargear_secondary VALUES(37,66);
INSERT INTO figure_wargear_secondary VALUES(37,64);
INSERT INTO figure_wargear_secondary VALUES(37,63);
INSERT INTO figure_wargear_secondary VALUES(37,58);
INSERT INTO figure_wargear_secondary VALUES(37,46);
INSERT INTO figure_wargear_secondary VALUES(37,73);
INSERT INTO figure_wargear_secondary VALUES(37,81);
INSERT INTO figure_wargear_secondary VALUES(37,48);
INSERT INTO figure_wargear_secondary VALUES(38,46);
INSERT INTO figure_wargear_secondary VALUES(38,64);
INSERT INTO figure_wargear_secondary VALUES(38,48);
INSERT INTO figure_wargear_secondary VALUES(38,75);
INSERT INTO figure_wargear_secondary VALUES(38,81);
INSERT INTO figure_wargear_secondary VALUES(38,58);
INSERT INTO figure_wargear_secondary VALUES(38,73);
INSERT INTO figure_wargear_secondary VALUES(38,43);
INSERT INTO figure_wargear_secondary VALUES(39,46);
INSERT INTO figure_wargear_secondary VALUES(39,48);
INSERT INTO figure_wargear_secondary VALUES(39,58);
INSERT INTO figure_wargear_secondary VALUES(39,64);
INSERT INTO figure_wargear_secondary VALUES(40,46);
INSERT INTO figure_wargear_secondary VALUES(40,48);
INSERT INTO figure_wargear_secondary VALUES(40,57);
INSERT INTO figure_wargear_secondary VALUES(40,58);
INSERT INTO figure_wargear_secondary VALUES(40,59);
INSERT INTO figure_wargear_secondary VALUES(40,63);
INSERT INTO figure_wargear_secondary VALUES(40,64);
INSERT INTO figure_wargear_secondary VALUES(40,65);
INSERT INTO figure_wargear_secondary VALUES(40,66);
INSERT INTO figure_wargear_secondary VALUES(40,68);
INSERT INTO figure_wargear_secondary VALUES(41,64);
INSERT INTO figure_wargear_secondary VALUES(41,48);
INSERT INTO figure_wargear_secondary VALUES(41,46);
INSERT INTO figure_wargear_secondary VALUES(41,58);
INSERT INTO figure_wargear_secondary VALUES(41,79);
INSERT INTO figure_wargear_secondary VALUES(41,51);
INSERT INTO figure_wargear_secondary VALUES(41,49);
INSERT INTO figure_wargear_secondary VALUES(41,70);
INSERT INTO figure_wargear_secondary VALUES(41,55);
INSERT INTO figure_wargear_secondary VALUES(41,37);
INSERT INTO figure_wargear_secondary VALUES(41,75);
INSERT INTO figure_wargear_secondary VALUES(41,77);
INSERT INTO figure_wargear_secondary VALUES(41,53);
INSERT INTO figure_wargear_secondary VALUES(42,83);
INSERT INTO figure_wargear_secondary VALUES(42,64);
INSERT INTO figure_wargear_secondary VALUES(42,62);
INSERT INTO figure_wargear_secondary VALUES(42,72);
INSERT INTO figure_wargear_secondary VALUES(42,45);
INSERT INTO figure_wargear_secondary VALUES(42,58);
INSERT INTO figure_wargear_secondary VALUES(42,76);
INSERT INTO figure_wargear_secondary VALUES(42,82);
INSERT INTO figure_wargear_secondary VALUES(43,45);
INSERT INTO figure_wargear_secondary VALUES(43,46);
INSERT INTO figure_wargear_secondary VALUES(43,58);
INSERT INTO figure_wargear_secondary VALUES(43,62);
INSERT INTO figure_wargear_secondary VALUES(43,64);
INSERT INTO figure_wargear_secondary VALUES(43,72);
INSERT INTO figure_wargear_secondary VALUES(43,76);
INSERT INTO figure_wargear_secondary VALUES(43,82);
INSERT INTO figure_wargear_secondary VALUES(43,83);
INSERT INTO figure_wargear_secondary VALUES(44,44);
INSERT INTO figure_wargear_secondary VALUES(44,46);
INSERT INTO figure_wargear_secondary VALUES(44,47);
INSERT INTO figure_wargear_secondary VALUES(44,58);
INSERT INTO figure_wargear_secondary VALUES(44,64);
INSERT INTO figure_wargear_secondary VALUES(44,74);
INSERT INTO figure_wargear_secondary VALUES(45,44);
INSERT INTO figure_wargear_secondary VALUES(45,46);
INSERT INTO figure_wargear_secondary VALUES(45,47);
INSERT INTO figure_wargear_secondary VALUES(45,58);
INSERT INTO figure_wargear_secondary VALUES(45,64);
INSERT INTO figure_wargear_secondary VALUES(45,74);
INSERT INTO figure_wargear_secondary VALUES(45,80);
INSERT INTO figure_wargear_secondary VALUES(46,75);
INSERT INTO figure_wargear_secondary VALUES(46,64);
INSERT INTO figure_wargear_secondary VALUES(46,46);
INSERT INTO figure_wargear_secondary VALUES(46,37);
INSERT INTO figure_wargear_secondary VALUES(46,47);
INSERT INTO figure_wargear_secondary VALUES(46,74);
INSERT INTO figure_wargear_secondary VALUES(46,58);
INSERT INTO figure_wargear_secondary VALUES(46,44);
CREATE TABLE figure_specialization_secondary (
	figure_id INTEGER, 
	specialization_id INTEGER, 
	FOREIGN KEY(figure_id) REFERENCES figure (id), 
	FOREIGN KEY(specialization_id) REFERENCES specialization (id)
);
INSERT INTO figure_specialization_secondary VALUES(2,2);
INSERT INTO figure_specialization_secondary VALUES(2,3);
INSERT INTO figure_specialization_secondary VALUES(2,11);
INSERT INTO figure_specialization_secondary VALUES(35,2);
INSERT INTO figure_specialization_secondary VALUES(35,3);
INSERT INTO figure_specialization_secondary VALUES(35,11);
INSERT INTO figure_specialization_secondary VALUES(36,8);
INSERT INTO figure_specialization_secondary VALUES(36,5);
INSERT INTO figure_specialization_secondary VALUES(36,4);
INSERT INTO figure_specialization_secondary VALUES(36,9);
INSERT INTO figure_specialization_secondary VALUES(37,8);
INSERT INTO figure_specialization_secondary VALUES(37,5);
INSERT INTO figure_specialization_secondary VALUES(37,9);
INSERT INTO figure_specialization_secondary VALUES(37,6);
INSERT INTO figure_specialization_secondary VALUES(37,4);
INSERT INTO figure_specialization_secondary VALUES(38,8);
INSERT INTO figure_specialization_secondary VALUES(38,4);
INSERT INTO figure_specialization_secondary VALUES(38,9);
INSERT INTO figure_specialization_secondary VALUES(38,5);
INSERT INTO figure_specialization_secondary VALUES(38,2);
INSERT INTO figure_specialization_secondary VALUES(39,4);
INSERT INTO figure_specialization_secondary VALUES(39,5);
INSERT INTO figure_specialization_secondary VALUES(39,9);
INSERT INTO figure_specialization_secondary VALUES(39,10);
INSERT INTO figure_specialization_secondary VALUES(40,4);
INSERT INTO figure_specialization_secondary VALUES(40,5);
INSERT INTO figure_specialization_secondary VALUES(40,10);
INSERT INTO figure_specialization_secondary VALUES(40,9);
INSERT INTO figure_specialization_secondary VALUES(40,6);
INSERT INTO figure_specialization_secondary VALUES(41,2);
INSERT INTO figure_specialization_secondary VALUES(41,4);
INSERT INTO figure_specialization_secondary VALUES(41,5);
INSERT INTO figure_specialization_secondary VALUES(41,9);
INSERT INTO figure_specialization_secondary VALUES(41,10);
INSERT INTO figure_specialization_secondary VALUES(42,4);
INSERT INTO figure_specialization_secondary VALUES(42,5);
INSERT INTO figure_specialization_secondary VALUES(42,3);
INSERT INTO figure_specialization_secondary VALUES(42,8);
INSERT INTO figure_specialization_secondary VALUES(42,10);
INSERT INTO figure_specialization_secondary VALUES(43,3);
INSERT INTO figure_specialization_secondary VALUES(43,2);
INSERT INTO figure_specialization_secondary VALUES(43,10);
INSERT INTO figure_specialization_secondary VALUES(43,4);
INSERT INTO figure_specialization_secondary VALUES(43,5);
INSERT INTO figure_specialization_secondary VALUES(43,8);
INSERT INTO figure_specialization_secondary VALUES(44,3);
INSERT INTO figure_specialization_secondary VALUES(44,10);
INSERT INTO figure_specialization_secondary VALUES(44,9);
INSERT INTO figure_specialization_secondary VALUES(44,4);
INSERT INTO figure_specialization_secondary VALUES(45,5);
INSERT INTO figure_specialization_secondary VALUES(45,4);
INSERT INTO figure_specialization_secondary VALUES(45,3);
INSERT INTO figure_specialization_secondary VALUES(45,9);
INSERT INTO figure_specialization_secondary VALUES(45,10);
INSERT INTO figure_specialization_secondary VALUES(46,2);
INSERT INTO figure_specialization_secondary VALUES(46,3);
INSERT INTO figure_specialization_secondary VALUES(46,4);
INSERT INTO figure_specialization_secondary VALUES(46,9);
INSERT INTO figure_specialization_secondary VALUES(46,10);
CREATE TABLE wargearprofile (
	id INTEGER NOT NULL, 
	name TEXT, 
	wargear_id INTEGER, 
	wargear_range TEXT, 
	wargear_type TEXT, 
	strength TEXT, 
	ap TEXT, 
	damage TEXT, 
	FOREIGN KEY(wargear_id) REFERENCES wargear (id)
);
CREATE UNIQUE INDEX ix_user_username ON user (username);
CREATE UNIQUE INDEX ix_user_email ON user (email);
COMMIT;
