-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 13 mai 2020 à 19:38
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `web_voyage`
--

-- --------------------------------------------------------

--
-- Structure de la table `accomodations`
--

CREATE TABLE `accomodations` (
  `accomodation_id` int(11) NOT NULL,
  `accomodation_name` varchar(128) NOT NULL,
  `type` varchar(64) NOT NULL,
  `location` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `price` float UNSIGNED DEFAULT NULL,
  `pays` varchar(256) NOT NULL,
  `type_lieu` varchar(256) NOT NULL,
  `lien_img` varchar(250) DEFAULT NULL,
  `saisie_user` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `accomodations`
--

INSERT INTO `accomodations` (`accomodation_id`, `accomodation_name`, `type`, `location`, `description`, `price`, `pays`, `type_lieu`, `lien_img`, `saisie_user`) VALUES
(1, 'Camping de Munster', 'Camping', 'Munster', 'Camping au coeur de la nature, venez (re)découvrir les Vosges au vert !', 100, 'Europe-France', 'Soleil-Nature-Foret', 'http://www.toocamp.com/medias/campings/large/camping-Le-Parc-de-la-Fecht-23148-c7a0fb.jpeg', NULL),
(2, 'Camping de Lucerne', 'Camping', 'Lucerne', 'Très beau camping en pleine nature.\r\n<br><br>\r\nTrès bien situé, proche de la forêt.', 60, 'Europe-France', 'Soleil-Nature-Foret', 'http://campingnavigator.com/image-data/600307/terrassen-camping-vitznau-vitznau.jpg?maxw=620&maxh=375&crop=1', NULL),
(4, 'Hôtel Adlon', 'Hotel', 'Berlin', 'Hôtel 5 étoiles.\r\n<br>\r\n<br>\r\nSitué à 2 minutes à pied de la Porte de Brandebourg, cet élégant hôtel haut de gamme se trouve également à 3 minutes à pied du mur de Berlin. <br>\r\nLes chambres luxueuses avec salle de bain en marbre comprennent une télévision à écran plat, un accès Wi-Fi gratuit et un iPad, ainsi qu\'un minibar. <br>Les suites spacieuses comportent une cuisine, un espace de vie/repas séparé, un jacuzzi, une cheminée et une vue sur la ville. Un service de chambre est proposé. <br>\r\nLes 3 restaurants servent une cuisine internationale variée, tandis qu\'un spa propose une piscine intérieure, un sauna et des massages. L\'établissement comprend une salle de sport, un bar, un salon avec piano à l\'ambiance décontractée, des salles de réunion et une terrasse. Les animaux de compagnie sont acceptés (supplément).\r\n<br><br>\r\nAdresse : Unter den Linden 77, 10117 Berlin, Allemagne\r\n<br><br>\r\nSite : kempinski.com', 238, 'Europe-Allemagne', 'En ville-Luxe', 'https://lh5.googleusercontent.com/p/AF1QipNIIedDcEoeQcLkpyYYiJyhNWc2KlAz7eGPahhq=w408-h272-k-no', NULL),
(5, 'Four Seasons Hotel London at Park Lane', 'Hotel', 'Londres', 'Cet hôtel haut de gamme est situé à quelques pas de Hyde Park et à 10 minutes à pied de Buckingham Palace.<br>\r\nLes chambres élégantes sont équipées d\'une télévision à écran plat, d\'un dock pour iPod et du Wi-Fi (supplément). <br>Certaines chambres offrent une vue sur le parc ou la ville. Les suites comprennent également une salle de séjour, des fenêtres pleine hauteur, une terrasse privée et/ou une cheminée.<br>\r\nLe restaurant gastronomique sert une cuisine italienne, et un salon offre le thé dans l\'après-midi. Les fenêtres du spa et du centre de fitness s\'étendent du plancher au plafond et offrent une vue imprenable sur la ville. L\'hôtel est équipé de 10 salles de réunion, dont une pouvant faire office de salle de bal.\r\n<br><br>\r\nAdresse : Hamilton Pl, Park Ln, Mayfair, London W1J 7DR, Royaume-Uni\r\n<br><br>\r\nSite : fourseasons.com', 813, 'Europe-Angleterre', 'En ville-Luxe', 'https://lh5.googleusercontent.com/proxy/Yge3eJCYqZX20-RxHQh_bfoK1f8sRg_XUZ1XWlqqC7rWVeoH3zxpbVHYllyi2eddbGhkp0UEKC9xekSbIkfT-Tjllzg6cW2wS-3pQRWi7aHICgBpdcD1Fli7RpCYlPtU2otrLbWbcpWvk19mYfTtcLnjkXrF0Q=w408-h263-k-no', NULL),
(6, 'Chrissa Camping', 'Camping', 'Delphi', 'Beau camping proche de la mer.\r\n<br><br>\r\nAdresse : Delphi 330 54, Grèce\r\n<br><br>\r\nSite : chrissacamping.gr', 36, 'Europe-Grece', 'Soleil-Mer-Nature-Plage', 'https://lh5.googleusercontent.com/p/AF1QipNSk2CHh2iI3MQMUlv2d32_sbmRDIVAUqer9wR-=w426-h240-k-no', NULL),
(7, 'Helnan Palestine Hotel', 'Hotel', 'Al Mandarah Bahri', 'Hôtel 5 étoiles.\r\n<br><br>\r\nServices disponibles :\r\n<br>- Wi-Fi gratuit\r\n<br>- Parking gratuit\r\n<br>- Piscine extérieure\r\n<br>- Climatisation\r\n<br><br>\r\nAdresse : Al Mandarah Bahri, Égypte\r\n<br><br>\r\nTéléphone : +20 3 5473500', 124, 'Afrique-Egypte', 'Soleil-Mer-Luxe-Plage', 'https://lh5.googleusercontent.com/p/AF1QipP-buGf4RZOuoiJTmbQOIKq0NEJPIB6072Mz97n=w408-h306-k-no', NULL),
(8, 'AKIBA Eco-gîte solidaire et Table d\'hôte', 'Gîte-Table d\'hote', 'Ankestabe Nosy Komba', 'Gîte écologique et solidaire.\r\n<br><br>\r\nAdresse : Ankestabe Nosy Komba, Madagascar\r\n<br><br>\r\nTéléphone : +261 32 40 540 02', NULL, 'Afrique-Madagascar', 'Soleil-Ile-Exotique-Ecologique', 'https://lh5.googleusercontent.com/p/AF1QipMeKWjBe7ntPYRoOk4qVeM0z2D9OfAPYAx9gd_q=w408-h306-k-no', NULL),
(9, 'Hotel L\'Hacienda', 'Hotel', 'Ouagadougou', 'Hôtel 3 étoiles.\r\n<br>Proche de l\'aéroport\r\n<br><br>\r\nServices : \r\n<br>- Wi-Fi gratuit\r\n<br>- Climatisation\r\n<br>- Piscine\r\n<br>- Service de chambre\r\n<br><br>\r\nAdresse : Ouagadougou, Burkina Faso\r\n<br><br>\r\nTéléphone : +226 67 69 93 93', 88, 'Afrique-Burkina Faso', 'Soleil-En ville-Luxe-Exotique', 'https://lh4.googleusercontent.com/proxy/KXx8K7NNDrsDByTcZpH9roY30SpHR3xFEDiXReFHRBZwRkzf8YyFqmYS4EHLG5xM1hfzLRUHWN4KVXd80E1cwqjXPZPmxpYUSEl_pIEhPDHxdczhwKLnHCktaFw5kgeWycPs-64AnyZE-dmkT7jZzwU_28lgPQ=w437-h240-k-no', NULL),
(16, 'Ibis Hotel Bata', 'Hotel', 'Bata', 'Hôtel 2 étoiles.\r\n<br><br>\r\nServices : \r\n<br>- Wi-Fi\r\n<br>- Climatisation\r\n<br>- Adapté aux enfants\r\n<br>- Restaurants\r\n<br>- Bar\r\n<br><br>\r\nAdresse : Paseo Marítimo de Bata, Bata, Guinée équatoriale\r\n<br><br>\r\nSite : hotelibis.com', 139, 'Afrique-Guinée Equatoriale', 'Soleil-Ocean-Mer-Plage', 'https://lh5.googleusercontent.com/proxy/oF2ew5QaCkH5kUrYANaNwL4gCdF1B19_w75xzPohoa6suZO4j7Yax8-aiKWDaUi559-q476zf9qMV4wQxnE-6A9uxGGSnbE8mNU_X6kGdJx7d_tuY4AJ_kWK2I7PWzwMGpoH2Hc-YaPKf1TS5sVIDa9RnDssuQ=w408-h306-k-no', NULL),
(17, 'Thamalakane River Lodge', 'Hotel-Lodge', 'Maun', 'Hôtel 3 étoiles.\r\n<br><br>\r\nServices :\r\n<br>- Wi-Fi gratuit\r\n<br>- Piscine extérieure\r\n<br>- Climatisation\r\n<br>- Parking gratuit\r\n<br><br>\r\nAdresse : Sexaxa Ward, Maun, Botswana\r\n<br><br>\r\nSite : trlmaun.com', 286, 'Afrique-Botswana', 'Soleil-Nature-Rivière', 'https://lh3.googleusercontent.com/proxy/TcnXs9GDaFjRrhWpMdW69VJhJiR3W4w71qj_1rO8JPXjkOoyay6XXdIAWk640gniO_obgX2rdQyAr2uGfGH2k0hpU6f86ZwjK18NhJ5QdZfH7cnRNRhoT4zl1hp11oQz44WMSdECpfBAv7GIoEvugxuyKYpwxQ=w408-h272-k-no', NULL),
(18, 'Gite Ifoulou Tassaout', 'Hotel-Gite', 'Ifoulou', 'Hôtel 3 étoiles.\r\n<br><br>\r\nServices :\r\n<br>- Formule tout compris\r\n<br>- Restaurant\r\n<br>- Adapté aux enfants\r\n<br><br>\r\nAdresse : Ifoulou, Ait Tamlil 22323, Ifoulou, Maroc\r\n<br><br>\r\nSite : giteifoulou.com', 45, 'Afrique-Maroc', 'Montagne-Authentique-Nature', 'https://lh5.googleusercontent.com/proxy/2BwJft9vM2olWzai3YIP7rz2qlRI_rXa-WSV5ogudLHITrgGd8qhAhQcHy8SZEJIqTM4fUCMCFyLSGOMtmM55CchT9BUTlUGqNdIuFGKReOR9hNUEEPCgFkgGE_K1137Svs0cftmiYHCrH01fT4k_PFZneTXnQ=w437-h240-k-no', NULL),
(19, 'Aman at Summer Palace, Beijing', 'Palace', 'Beijing, Pékin', 'Palace situé dans le district de Dongcheng.\r\n<br><br>\r\nServices :\r\n<br>- Wi-Fi gratuit\r\n<br>- Piscine intérieure\r\n<br>- Parking\r\n<br>- Accès handicapés\r\n<br><br>\r\nAdresse : 1 Gongmenqian Street, Chine, 100091\r\n<br><br>\r\nSite : aman.com', 568, 'Asie-Chine', 'En ville-Luxe-Traditionnel', 'https://lh3.googleusercontent.com/proxy/rh16z5t9_3yii6bcZ2F1wdkAyWyZ7qp1bZw6bLnkouy6G0dvhTHE82iRW5nLozHF_Xy4JNYtCRfWn7Rdw9oMgk8YRtXhMZgq1MFdYs5m2QE1mTNr3u7bV7TQJJjPmZOjkVICw1iCaibqVKt4txB_-TXcILWZjG8=w408-h302-k-no', NULL),
(20, 'Taj Mahal Lucknow', 'Hotel', 'Uttar Pradesh ', 'Hôtel 5 étoiles.\r\n<br><br>\r\nServices :\r\n<br>- Wi-Fi gratuit\r\n<br>- Piscine\r\n<br>- Parking gratuit\r\n<br>- Climatisation\r\n<br>- Spa\r\n<br><br>\r\nAdresse : Vipin Khand, Gomti Nagar, Lucknow, Uttar Pradesh 226010, Inde\r\n<br><br>\r\nSite : tajhotels.com', 77, 'Asie-Inde', 'En ville-Luxe-Rivière', 'https://lh5.googleusercontent.com/proxy/kc_n7DgnLWRH-fzGDEeHnyxdVqbz8yRhaOEi9Tage3Znua1IIXP9lBMxfNo8PCsIWHm7gFqeSW4dETf_wEhOt5yQs_BipjeE6lRWBKbxOy8OoJrxI0-ur4IChnZOV7E59CvNYcjA-4GPxeBz0eXJKFUajtldMcM=w431-h240-k-no', NULL),
(21, 'The Rich Jogja Hotel', 'Hotel', 'Special Region of Yogyakarta ', 'Hôtel 4 étoiles.\r\n<br><br>\r\nServices :\r\n<br>- Wi-Fi gratuit\r\n<br>- Accès handicapés\r\n<br>- Piscine extérieure\r\n<br><br>\r\nAdresse : Magelang St No.KM.6 No.18, Kutu Patran, Sinduadi, Mlati, Sleman Regency, Special Region of Yogyakarta 55284, Indonésie\r\n<br><br>\r\nSite : therichjogjahotel.com', 25, 'Asie-Indonésie', 'Soleil-Mer-Ocean-Plage-Ile-Luxe', 'https://lh4.googleusercontent.com/proxy/Vv-DCvAypvJnsBu-tjDUEKSmsXuvC13YMt70q5No_ORfZflh4E76Au3w3Uchhc6Bemw5n677fJcaT2JA5NQXNk6V9OsGCZxytEwoDEKQ2Nnt9NBfmhX2jdsnYkdfaQ5nzncEW-_VRNJbz-vmpw2PpGnTKe0=w408-h306-k-no', NULL),
(22, 'Pepele eco-lodge', 'Lodge', 'Chuchulu', 'Lodge écologique au bord de l\'océan.\r\n<br><br>\r\nAdresse : Chuchulu Lombi mulaka SB, Chuchulu, Îles Salomon\r\n<br><br>\r\nTéléphone : +677 74 36885', NULL, 'Océanie-Îles Salomon', 'Soleil-Ile-Mer-Ocean-Plage-Ecologie', 'https://lh5.googleusercontent.com/p/AF1QipPRPz64L_mcTSxrEHlGgg0vcwnIDjyjM-KDc0_X=w408-h272-k-no', NULL),
(23, 'Getaway Te Anau Holiday Park & Apartments', 'Hotel', 'Te Anau', 'Hôtel 5 étoiles.\r\n<br><br>\r\nServices :\r\n<br>- Wi-Fi\r\n<br>- Parking gratuit\r\n<br>- Bain à remous\r\n<br>- Spa\r\n<br>- Golf\r\n<br><br>\r\nAdresse : 128 Te Anau Terrace, Te Anau 9600, Nouvelle-Zélande\r\n<br><br>\r\nSite : getawayteanau.co.nz', 51, 'Océanie-Nouvelle Zélande', 'Soleil-Ile-Lac-Montagne-Nature', 'https://lh5.googleusercontent.com/p/AF1QipMVmYY4wOtiMnl3Ej29uoGIkx6SQiGcm9xfo302=w426-h240-k-no', NULL),
(24, 'Inukshuk Inns North Hotel', 'Hotel', 'Kugaaruk', 'Hôtel 1 étoile.\r\n<br><br>\r\nServices : \r\n<br>- Wi-Fi\r\n<br>- Parking gratuit\r\n<br>- Bar\r\n<br>- Restaurant\r\n<br>- Non-fumeurs\r\n<br><br>\r\nAdresse :Kugaaruk, NU, Canada\r\n<br><br>\r\nSite : kugaaruk.com', NULL, 'Amerique du Nord-Canada', 'Froid-Ocean-Mer-Glace', 'https://lh5.googleusercontent.com/p/AF1QipMnryg-OGcCkV01RNjxmgLFxKxoTxzlQ1AFe0b9=w426-h240-k-no', NULL),
(25, 'Royal Tulip Brasília Alvorada', 'Hotel', 'Brasília', 'Hôtel 5 étoiles.\r\n<br><br>\r\nCet hôtel et centre de conférence haut de gamme, situé dans un bâtiment moderne en forme de fer à cheval avec vue sur le lac Paranoá, se trouve à 12 minutes de marche de la résidence présidentielle Palácio da Alvorada et à 19 km de l\'aéroport international de Brasília.<br>\r\nLes chambres lumineuses sont équipées d\'un balcon, d\'un bureau, d\'un minibar, de la télévision par câble et du Wi-Fi gratuit. Les suites disposent d\'une salle de séjour, et un service de chambre est proposé.<br>\r\nLe petit-déjeuner et le parking sont gratuits. L\'hôtel dispose également d\'un restaurant qui sert une cuisine internationale, d\'un bar et d\'un pub anglais. Côté loisirs, l\'établissement comprend un spa, des piscines extérieures pour adultes et enfants, des terrains de tennis et une salle de sport. Les salles de conférence peuvent accueillir jusqu\'à 1 000 personnes.<br>\r\n<br>\r\nAdresse : SHTN Trecho 1 bloco C conjunto 1B - Asa Norte, Brasília - DF, 70800-200, Brésil\r\n<br><br>\r\nSite : royaltulipbrasiliaalvorada.com', 1843, 'Amérique du Sud-Brésil', 'Lac-Soleil-Luxe-En ville', 'https://lh4.googleusercontent.com/proxy/T9jc4Q7gRAsPXL9YHZslzPdnr0NsHeEZJPVsZef8OkivTORjz9CoHCC-UoVWBsHLXowRRmPn-5lbDovVFvwlisbldT6OT2wZFr2TD-GaYW_SvmGEuyyTdEhTEXV7f_ht_kIBXRybq4Va9rNQ9FvBAqqEXXS3Lw=w450-h240-k-no', NULL),
(26, 'Camping on the Battenkill', 'Camping', 'Arlington', 'Camping situé dans le Vermont, près de la \"Green Mountain National Forest\".\r\n<br><br>\r\nServices : \r\n<br>- Accepte les animaux\r\n<br>- Adapté aux enfants\r\n<br><br>\r\nAdresse : 48 Camping on the Battenkill #8565, Arlington, VT 05250, États-Unis\r\n<br><br>\r\nSite : campingonthebattenkillvt.com', NULL, 'Amerique du Nord-Etats-Unis', 'Nature-Foret-Montagne', 'https://lh5.googleusercontent.com/p/AF1QipNxBlj2m88YQGgFSWh4mp3Yc2_JPrqEEYN_jVhi=w408-h256-k-no', NULL),
(27, 'Camping Domaine Du Rêve', 'Camping', 'Sainte-Angèle-de-Monnoir', 'Camping situé près de l’Écurie Manoir et du club de golf Saint-Césaire.\r\n<br><br>\r\nService : \r\n<br>- Adapté aux enfants\r\n<br><br>\r\nAdresse : 85 Rang de la Côte Double, Sainte-Angèle-de-Monnoir, QC J0L 1P0, Canada\r\n<br><br>\r\nSite : domainedureve.com', NULL, 'Amerique du Nord-Canada', 'Nature-Campagne', 'https://lh5.googleusercontent.com/p/AF1QipMoyLs83zINvJU54rHzJbEVE1zeacWYtVtFILV8=w426-h240-k-no', NULL),
(28, 'Aloft Manhattan Downtown - Financial District', 'Hotel', 'New York', 'Hôtel 3 étoiles.\r\n<br>\r\nSitué au cœur du quartier financier de New York.\r\n<br><br>\r\nServices : \r\n<br> - Parking gratuit\r\n<br> - Wi-Fi gratuit\r\n<br> - Accès handicapés\r\n<br> - Climatisation\r\n<br> - Spa\r\n<br><br>\r\nAdresse : 49-53 Ann St, New York, NY 10038, États-Unis\r\n<br><br>\r\nSite : marriott.com\r\n', 117, 'Amerique du Nord-Etats-Unis', 'Luxe-En ville-Ocean', 'https://lh5.googleusercontent.com/p/AF1QipMcfI6pEjsAYn8kDNvAyC3QriQFs04BK7JvgorY=w408-h272-k-no', NULL),
(29, 'Hilton Buenos Aires', 'Hotel', 'Buenos Aires', 'Hôtel 5 étoiles.\r\n<br><br>\r\nSitué dans le quartier huppé de Puerto Madero, cet hôtel moderne se trouve à 12 minutes à pied de la Plaza de Mayo et à 3,1 km du musée d\'Art moderne de Buenos Aires. <br>\r\nLes chambres sobres disposent d\'une télévision à écran plat, d\'une connexion Wi-Fi (en supplément), d\'un mini-frigo et d\'une cafetière. Certaines offrent une vue sur la ville ou sur la rivière. Des chambres sur le thème de Barbie sont également proposées. Les chambres de catégorie Exécutive donnent accès à un salon où sont servis gratuitement le petit-déjeuner et des cocktails en soirée. Les suites possèdent en outre un espace de vie séparé. <br>\r\nL\'établissement comprend un restaurant argentin contemporain, un bar à vin chic et un café de style épicerie fine. Il possède également une piscine sur le toit, un centre de remise en forme et un sauna. Les résidents peuvent aussi profiter d\'un espace de réunion de près de 6 690 m².\r\n<br><br>\r\nAdresse : Macacha Güemes 351, C1106 BKG, Buenos Aires, Argentine\r\n<br><br>\r\nSite : buenosaires.hilton.com', 116, 'Amerique du Sud-Argentine', 'Luxe-Ocean', 'https://lh5.googleusercontent.com/p/AF1QipN4IWSwzQN_TbIxzR88i_1A6xq4u771dO7Hfn_E=w408-h616-k-no', NULL),
(30, 'Westin Lima Hotel & Convention Center', 'Hotel', 'San Isidro', 'Hôtel 5 étoiles.\r\n<br><br>\r\nSitué dans le quartier financier de San Isidro, cet hôtel moderne se trouve à 3,3 km de Huaca Huallamarca et à 8,1 km du centre-ville.\r\nLes chambres haut de gamme d\'inspiration péruvienne comprennent un lit luxueux, de grandes baies vitrées, une salle de bain en marbre avec baignoire îlot, ainsi qu\'une télévision et un accès Wi-Fi (supplément). Certaines d\'entre elles sont pourvues d\'équipements sportifs. Les suites claires à 1 et 2 chambres sont dotées d\'un salon, et certaines possèdent une kitchenette et/ou un bar avec évier. Les suites et les chambres club bénéficient d\'un petit-déjeuner, de boissons et de collations gratuits dans le salon club. Un service de chambre est proposé.\r\nL\'établissement possède un restaurant péruvien contemporain et un bar chaleureux. Il dispose également d\'une piscine intérieure chauffée, d\'une salle de sport, d\'un spa et de salles de conférence.\r\n<br><br>\r\nAdresse : Calle Las Begonias 450, San Isidro 00027, Pérou\r\n<br><br>\r\nSite : marriott.com', 201, 'Amerique du Sud-Pérou', 'Luxe-Ocean', 'https://lh5.googleusercontent.com/p/AF1QipMBn028G-TRW0B6-rcrH5uYijRrntpjPd_rZCNt=w426-h240-k-no', NULL),
(35, 'Gite Berlin Centre', 'Gite', 'Berlin', 'Petit gite familiale', 540, 'Allemagne', '', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `accomodations_votes`
--

CREATE TABLE `accomodations_votes` (
  `user_id` int(11) NOT NULL,
  `accomodation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE `activite` (
  `activite_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`activite_id`, `type`) VALUES
(27, 'Accrobranche'),
(16, 'Baignade à la mer ou en piscine exterieure'),
(5, 'Balade sur les pas de Jack l\'Éventreur '),
(29, 'Cours de tango et dégustation de vins'),
(2, 'Croisière sur le lac jusqu\'au Mont Pilate'),
(20, 'Excursion à Agra (visite du Taj Mahal)'),
(19, 'Excursion à la Grande Muraille de Chine'),
(23, 'Excursion à Milford en hélicoptère'),
(25, 'Excursion en 4x4 à La Chapada'),
(28, 'Promenade en calèche à Central Park'),
(8, 'Randonnée sur les hauts de Nosy Komba'),
(17, 'Safari Delta Okavango'),
(1, 'Safari-Tour Vallée de Munster'),
(21, 'Tour privé en jeep du volcan Merapi Yogyakarta'),
(4, 'Visite au musée Madame Tussauds'),
(24, 'Visite de l\'eglise de Kugaaruk'),
(6, 'Visite de la cité d’Isthmia à Corinthe'),
(9, 'Visite de la reserve de Nazinga'),
(22, 'Visite des chutes Tenaru '),
(30, 'Visite des lions de mer et des îles Palomino'),
(18, 'Visite du Haut Atlas'),
(7, 'Visite du Palais Montaza'),
(26, 'Visites des brasseries de Burlington ');

-- --------------------------------------------------------

--
-- Structure de la table `activities`
--

CREATE TABLE `activities` (
  `activity_id` int(11) NOT NULL,
  `activity_name` text NOT NULL,
  `step_id` int(11) NOT NULL,
  `type` text NOT NULL,
  `date_beginning` date NOT NULL,
  `date_end` date NOT NULL,
  `description` text NOT NULL,
  `price` float UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `activities`
--

INSERT INTO `activities` (`activity_id`, `activity_name`, `step_id`, `type`, `date_beginning`, `date_end`, `description`, `price`) VALUES
(1, 'Parc naturel régional des Ballons des Vosges', 1, 'Randonnée', '2020-06-26', '2020-06-29', 'Le parc naturel régional des Ballons des Vosges est un parc naturel régional français, créé en juin 1989 à l\'initiative de trois anciennes régions : l\'Alsace, la Lorraine et la Franche-Comté.', 100),
(2, 'Lucerne', 2, 'Tourisme', '2020-06-30', '2020-06-30', 'Lucerne est la septième ville de Suisse et le chef-lieu du canton de Lucerne. La ville se situe au pied des Alpes suisses et au bord du lac des Quatre-Cantons et de la rivière Reuss dans lequel il s\'écoule. Elle possède plusieurs ponts couverts, en bois, dont le Kapellbrücke, devenu indissociable de l\'image de la cité.', 100),
(3, 'Piscine London', 46, '', '2020-05-13', '2020-05-13', 'Piscine près du palais royal', 20),
(4, 'Visite de Buckingam Palace', 46, '', '2020-06-22', '2020-06-23', 'Visite à partir de 15h', 50),
(10, 'Safari Delta Okavango', 46, '', '2020-05-18', '2020-05-18', 'Dans la jungle de Londre', 80),
(11, 'Safari-Tour Vallée de Munster', 46, '', '2020-05-18', '2020-05-31', 'The English Munster', 900),
(12, 'Visite du Palais Montaza', 46, '', '2020-05-20', '2020-05-20', 'A partir de 16h rejoindre le parc', 46);

-- --------------------------------------------------------

--
-- Structure de la table `activities_votes`
--

CREATE TABLE `activities_votes` (
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `code` int(3) NOT NULL,
  `alpha2` varchar(2) NOT NULL,
  `alpha3` varchar(3) NOT NULL,
  `nom_en_gb` varchar(45) NOT NULL,
  `nom_fr_fr` varchar(45) NOT NULL,
  `continent` varchar(255) NOT NULL,
  `lien_img` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id`, `code`, `alpha2`, `alpha3`, `nom_en_gb`, `nom_fr_fr`, `continent`, `lien_img`) VALUES
(1, 4, 'AF', 'AFG', 'Afghanistan', 'Afghanistan', 'Asie', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Afghanistan.svg/320px-Flag_of_Afghanistan.svg.png'),
(2, 8, 'AL', 'ALB', 'Albania', 'Albanie', 'Europe', 'https://cdn.pixabay.com/photo/2018/09/06/09/27/sea-3657860_1280.jpg'),
(3, 10, 'AQ', 'ATA', 'Antarctica', 'Antarctique', 'Antarctique', 'https://cdn.pixabay.com/photo/2014/08/27/12/58/emperor-penguins-429127_1280.jpg'),
(4, 12, 'DZ', 'DZA', 'Algeria', 'Algérie', 'Afrique', 'https://cdn.pixabay.com/photo/2019/09/20/23/50/sand-4492764_1280.jpg'),
(5, 16, 'AS', 'ASM', 'American Samoa', 'Samoa Américaines', 'Oceanie', 'https://cdn.pixabay.com/photo/2013/11/19/09/42/samoa-213161_1280.jpg'),
(6, 20, 'AD', 'AND', 'Andorra', 'Andorre', 'Europe', 'https://cdn.pixabay.com/photo/2018/06/27/09/40/andorra-3501173_1280.jpg'),
(7, 24, 'AO', 'AGO', 'Angola', 'Angola', 'Afrique', 'https://cdn.pixabay.com/photo/2013/02/20/19/27/angola-83975_1280.jpg'),
(8, 28, 'AG', 'ATG', 'Antigua and Barbuda', 'Antigua-et-Barbuda', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2017/08/28/18/48/international-2690830_1280.jpg'),
(9, 31, 'AZ', 'AZE', 'Azerbaijan', 'Azerbaïdjan', 'Asie', 'https://cdn.pixabay.com/photo/2018/09/24/09/45/azerbaijan-3699442_1280.jpg'),
(10, 32, 'AR', 'ARG', 'Argentina', 'Argentine', 'Amerique du sud', 'https://cdn.pixabay.com/photo/2016/12/09/11/51/argentina-1894747_1280.jpg'),
(11, 36, 'AU', 'AUS', 'Australia', 'Australie', 'Oceanie', 'https://cdn.pixabay.com/photo/2014/06/06/09/36/sydney-363244_1280.jpg'),
(12, 40, 'AT', 'AUT', 'Austria', 'Autriche', 'Europe', 'https://cdn.pixabay.com/photo/2018/08/16/08/39/hallstatt-3609863_1280.jpg'),
(13, 44, 'BS', 'BHS', 'Bahamas', 'Bahamas', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2013/08/12/18/10/staniel-cay-171908_1280.jpg'),
(14, 48, 'BH', 'BHR', 'Bahrain', 'Bahreïn', 'Asie', 'https://cdn.pixabay.com/photo/2016/05/03/14/05/bahrain-1369259_1280.jpg'),
(15, 50, 'BD', 'BGD', 'Bangladesh', 'Bangladesh', 'Asie', 'https://cdn.pixabay.com/photo/2018/07/17/04/12/bangladesh-3543469_1280.jpg'),
(16, 51, 'AM', 'ARM', 'Armenia', 'Arménie', 'Asie', 'https://cdn.pixabay.com/photo/2013/02/16/03/10/yerevan-82138_1280.jpg'),
(17, 52, 'BB', 'BRB', 'Barbados', 'Barbade', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2015/11/06/12/34/barbados-1027072_1280.jpg'),
(18, 56, 'BE', 'BEL', 'Belgium', 'Belgique', 'Europe', 'https://cdn.pixabay.com/photo/2019/11/29/14/18/gent-4661419_1280.jpg'),
(19, 60, 'BM', 'BMU', 'Bermuda', 'Bermudes', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2018/05/14/19/04/ocean-3401278_1280.jpg'),
(20, 64, 'BT', 'BTN', 'Bhutan', 'Bhoutan', 'Asie', 'https://cdn.pixabay.com/photo/2017/08/28/20/33/tigers-nest-2691190_1280.jpg'),
(21, 68, 'BO', 'BOL', 'Bolivia', 'Bolivie', 'Amerique du sud', 'https://cdn.pixabay.com/photo/2020/04/04/04/34/salt-5000808_1280.jpg'),
(22, 70, 'BA', 'BIH', 'Bosnia and Herzegovina', 'Bosnie-Herzégovine', 'Europe', 'https://cdn.pixabay.com/photo/2016/01/22/12/37/mostar-1155672_1280.jpg'),
(23, 72, 'BW', 'BWA', 'Botswana', 'Botswana', 'Afrique', 'https://cdn.pixabay.com/photo/2020/04/11/00/51/botswana-5028330_1280.jpg'),
(24, 74, 'BV', 'BVT', 'Bouvet Island', 'Île Bouvet', 'Antartique', 'https://miro.medium.com/max/1400/1*EOx47HdujWtpmjoLXR63kQ.jpeg'),
(25, 76, 'BR', 'BRA', 'Brazil', 'Brésil', 'Amerique du sud', 'https://cdn.pixabay.com/photo/2017/01/08/19/30/rio-de-janeiro-1963744_1280.jpg'),
(26, 84, 'BZ', 'BLZ', 'Belize', 'Belize', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2015/10/16/21/21/belize-991848_1280.jpg'),
(27, 86, 'IO', 'IOT', 'British Indian Ocean Territory', 'Territoire Britannique de l\'Océan Indien', 'Afrique', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Flag_of_the_British_Indian_Ocean_Territory.svg/1200px-Flag_of_the_British_Indian_Ocean_Territory.svg.png'),
(28, 90, 'SB', 'SLB', 'Solomon Islands', 'Îles Salomon', 'Oceanie', 'https://upload.wikimedia.org/wikipedia/commons/d/d7/Salomons_Atoll_in_the_Chagos.jpg'),
(29, 92, 'VG', 'VGB', 'British Virgin Islands', 'Îles Vierges Britanniques', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2017/08/11/22/47/road-town-2633026_960_720.jpg'),
(30, 96, 'BN', 'BRN', 'Brunei Darussalam', 'Brunéi Darussalam', 'Asie', 'https://upload.wikimedia.org/wikipedia/commons/c/ce/Sultan_Omar_Ali_Saifuddin_Mosque%2C_Brunei_Darussalam.jpg'),
(31, 100, 'BG', 'BGR', 'Bulgaria', 'Bulgarie', 'Europe', 'https://cdn.pixabay.com/photo/2017/04/27/07/02/church-2264661_1280.jpg'),
(32, 104, 'MM', 'MMR', 'Myanmar', 'Myanmar', 'Asie', 'https://cdn.pixabay.com/photo/2014/01/12/09/45/bagan-242659_1280.jpg'),
(33, 108, 'BI', 'BDI', 'Burundi', 'Burundi', 'Afrique', 'https://cdn.pixabay.com/photo/2017/06/23/12/10/view-2434479_1280.jpg'),
(34, 112, 'BY', 'BLR', 'Belarus', 'Bélarus', 'Europe', 'https://cdn.pixabay.com/photo/2020/01/19/10/19/house-4777283_1280.jpg'),
(35, 116, 'KH', 'KHM', 'Cambodia', 'Cambodge', 'Asie', 'https://cdn.pixabay.com/photo/2016/11/14/02/51/rice-plantation-1822444_1280.jpg'),
(36, 120, 'CM', 'CMR', 'Cameroon', 'Cameroun', 'Afrique', 'https://cdn.pixabay.com/photo/2019/01/17/23/51/cameroon-3938932_1280.jpg'),
(37, 124, 'CA', 'CAN', 'Canada', 'Canada', 'Amerique du nord', 'https://cdn.pixabay.com/photo/2017/08/27/15/09/moraine-lake-2686353_1280.jpg'),
(38, 132, 'CV', 'CPV', 'Cape Verde', 'Cap-vert', 'Afrique', 'https://cdn.pixabay.com/photo/2015/03/17/22/47/fisherman-678467_1280.jpg'),
(39, 136, 'KY', 'CYM', 'Cayman Islands', 'Îles Caïmanes', 'Amerique du sud', 'https://cdn.pixabay.com/photo/2019/03/11/02/28/cayman-islands-real-estate-4047675_1280.jpg'),
(40, 140, 'CF', 'CAF', 'Central African', 'République Centrafricaine', 'Afrique', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Flag_of_the_Central_African_Republic.svg/1280px-Flag_of_the_Central_African_Republic.svg.png'),
(41, 144, 'LK', 'LKA', 'Sri Lanka', 'Sri Lanka', 'Asie', 'https://cdn.pixabay.com/photo/2014/09/24/14/40/sigiriya-459197_1280.jpg'),
(42, 148, 'TD', 'TCD', 'Chad', 'Tchad', 'Afrique', 'https://cdn.pixabay.com/photo/2019/09/17/15/14/caravan-4483792_1280.jpg'),
(43, 152, 'CL', 'CHL', 'Chile', 'Chili', 'Amerique du sud', 'https://cdn.pixabay.com/photo/2016/09/11/15/39/easter-island-1661655_1280.jpg'),
(44, 156, 'CN', 'CHN', 'China', 'Chine', 'Asie', 'https://cdn.pixabay.com/photo/2013/11/28/10/36/painting-220060_1280.jpg'),
(45, 158, 'TW', 'TWN', 'Taiwan', 'Taïwan', 'Asie', 'https://cdn.pixabay.com/photo/2017/10/12/20/00/taipei-2845695_1280.jpg'),
(46, 162, 'CX', 'CXR', 'Christmas Island', 'Île Christmas', 'Oceanie', 'https://cdn.pixabay.com/photo/2012/04/11/15/44/christmas-island-28591_960_720.png'),
(47, 166, 'CC', 'CCK', 'Cocos (Keeling) Islands', 'Îles Cocos (Keeling)', 'Oceanie', 'https://c1.wallpaperflare.com/preview/296/795/790/cuba-cayo-coco-playa-pilar-beach.jpg'),
(48, 170, 'CO', 'COL', 'Colombia', 'Colombie', 'Amerique du sud', 'https://cdn.pixabay.com/photo/2020/03/05/15/53/colombia-4904756_1280.jpg'),
(49, 174, 'KM', 'COM', 'Comoros', 'Comores', 'Afrique', 'https://upload.wikimedia.org/wikipedia/commons/5/5a/Palmiers-Grande_Comore.jpg'),
(50, 175, 'YT', 'MYT', 'Mayotte', 'Mayotte', 'Afrique', 'https://cdn.pixabay.com/photo/2015/01/19/14/37/sada-604056_1280.jpg'),
(51, 178, 'CG', 'COG', 'Republic of the Congo', 'République du Congo', 'Afrique', 'https://cdn.pixabay.com/photo/2019/05/19/22/19/river-trading-4215417_1280.jpg'),
(52, 180, 'CD', 'COD', 'The Democratic Republic Of The Congo', 'République Démocratique du Congo', 'Afrique', 'https://cdn.pixabay.com/photo/2019/05/19/22/19/kisangani-4215410_1280.jpg'),
(53, 184, 'CK', 'COK', 'Cook Islands', 'Îles Cook', 'Oceanie', 'https://cdn.pixabay.com/photo/2019/02/15/11/10/cook-islands-3998261_1280.jpg'),
(54, 188, 'CR', 'CRI', 'Costa Rica', 'Costa Rica', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2017/05/30/04/36/volcano-2355772_1280.jpg'),
(55, 191, 'HR', 'HRV', 'Croatia', 'Croatie', 'Europe', 'https://cdn.pixabay.com/photo/2016/10/13/15/37/skyline-1738058_1280.jpg'),
(56, 192, 'CU', 'CUB', 'Cuba', 'Cuba', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2016/09/02/08/32/cuba-1638594_1280.jpg'),
(57, 196, 'CY', 'CYP', 'Cyprus', 'Chypre', 'Europe', 'https://cdn.pixabay.com/photo/2018/02/26/21/01/cyprus-3184019_1280.jpg'),
(58, 203, 'CZ', 'CZE', 'Czech Republic', 'République Tchèque', 'Europe', 'https://cdn.pixabay.com/photo/2016/01/11/18/20/city-1134141_1280.jpg'),
(59, 204, 'BJ', 'BEN', 'Benin', 'Bénin', 'Afrique', 'https://cdn.pixabay.com/photo/2017/04/11/23/16/benin-2223164_1280.jpg'),
(60, 208, 'DK', 'DNK', 'Denmark', 'Danemark', 'Europe', 'https://cdn.pixabay.com/photo/2020/03/23/18/22/nyhavn-4961703_1280.jpg'),
(61, 212, 'DM', 'DMA', 'Dominica', 'Dominique', 'Amerique centrale', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Flag_of_Dominica.svg/1280px-Flag_of_Dominica.svg.png'),
(62, 214, 'DO', 'DOM', 'Dominican Republic', 'République Dominicaine', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2014/04/10/18/47/dominican-republic-321214_1280.jpg'),
(63, 218, 'EC', 'ECU', 'Ecuador', 'Équateur', 'Amerique du sud', 'https://cdn.pixabay.com/photo/2019/12/11/13/50/volcano-4688409_1280.jpg'),
(64, 222, 'SV', 'SLV', 'El Salvador', 'El Salvador', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2013/07/05/13/30/zaragoza-143480_1280.jpg'),
(65, 226, 'GQ', 'GNQ', 'Equatorial Guinea', 'Guinée Équatoriale', 'Afrique', 'https://cdn.pixabay.com/photo/2016/06/30/17/26/mount-cameroon-1489500_1280.jpg'),
(66, 231, 'ET', 'ETH', 'Ethiopia', 'Éthiopie', 'Afrique', 'https://cdn.pixabay.com/photo/2015/08/26/17/49/ethiopia-908842_1280.jpg'),
(67, 232, 'ER', 'ERI', 'Eritrea', 'Érythrée', 'Afrique', 'https://cdn.pixabay.com/photo/2013/10/12/16/06/ghinda-194478_1280.jpg'),
(68, 233, 'EE', 'EST', 'Estonia', 'Estonie', 'Europe', 'https://cdn.pixabay.com/photo/2015/08/28/18/58/estonia-912315_1280.jpg'),
(69, 234, 'FO', 'FRO', 'Faroe Islands', 'Îles Féroé', 'Europe', 'https://cdn.pixabay.com/photo/2016/05/19/10/13/foroyar-1402518_1280.jpg'),
(70, 238, 'FK', 'FLK', 'Falkland Islands', 'Îles (malvinas) Falkland', 'Europe', 'https://cdn.pixabay.com/photo/2018/05/28/18/42/wreck-3436721_1280.jpg'),
(71, 239, 'GS', 'SGS', 'South Georgia and the South Sandwich Islands', 'Géorgie du Sud et les Îles Sandwich du Sud', 'Amerique du sud ', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Flag_of_South_Georgia_and_the_South_Sandwich_Islands.svg/1280px-Flag_of_South_Georgia_and_the_South_Sandwich_Islands.svg.png'),
(72, 242, 'FJ', 'FJI', 'Fiji', 'Fidji', 'Oceanie', 'https://cdn.pixabay.com/photo/2014/03/24/10/17/fiji-293826_1280.jpg'),
(73, 246, 'FI', 'FIN', 'Finland', 'Finlande', 'Europe', 'https://cdn.pixabay.com/photo/2017/08/13/19/04/finland-2638253_1280.jpg'),
(74, 248, 'AX', 'ALA', 'Åland Islands', 'Îles Åland', 'Europe', 'https://cdn.pixabay.com/photo/2017/10/02/20/28/mariehamn-2810073_1280.jpg'),
(75, 250, 'FR', 'FRA', 'France', 'France', 'Europe', 'https://cdn.pixabay.com/photo/2013/04/11/19/46/louvre-102840_1280.jpg'),
(76, 254, 'GF', 'GUF', 'French Guiana', 'Guyane Française', 'Amerique du sud', 'https://cdn.pixabay.com/photo/2016/08/09/14/55/colonial-1580794_1280.jpg'),
(77, 258, 'PF', 'PYF', 'French Polynesia', 'Polynésie Française', 'Oceanie', 'https://cdn.pixabay.com/photo/2017/12/16/22/22/bora-bora-3023437_1280.jpg'),
(78, 260, 'TF', 'ATF', 'French Southern Territories', 'Terres Australes Françaises', 'Antarctique', 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Armoiries_Terres_australes_et_antarctiques_fran%C3%A7aises.svg'),
(79, 262, 'DJ', 'DJI', 'Djibouti', 'Djibouti', 'Afrique', 'https://cdn.pixabay.com/photo/2013/07/05/12/09/djibouti-143452_1280.jpg'),
(80, 266, 'GA', 'GAB', 'Gabon', 'Gabon', 'Afrique', 'https://cdn.pixabay.com/photo/2014/06/29/12/55/africa-379378_1280.jpg'),
(81, 268, 'GE', 'GEO', 'Georgia', 'Géorgie', 'Asie', 'https://cdn.pixabay.com/photo/2016/11/01/13/54/europe-1788319_1280.jpg'),
(82, 270, 'GM', 'GMB', 'Gambia', 'Gambie', 'Afrique', 'https://cdn.pixabay.com/photo/2017/08/22/06/15/river-scene-2667905_1280.jpg'),
(83, 275, 'PS', 'PSE', 'Occupied Palestinian Territory', 'Territoire Palestinien Occupé', 'Asie', 'https://cdn.pixabay.com/photo/2018/03/19/22/05/panoramic-3241421_1280.jpg'),
(84, 276, 'DE', 'DEU', 'Germany', 'Allemagne', 'Europe', 'https://cdn.pixabay.com/photo/2018/02/21/19/35/architecture-3171308_1280.jpg'),
(85, 288, 'GH', 'GHA', 'Ghana', 'Ghana', 'Afrique', 'https://cdn.pixabay.com/photo/2016/12/23/19/51/ghana-1927853_1280.jpg'),
(86, 292, 'GI', 'GIB', 'Gibraltar', 'Gibraltar', 'Europe', 'https://cdn.pixabay.com/photo/2016/10/22/23/26/gibraltar-1761923_1280.jpg'),
(87, 296, 'KI', 'KIR', 'Kiribati', 'Kiribati', 'Oceanie', 'https://cdn.pixabay.com/photo/2016/09/12/06/00/fanning-island-1663125_1280.jpg'),
(88, 300, 'GR', 'GRC', 'Greece', 'Grèce', 'Europe', 'https://cdn.pixabay.com/photo/2014/08/12/00/01/oia-416136_1280.jpg'),
(89, 304, 'GL', 'GRL', 'Greenland', 'Groenland', 'Amerique du nord', 'https://cdn.pixabay.com/photo/2015/08/17/13/46/tasiilaq-892503_1280.jpg'),
(90, 308, 'GD', 'GRD', 'Grenada', 'Grenade', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2016/12/15/23/22/palace-1910258_1280.jpg'),
(91, 312, 'GP', 'GLP', 'Guadeloupe', 'Guadeloupe', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2016/02/17/06/23/guadeloupe-1204556_1280.jpg'),
(92, 316, 'GU', 'GUM', 'Guam', 'Guam', 'Oceanie', 'https://cdn.pixabay.com/photo/2013/04/26/16/38/guam-107282_1280.jpg'),
(93, 320, 'GT', 'GTM', 'Guatemala', 'Guatemala', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2020/03/18/07/09/guatemala-4943012_1280.jpg'),
(94, 324, 'GN', 'GIN', 'Guinea', 'Guinée', 'Afrique', 'https://cdn.pixabay.com/photo/2016/02/18/14/01/french-guiana-1207208_1280.jpg'),
(95, 328, 'GY', 'GUY', 'Guyana', 'Guyana', 'Amerique du sud', 'https://cdn.pixabay.com/photo/2019/05/10/11/35/guyana-4193284_1280.jpg'),
(96, 332, 'HT', 'HTI', 'Haiti', 'Haïti', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2017/05/12/15/03/labadee-2307315_1280.jpg'),
(97, 334, 'HM', 'HMD', 'Heard Island and McDonald Islands', 'Îles Heard et Mcdonald', 'Antarctique', 'https://qc.croixbleue.ca/images/countries/HM.jpg'),
(98, 336, 'VA', 'VAT', 'Vatican City State', 'Saint-Siège (état de la Cité du Vatican)', 'Europe', 'https://cdn.pixabay.com/photo/2018/05/13/14/33/arch-3396631_1280.jpg'),
(99, 340, 'HN', 'HND', 'Honduras', 'Honduras', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2016/04/28/05/55/roatan-1358175_1280.jpg'),
(100, 344, 'HK', 'HKG', 'Hong Kong', 'Hong-Kong', 'Asie', 'https://cdn.pixabay.com/photo/2016/02/02/04/19/hong-kong-1174744_1280.jpg'),
(101, 348, 'HU', 'HUN', 'Hungary', 'Hongrie', 'Europe', 'https://cdn.pixabay.com/photo/2019/03/15/20/11/city-4057914_1280.jpg'),
(102, 352, 'IS', 'ISL', 'Iceland', 'Islande', 'Europe', 'https://cdn.pixabay.com/photo/2017/03/02/16/54/iceland-2111811_1280.jpg'),
(103, 356, 'IN', 'IND', 'India', 'Inde', 'Asie', 'https://cdn.pixabay.com/photo/2019/04/07/07/52/taj-mahal-4109110_1280.jpg'),
(104, 360, 'ID', 'IDN', 'Indonesia', 'Indonésie', 'Asie', 'https://cdn.pixabay.com/photo/2014/03/01/05/13/ubud-277349_1280.jpg'),
(105, 364, 'IR', 'IRN', 'Islamic Republic of Iran', 'République Islamique d\'Iran', 'Asie', 'https://cdn.pixabay.com/photo/2019/09/30/19/20/caravansary-4516601_1280.jpg'),
(106, 368, 'IQ', 'IRQ', 'Iraq', 'Iraq', 'Asie', 'https://cdn.pixabay.com/photo/2013/02/10/23/26/hillah-80384_1280.jpg'),
(107, 372, 'IE', 'IRL', 'Ireland', 'Irlande', 'Europe', 'https://cdn.pixabay.com/photo/2015/03/30/10/15/ireland-698194_1280.jpg'),
(108, 376, 'IL', 'ISR', 'Israel', 'Israël', 'Asie', 'https://cdn.pixabay.com/photo/2018/06/16/02/30/hills-3478095_1280.jpg'),
(109, 380, 'IT', 'ITA', 'Italy', 'Italie', 'Europe', 'https://cdn.pixabay.com/photo/2016/02/19/11/36/canal-1209808_1280.jpg'),
(110, 384, 'CI', 'CIV', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'Afrique', 'https://cdn.pixabay.com/photo/2014/03/04/15/10/elephant-279505_1280.jpg'),
(111, 388, 'JM', 'JAM', 'Jamaica', 'Jamaïque', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2015/11/06/15/35/beach-1029014_1280.jpg'),
(112, 392, 'JP', 'JPN', 'Japan', 'Japon', 'Asie', 'https://cdn.pixabay.com/photo/2016/12/12/22/31/japan-1902834_1280.jpg'),
(113, 398, 'KZ', 'KAZ', 'Kazakhstan', 'Kazakhstan', 'Asie', 'https://cdn.pixabay.com/photo/2020/04/27/18/03/cami-5100966_1280.jpg'),
(114, 400, 'JO', 'JOR', 'Jordan', 'Jordanie', 'Asie', 'https://cdn.pixabay.com/photo/2020/03/29/21/45/petra-4982348_1280.jpg'),
(115, 404, 'KE', 'KEN', 'Kenya', 'Kenya', 'Afrique', 'https://cdn.pixabay.com/photo/2015/11/05/23/41/kilimanjaro-1025146_1280.jpg'),
(116, 408, 'KP', 'PRK', 'Democratic People\'s Republic of Korea', 'République Populaire Démocratique de Corée', 'Asie', 'https://cdn.pixabay.com/photo/2017/08/20/15/08/north-korea-2662073_1280.jpg'),
(117, 410, 'KR', 'KOR', 'Republic of Korea', 'République de Corée', 'Asie', 'https://cdn.pixabay.com/photo/2016/02/22/08/38/gyeongbok-palace-1214975_1280.jpg'),
(118, 414, 'KW', 'KWT', 'Kuwait', 'Koweït', 'Asie', 'https://cdn.pixabay.com/photo/2016/10/07/17/17/kuwait-1722105_1280.jpg'),
(119, 417, 'KG', 'KGZ', 'Kyrgyzstan', 'Kirghizistan', 'Asie', 'https://cdn.pixabay.com/photo/2017/05/05/16/07/kyrgyzstan-2287572_1280.jpg'),
(120, 418, 'LA', 'LAO', 'Lao People\'s Democratic Republic', 'République Démocratique Populaire Lao', 'Asie', 'https://www.visaevisa.com/wp-content/uploads/2019/12/laos-article-2.png'),
(121, 422, 'LB', 'LBN', 'Lebanon', 'Liban', 'Asie', 'https://cdn.pixabay.com/photo/2018/10/03/01/53/mosque-3720320_1280.jpg'),
(122, 426, 'LS', 'LSO', 'Lesotho', 'Lesotho', 'Afrique', 'https://cdn.pixabay.com/photo/2015/09/06/17/25/lesotho-927564_1280.jpg'),
(123, 428, 'LV', 'LVA', 'Latvia', 'Lettonie', 'Europe', 'https://cdn.pixabay.com/photo/2017/01/01/15/40/latvia-1944777_1280.jpg'),
(124, 430, 'LR', 'LBR', 'Liberia', 'Libéria', 'Afrique', 'https://cdn.pixabay.com/photo/2017/08/29/19/40/international-2694616_1280.jpg'),
(125, 434, 'LY', 'LBY', 'Libyan Arab Jamahiriya', 'Jamahiriya Arabe Libyenne', 'Afrique', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Drapeau_de_la_R%C3%A9publique_Arabe_Islamique_%28Union_tuniso-libyenne%29.svg/220px-Drapeau_de_la_R%C3%A9publique_Arabe_Islamique_%28Union_tuniso-libyenne%29.svg.png'),
(126, 438, 'LI', 'LIE', 'Liechtenstein', 'Liechtenstein', 'Europe', 'https://cdn.pixabay.com/photo/2016/01/24/14/19/castle-liechtenstein-1158949_1280.jpg'),
(127, 440, 'LT', 'LTU', 'Lithuania', 'Lituanie', 'Europe', 'https://cdn.pixabay.com/photo/2017/09/05/23/26/trakai-castle-2719711_1280.jpg'),
(128, 442, 'LU', 'LUX', 'Luxembourg', 'Luxembourg', 'Europe', 'https://cdn.pixabay.com/photo/2016/01/27/15/29/luxembourg-1164656_1280.jpg'),
(129, 446, 'MO', 'MAC', 'Macao', 'Macao', 'Asie', 'https://cdn.pixabay.com/photo/2017/09/28/23/42/macau-2797481_1280.jpg'),
(130, 450, 'MG', 'MDG', 'Madagascar', 'Madagascar', 'Afrique', 'https://cdn.pixabay.com/photo/2017/12/13/18/35/makis-3017451_1280.jpg'),
(131, 454, 'MW', 'MWI', 'Malawi', 'Malawi', 'Afrique', 'https://cdn.pixabay.com/photo/2015/02/23/23/24/malawi-646878_1280.jpg'),
(132, 458, 'MY', 'MYS', 'Malaysia', 'Malaisie', 'Asie', 'https://cdn.pixabay.com/photo/2016/11/14/02/47/the-village-1822441_1280.jpg'),
(133, 462, 'MV', 'MDV', 'Maldives', 'Maldives', 'Asie', 'https://cdn.pixabay.com/photo/2015/03/09/18/34/maldives-666122_1280.jpg'),
(134, 466, 'ML', 'MLI', 'Mali', 'Mali', 'Afrique', 'https://cdn.pixabay.com/photo/2018/03/21/16/19/fish-3247257_1280.jpg'),
(135, 470, 'MT', 'MLT', 'Malta', 'Malte', 'Asie', 'https://cdn.pixabay.com/photo/2014/01/10/12/32/fishing-boat-241585_1280.jpg'),
(136, 474, 'MQ', 'MTQ', 'Martinique', 'Martinique', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2013/11/07/21/02/martinique-207128_1280.jpg'),
(137, 478, 'MR', 'MRT', 'Mauritania', 'Mauritanie', 'Afrique', 'https://cdn.pixabay.com/photo/2019/11/05/12/32/road-4603419_1280.jpg'),
(138, 480, 'MU', 'MUS', 'Mauritius', 'Maurice', 'Afrique', 'https://cdn.pixabay.com/photo/2019/08/07/10/05/mauritius-4390436_1280.jpg'),
(139, 484, 'MX', 'MEX', 'Mexico', 'Mexique', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2015/07/20/16/22/mexico-853048_1280.jpg'),
(140, 492, 'MC', 'MCO', 'Monaco', 'Monaco', 'Europe', 'https://cdn.pixabay.com/photo/2019/10/20/09/21/monaco-4563055_1280.jpg'),
(141, 496, 'MN', 'MNG', 'Mongolia', 'Mongolie', 'Asie', 'https://cdn.pixabay.com/photo/2014/10/13/15/56/yurt-486866_1280.jpg'),
(142, 498, 'MD', 'MDA', 'Republic of Moldova', 'République de Moldova', 'Asie', 'https://emerging-europe.com/wp-content/uploads/2017/12/bigstock-Chisinau-Republic-of-Moldova-193187347.jpg'),
(143, 500, 'MS', 'MSR', 'Montserrat', 'Montserrat', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2018/03/23/20/48/trees-burned-3254914_1280.jpg'),
(144, 504, 'MA', 'MAR', 'Morocco', 'Maroc', 'Afrique', 'https://cdn.pixabay.com/photo/2017/05/27/22/33/morocco-2349647_1280.jpg'),
(145, 508, 'MZ', 'MOZ', 'Mozambique', 'Mozambique', 'Afrique', 'https://cdn.pixabay.com/photo/2013/04/17/03/18/mozambique-105171_1280.jpg'),
(146, 512, 'OM', 'OMN', 'Oman', 'Oman', 'Asie', 'https://cdn.pixabay.com/photo/2017/01/14/08/45/mosque-1978998_1280.jpg'),
(147, 516, 'NA', 'NAM', 'Namibia', 'Namibie', 'Afrique', 'https://cdn.pixabay.com/photo/2017/01/26/18/56/deadvlei-2011373_1280.jpg'),
(148, 520, 'NR', 'NRU', 'Nauru', 'Nauru', 'Oceanie', 'https://cdn.pixabay.com/photo/2017/08/31/00/34/nauru-2699084_1280.jpg'),
(149, 524, 'NP', 'NPL', 'Nepal', 'Népal', 'Asie', 'https://cdn.pixabay.com/photo/2019/12/13/08/21/gokyo-ri-4692458_1280.jpg'),
(150, 528, 'NL', 'NLD', 'Netherlands', 'Pays-Bas', 'Europe', 'https://cdn.pixabay.com/photo/2019/11/14/01/13/amsterdam-4625104_1280.jpg'),
(151, 530, 'AN', 'ANT', 'Netherlands Antilles', 'Antilles Néerlandaises', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2015/09/01/13/09/curacao-916879_1280.jpg'),
(152, 533, 'AW', 'ABW', 'Aruba', 'Aruba', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2020/02/26/09/18/aruba-4881246_1280.jpg'),
(153, 540, 'NC', 'NCL', 'New Caledonia', 'Nouvelle-Calédonie', 'Oceanie', 'https://cdn.pixabay.com/photo/2015/05/26/07/11/box-784261_1280.jpg'),
(154, 548, 'VU', 'VUT', 'Vanuatu', 'Vanuatu', 'Oceanie', 'https://rccl-h.assetsadobe.com/is/image/content/dam/royal/content/destinations/vanuatu-fiji/vanuatu-fiji-cabanas.jpg?$750x667$'),
(155, 554, 'NZ', 'NZL', 'New Zealand', 'Nouvelle-Zélande', 'Oceanie', 'https://cdn.pixabay.com/photo/2016/06/11/19/34/new-zealand-1450672_1280.jpg'),
(156, 558, 'NI', 'NIC', 'Nicaragua', 'Nicaragua', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2020/03/31/12/12/cathedral-4987430_1280.jpg'),
(157, 562, 'NE', 'NER', 'Niger', 'Niger', 'Afrique', 'https://cdn.pixabay.com/photo/2013/12/18/18/14/niger-230320_1280.jpg'),
(158, 566, 'NG', 'NGA', 'Nigeria', 'Nigéria', 'Afrique', 'https://cdn.pixabay.com/photo/2017/03/14/17/26/africa-2143809_1280.jpg'),
(159, 570, 'NU', 'NIU', 'Niue', 'Niué', 'Oceanie', 'https://www.gayvoyageur.com/wp-content/uploads/2019/01/guide-gay-Niue.jpg'),
(160, 574, 'NF', 'NFK', 'Norfolk Island', 'Île Norfolk', 'Oceanie', 'https://cdn.pixabay.com/photo/2017/06/27/05/32/coast-2446324_1280.jpg'),
(161, 578, 'NO', 'NOR', 'Norway', 'Norvège', 'Europe', 'https://cdn.pixabay.com/photo/2019/05/26/16/43/norway-4230680_1280.jpg'),
(162, 580, 'MP', 'MNP', 'Northern Mariana Islands', 'Îles Mariannes du Nord', 'Oceanie', 'https://cdn.pixabay.com/photo/2013/08/24/21/17/saipan-175425_1280.jpg'),
(164, 583, 'FM', 'FSM', 'Federated States of Micronesia', 'États Fédérés de Micronésie', 'Oceanie', 'https://guam.stripes.com/sites/default/files/styles/community_site_carousel_750x500/public/article-images/rock-islands-aerial_web_0.jpg?itok=GG4FFiM7'),
(165, 584, 'MH', 'MHL', 'Marshall Islands', 'Îles Marshall', 'Oceanie', 'https://cdn.pixabay.com/photo/2015/11/27/03/26/marshall-islands-1064876_1280.jpg'),
(166, 585, 'PW', 'PLW', 'Palau', 'Palaos', 'Oceanie', 'https://s.w-x.co/fr-palaos.jpg'),
(167, 586, 'PK', 'PAK', 'Pakistan', 'Pakistan', 'Asie', 'https://cdn.pixabay.com/photo/2019/06/29/05/24/pakistan-4305430_1280.jpg'),
(168, 591, 'PA', 'PAN', 'Panama', 'Panama', 'Amerique du sud', 'https://cdn.pixabay.com/photo/2013/08/19/22/19/south-america-174091_1280.jpg'),
(169, 598, 'PG', 'PNG', 'Papua New Guinea', 'Papouasie-Nouvelle-Guinée', 'Oceanie', 'https://cdn.pixabay.com/photo/2017/05/30/04/57/fish-market-2355812_1280.jpg'),
(170, 600, 'PY', 'PRY', 'Paraguay', 'Paraguay', 'Amerique du sud', 'https://cdn.pixabay.com/photo/2017/04/07/18/18/paraguay-2211577_1280.jpg'),
(171, 604, 'PE', 'PER', 'Peru', 'Pérou', 'Amerique du sud', 'https://cdn.pixabay.com/photo/2016/08/04/15/46/machu-picchu-1569324_1280.jpg'),
(172, 608, 'PH', 'PHL', 'Philippines', 'Philippines', 'Oceanie', 'https://cdn.pixabay.com/photo/2018/03/14/03/17/water-3224286_1280.jpg'),
(173, 612, 'PN', 'PCN', 'Pitcairn', 'Pitcairn', 'Oceanie', 'https://centralcruise.com/blog/wp-content/uploads/2017/11/ARANUI-iles-marquises-1024x683.jpg'),
(174, 616, 'PL', 'POL', 'Poland', 'Pologne', 'Europe', 'https://cdn.pixabay.com/photo/2020/04/19/08/06/old-town-5062333_1280.jpg'),
(175, 620, 'PT', 'PRT', 'Portugal', 'Portugal', 'Europe', 'https://cdn.pixabay.com/photo/2019/08/02/12/51/lisbon-4379656_1280.jpg'),
(176, 624, 'GW', 'GNB', 'Guinea-Bissau', 'Guinée-Bissau', 'Afrique', 'https://cdn.pixabay.com/photo/2014/08/30/18/24/village-431731_1280.jpg'),
(177, 626, 'TL', 'TLS', 'Timor-Leste', 'Timor-Leste', 'Oceanie', 'https://cdn.pixabay.com/photo/2013/12/14/05/19/wooden-228267_1280.jpg'),
(178, 630, 'PR', 'PRI', 'Puerto Rico', 'Porto Rico', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2013/08/27/16/47/building-176218_1280.jpg'),
(179, 634, 'QA', 'QAT', 'Qatar', 'Qatar', 'Asie', 'https://cdn.pixabay.com/photo/2018/12/02/06/33/skyscrapers-3850732_1280.jpg'),
(180, 638, 'RE', 'REU', 'Réunion', 'Réunion', 'Afrique', 'https://cdn.pixabay.com/photo/2014/08/20/22/14/reunion-island-422922_1280.jpg'),
(181, 642, 'RO', 'ROU', 'Romania', 'Roumanie', 'Europe', 'https://cdn.pixabay.com/photo/2014/10/09/23/19/peles-482667_1280.jpg'),
(182, 643, 'RU', 'RUS', 'Russian Federation', 'Fédération de Russie', 'Asie', 'https://cdn.pixabay.com/photo/2017/09/12/15/36/moscow-2742642_1280.jpg'),
(183, 646, 'RW', 'RWA', 'Rwanda', 'Rwanda', 'Afrique', 'https://cdn.pixabay.com/photo/2013/06/08/21/14/rwanda-123407_1280.jpg'),
(184, 654, 'SH', 'SHN', 'Saint Helena', 'Sainte-Hélène', 'Afrique', 'https://cdn.pixabay.com/photo/2013/07/18/14/59/mount-st-helens-164184_1280.jpg'),
(185, 659, 'KN', 'KNA', 'Saint Kitts and Nevis', 'Saint-Kitts-et-Nevis', 'Amerique centrale', 'https://www.guidesulysse.com/images/destinations/iStock-544104548.jpg'),
(186, 660, 'AI', 'AIA', 'Anguilla', 'Anguilla', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2018/10/01/16/55/anguilla-3716733_1280.jpg'),
(187, 662, 'LC', 'LCA', 'Saint Lucia', 'Sainte-Lucie', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2020/03/08/07/26/st-lucia-4911632_1280.jpg'),
(188, 666, 'PM', 'SPM', 'Saint-Pierre and Miquelon', 'Saint-Pierre-et-Miquelon', 'Amerique du nord', 'https://www.location-francophone.com/wp-content/uploads/2014/09/Saint-Pierre-et-Miquelon-1-2.jpg'),
(189, 670, 'VC', 'VCT', 'Saint Vincent and the Grenadines', 'Saint-Vincent-et-les Grenadines', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2018/08/25/21/18/st-vincent-and-the-grenadines-3630957_1280.jpg'),
(190, 674, 'SM', 'SMR', 'San Marino', 'Saint-Marin', 'Europe', 'https://cdn.pixabay.com/photo/2019/05/16/21/10/san-marino-4208256_1280.jpg'),
(191, 678, 'ST', 'STP', 'Sao Tome and Principe', 'Sao Tomé-et-Principe', 'Afrique', 'https://www.bilan.ch/assets/content/images/_storyImage/1PRINCIPE.jpg'),
(192, 682, 'SA', 'SAU', 'Saudi Arabia', 'Arabie Saoudite', 'Asie', 'https://cdn.pixabay.com/photo/2019/05/09/19/49/travel-4191991_1280.jpg'),
(193, 686, 'SN', 'SEN', 'Senegal', 'Sénégal', 'Afrique', 'https://cdn.pixabay.com/photo/2017/10/29/19/28/sea-2900621_1280.jpg'),
(194, 690, 'SC', 'SYC', 'Seychelles', 'Seychelles', 'Afrique', 'https://cdn.pixabay.com/photo/2018/07/22/22/36/praslin-3555706_1280.jpg'),
(195, 694, 'SL', 'SLE', 'Sierra Leone', 'Sierra Leone', 'Afrique', 'https://cdn.pixabay.com/photo/2017/04/26/18/44/sierra-2263384_1280.jpg'),
(196, 702, 'SG', 'SGP', 'Singapore', 'Singapour', 'Asie', 'https://cdn.pixabay.com/photo/2014/10/26/15/03/garden-by-the-bay-503897_1280.jpg'),
(197, 703, 'SK', 'SVK', 'Slovakia', 'Slovaquie', 'Europe', 'https://cdn.pixabay.com/photo/2016/12/13/23/56/bratislava-1905408_1280.jpg'),
(198, 704, 'VN', 'VNM', 'Vietnam', 'Viet Nam', 'Asie', 'https://cdn.pixabay.com/photo/2017/10/12/03/03/view-2843338_1280.jpg'),
(199, 705, 'SI', 'SVN', 'Slovenia', 'Slovénie', 'Europe', 'https://cdn.pixabay.com/photo/2017/01/19/23/46/panorama-1993645_1280.jpg'),
(200, 706, 'SO', 'SOM', 'Somalia', 'Somalie', 'Afrique', 'https://cdn.pixabay.com/photo/2020/04/16/06/53/river-5049398_1280.jpg'),
(201, 710, 'ZA', 'ZAF', 'South Africa', 'Afrique du Sud', 'Afrique', 'https://cdn.pixabay.com/photo/2016/08/02/09/46/cape-town-1562907_1280.jpg'),
(202, 716, 'ZW', 'ZWE', 'Zimbabwe', 'Zimbabwe', 'Afrique', 'https://cdn.pixabay.com/photo/2017/11/18/17/07/africa-2960532_1280.jpg'),
(203, 724, 'ES', 'ESP', 'Spain', 'Espagne', 'Europe', 'https://cdn.pixabay.com/photo/2016/10/18/21/16/plaza-espana-1751442_1280.jpg'),
(204, 732, 'EH', 'ESH', 'Western Sahara', 'Sahara Occidental', 'Afrique', 'https://cdn.pixabay.com/photo/2016/03/21/10/44/desert-1270345_1280.jpg'),
(205, 736, 'SD', 'SDN', 'Sudan', 'Soudan', 'Afrique', 'https://cdn.pixabay.com/photo/2016/09/10/10/38/desert-1658851_1280.jpg'),
(206, 740, 'SR', 'SUR', 'Suriname', 'Suriname', 'Amerique du sud', 'https://cdn.pixabay.com/photo/2018/03/18/15/40/body-of-water-3237144_1280.jpg'),
(207, 744, 'SJ', 'SJM', 'Svalbard and Jan Mayen', 'Svalbard et Île Jan Mayen', 'Europe', 'https://www.worldatlas.com/r/w1200-h701-c1200x701/upload/41/ec/76/shutterstock-416265475.jpg'),
(208, 748, 'SZ', 'SWZ', 'Swaziland', 'Swaziland', 'Afrique', 'https://cdn.pixabay.com/photo/2014/02/09/18/55/swaziland-263011_1280.jpg'),
(209, 752, 'SE', 'SWE', 'Sweden', 'Suède', 'Europe', 'https://cdn.pixabay.com/photo/2015/07/20/18/36/sweden-853150_1280.jpg'),
(210, 756, 'CH', 'CHE', 'Switzerland', 'Suisse', 'Europe', 'https://cdn.pixabay.com/photo/2016/09/19/22/46/hut-1681485_1280.jpg'),
(211, 760, 'SY', 'SYR', 'Syrian Arab Republic', 'République Arabe Syrienne', 'Afrique', 'https://www.ohchr.org/SiteCollectionImages/Bodies/Flags/syr.gif?Width=158'),
(212, 762, 'TJ', 'TJK', 'Tajikistan', 'Tadjikistan', 'Asie', 'https://cdn.pixabay.com/photo/2020/01/04/14/46/tajikistan-4740798_1280.jpg'),
(213, 764, 'TH', 'THA', 'Thailand', 'Thaïlande', 'Asie', 'https://cdn.pixabay.com/photo/2016/11/14/03/38/phra-nakhon-si-ayutthaya-1822502_1280.jpg'),
(214, 768, 'TG', 'TGO', 'Togo', 'Togo', 'Afrique', 'https://cdn.pixabay.com/photo/2020/04/23/14/03/palm-tress-5082649_1280.jpg'),
(215, 772, 'TK', 'TKL', 'Tokelau', 'Tokelau', 'Oceanie', 'https://cdn.pixabay.com/photo/2017/08/30/13/10/tokelau-2697030_1280.jpg'),
(216, 776, 'TO', 'TON', 'Tonga', 'Tonga', 'Oceanie', 'https://img.ev.mu/images/portfolio/pays/219/600x400/846766.jpg'),
(217, 780, 'TT', 'TTO', 'Trinidad and Tobago', 'Trinité-et-Tobago', 'Amerique centrale', 'https://cdn.pixabay.com/photo/2017/06/17/19/32/tobago-2413305_1280.jpg'),
(218, 784, 'AE', 'ARE', 'United Arab Emirates', 'Émirats Arabes Unis', 'Asie', 'https://cdn.pixabay.com/photo/2019/11/05/20/36/abu-dhabi-4604499_1280.jpg'),
(219, 788, 'TN', 'TUN', 'Tunisia', 'Tunisie', 'Afrique', 'https://cdn.pixabay.com/photo/2017/06/20/23/59/tunisia-2425441_1280.jpg'),
(220, 792, 'TR', 'TUR', 'Turkey', 'Turquie', 'Asie', 'https://cdn.pixabay.com/photo/2020/02/23/12/22/isanbul-4873198_1280.jpg'),
(221, 795, 'TM', 'TKM', 'Turkmenistan', 'Turkménistan', 'Asie', 'https://cdn.pixabay.com/photo/2017/08/30/14/33/turkmenistan-2697332_1280.jpg'),
(222, 796, 'TC', 'TCA', 'Turks and Caicos Islands', 'Îles Turks et Caïques', 'Amerique centrale', 'https://assets.hotelplan.com/content/TH/00/117/602/hotel/fr/leadimage/357566.jpg'),
(223, 798, 'TV', 'TUV', 'Tuvalu', 'Tuvalu', 'Oceanie', 'https://cdn.pixabay.com/photo/2014/07/04/17/26/sea-384055_1280.jpg'),
(224, 800, 'UG', 'UGA', 'Uganda', 'Ouganda', 'Afrique', 'https://cdn.pixabay.com/photo/2017/02/27/18/33/lake-albert-2103890_1280.jpg'),
(225, 804, 'UA', 'UKR', 'Ukraine', 'Ukraine', 'Asie', 'https://cdn.pixabay.com/photo/2017/01/01/20/30/kiev-1945487_1280.jpg'),
(226, 807, 'MK', 'MKD', 'The Former Yugoslav Republic of Macedonia', 'L\'ex-République Yougoslave de Macédoine', 'Europe', ''),
(227, 818, 'EG', 'EGY', 'Egypt', 'Égypte', 'Afrique', 'https://cdn.pixabay.com/photo/2017/03/20/14/33/pyramids-2159286_1280.jpg'),
(228, 826, 'GB', 'GBR', 'United Kingdom', 'Royaume-Uni', 'Europe', 'https://cdn.pixabay.com/photo/2017/06/11/18/03/london-2393098_1280.jpg'),
(229, 833, 'IM', 'IMN', 'Isle of Man', 'Île de Man', 'Europe', 'https://cdn.pixabay.com/photo/2018/04/04/14/58/niarbyl-3290031_1280.jpg'),
(230, 834, 'TZ', 'TZA', 'United Republic Of Tanzania', 'République-Unie de Tanzanie', 'Afrique', 'https://www.tresor.economie.gouv.fr/Pays/Pages/be80661a-1af5-4faa-8ba8-8fc1b88a344e/images/e686f8e4-ad67-4056-a2ab-565c2d35797e'),
(231, 840, 'US', 'USA', 'United States', 'États-Unis', 'Amerique du nord', 'https://cdn.pixabay.com/photo/2015/03/11/12/31/new-york-668616_1280.jpg'),
(232, 850, 'VI', 'VIR', 'U.S. Virgin Islands', 'Îles Vierges des États-Unis', 'Amerique centrale', 'https://fr.visittheusa.ca/sites/default/files/styles/hero_m_1300x700/public/images/hero_media_image/2016-09/HERO_stock-photo-st-thomas-97436261_72DPI_0.jpg?itok=88DIfmoW'),
(233, 854, 'BF', 'BFA', 'Burkina Faso', 'Burkina Faso', 'Afrique', 'https://cdn.pixabay.com/photo/2013/10/29/19/23/path-202554_1280.jpg'),
(234, 858, 'UY', 'URY', 'Uruguay', 'Uruguay', 'Amerique du sud', 'https://cdn.pixabay.com/photo/2016/12/06/22/53/uruguay-1888216_1280.jpg'),
(235, 860, 'UZ', 'UZB', 'Uzbekistan', 'Ouzbékistan', 'Asie', 'https://cdn.pixabay.com/photo/2013/10/20/22/06/khiva-198685_1280.jpg'),
(236, 862, 'VE', 'VEN', 'Venezuela', 'Venezuela', 'Amerique du sud', 'https://cdn.pixabay.com/photo/2013/05/06/14/43/merida-109143_1280.jpg'),
(237, 876, 'WF', 'WLF', 'Wallis and Futuna', 'Wallis et Futuna', 'Oceanie', 'https://cdn.pixabay.com/photo/2017/08/30/14/34/wallis-and-futuna-2697337_1280.jpg'),
(238, 882, 'WS', 'WSM', 'Samoa', 'Samoa', 'Oceanie', 'https://cdn.pixabay.com/photo/2013/11/19/09/41/samoa-213160_1280.jpg'),
(239, 887, 'YE', 'YEM', 'Yemen', 'Yémen', 'Asie', 'https://cdn.pixabay.com/photo/2020/04/15/13/46/city-5046666_1280.jpg'),
(240, 891, 'CS', 'SCG', 'Serbia and Montenegro', 'Serbie-et-Monténégro', 'Europe', 'https://cdn.pixabay.com/photo/2019/10/28/10/37/belgrade-4583965_1280.jpg'),
(241, 894, 'ZM', 'ZMB', 'Zambia', 'Zambie', 'Afrique', 'https://cdn.pixabay.com/photo/2013/02/17/07/20/zambia-82448_1280.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `steps`
--

CREATE TABLE `steps` (
  `step_id` int(11) NOT NULL,
  `step_name` varchar(128) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `date_beginning` date NOT NULL,
  `date_end` date NOT NULL,
  `accomodation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `steps`
--

INSERT INTO `steps` (`step_id`, `step_name`, `trip_id`, `date_beginning`, `date_end`, `accomodation_id`) VALUES
(1, 'Munster', 1, '2020-06-26', '2020-07-02', 1),
(2, 'Lucerne', 1, '2020-07-03', '2020-07-09', 2),
(46, 'Pause en Angleterre', 50, '2020-06-15', '2020-06-21', 5),
(47, 'Camping en Grèce', 50, '2020-06-22', '2020-06-26', 6),
(51, 'Hotel Etoilé', 51, '2020-07-01', '2020-07-05', 4),
(52, 'Le Munster des Vosges', 61, '2020-05-18', '2020-05-24', 1),
(55, 'Une nuit à Berlin', 51, '2020-05-18', '2020-05-19', 35);

-- --------------------------------------------------------

--
-- Structure de la table `steps_votes`
--

CREATE TABLE `steps_votes` (
  `user_id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `transport`
--

CREATE TABLE `transport` (
  `transport_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `prix` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `transport`
--

INSERT INTO `transport` (`transport_id`, `type`, `prix`) VALUES
(1, 'avion', 100),
(2, 'bateau', 20),
(3, 'bus', 15),
(4, 'voiture', 10),
(5, 'voiture de location', 16),
(6, 'train', 60),
(7, 'velo', 0),
(8, 'moto', 9),
(9, 'cheval', 30),
(10, 'roulotte', 45),
(11, 'covoiturage', 11),
(12, 'autostop', 0);

-- --------------------------------------------------------

--
-- Structure de la table `transports`
--

CREATE TABLE `transports` (
  `transport_id` int(11) NOT NULL,
  `step_id` int(11) DEFAULT NULL,
  `type` varchar(64) NOT NULL,
  `date_beginning` date NOT NULL,
  `date_end` date NOT NULL,
  `time_beginning` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `origin` varchar(128) NOT NULL,
  `destination` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `price` float UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `transports`
--

INSERT INTO `transports` (`transport_id`, `step_id`, `type`, `date_beginning`, `date_end`, `time_beginning`, `time_end`, `origin`, `destination`, `description`, `price`) VALUES
(1, 1, 'Vélo', '2020-07-03', '2020-07-03', '16:12:00', '20:12:00', 'Nancy', 'Munster', '', 0),
(2, 2, 'Trotinette', '2020-02-22', '2020-02-22', '10:30:00', '12:25:00', 'Munster', 'Lucerne', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `transports_votes`
--

CREATE TABLE `transports_votes` (
  `user_id` int(11) NOT NULL,
  `transport_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `trips`
--

CREATE TABLE `trips` (
  `trip_id` int(11) NOT NULL,
  `trip_name` varchar(256) NOT NULL,
  `date_beginning` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `location` varchar(256) DEFAULT NULL,
  `creator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `trips`
--

INSERT INTO `trips` (`trip_id`, `trip_name`, `date_beginning`, `date_end`, `location`, `creator_id`) VALUES
(1, 'Quand je serai à Milan\r\nJ\'achèterai des collants', '2020-06-26', '2020-07-24', 'Milan', 1),
(50, 'Voyage en Europe', '2020-05-25', '2020-06-28', 'Barcelona', 3),
(51, 'Allemagne Trip', '2020-07-01', '2020-07-31', 'Berlin', 3),
(60, 'America Dream Trip', '0000-00-00', '0000-00-00', 'New York City !', 3),
(61, 'Tour de France', '0000-00-00', '0000-00-00', '', 3),
(68, 'Asia Trip', '2020-05-01', '2020-05-31', 'Pékin', 3);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `nom` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(191) NOT NULL,
  `mdp` text NOT NULL,
  `date_creation_compte` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `mail`, `mdp`, `date_creation_compte`) VALUES
(2, 'Peillon', 'Elodie', 'peillon.elodie@gmail.com', '$6iNSd9Nhvdf2', '2020-04-18 00:53:32'),
(3, 'Boiteux', 'P&eacute;kin', 'boiteuxpekin@gmail.com', '$6lSDWvqo/Wf.', '2020-04-18 01:46:43'),
(4, 'Peillon', 'Elodie', 'peillon.elodie8@gmail.com', '$67sS1RsBusO.', '2020-04-18 13:18:56'),
(5, 'Pint', 'Lo&eacute;lia', 'lonancy@mail.com', '$6tW3qZy3c0nc', '2020-04-30 11:36:08');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `nom` varchar(256) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `mail` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `date_of_birth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `nom`, `prenom`, `mail`, `password`, `created`, `modified`, `date_of_birth`) VALUES
(1, 'jimi', '', 'jimi@univ-lorraine.fr', 'bcbbccb723705ed5d134879c2d459a0d3ef2bd8cd2012ddf0664601898f50362', '2020-02-08 15:48:22', '2020-02-08 15:48:22', '1942-11-27'),
(2, 'eric', '', 'eric@univ-lorraine.fr', 'e19ae18ae9530b9837539fd441f242f094d612c276b1e88514e3d5abaa5f0f69', '2020-02-08 15:51:15', '2020-02-08 16:15:41', '1945-04-30'),
(3, 'PINT', 'Loelia', 'lo@mail.com', '$6tW3qZy3c0nc', '2020-04-30 18:38:26', NULL, '0000-00-00'),
(4, 'test', 'test_lo', '123@mail.fr', '$635k70AKKxI2', '2020-05-05 14:05:14', NULL, '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `users_dislike`
--

CREATE TABLE `users_dislike` (
  `dislike_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `accomodation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users_dislike`
--

INSERT INTO `users_dislike` (`dislike_id`, `user_id`, `accomodation_id`) VALUES
(1, 0, 7),
(2, 0, 8);

-- --------------------------------------------------------

--
-- Structure de la table `users_like`
--

CREATE TABLE `users_like` (
  `like_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `accomodation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users_like`
--

INSERT INTO `users_like` (`like_id`, `user_id`, `accomodation_id`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `users_trips`
--

CREATE TABLE `users_trips` (
  `user_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `accomodations`
--
ALTER TABLE `accomodations`
  ADD PRIMARY KEY (`accomodation_id`);

--
-- Index pour la table `accomodations_votes`
--
ALTER TABLE `accomodations_votes`
  ADD PRIMARY KEY (`user_id`,`accomodation_id`),
  ADD KEY `accomodation_id` (`accomodation_id`);

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`activite_id`),
  ADD KEY `lieux_activite` (`type`);

--
-- Index pour la table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `step_id` (`step_id`);

--
-- Index pour la table `activities_votes`
--
ALTER TABLE `activities_votes`
  ADD PRIMARY KEY (`user_id`,`activity_id`),
  ADD KEY `activity_id` (`activity_id`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alpha2` (`alpha2`),
  ADD UNIQUE KEY `alpha3` (`alpha3`),
  ADD UNIQUE KEY `code_unique` (`code`);

--
-- Index pour la table `steps`
--
ALTER TABLE `steps`
  ADD PRIMARY KEY (`step_id`),
  ADD KEY `trip_id` (`trip_id`),
  ADD KEY `accomodation_id` (`accomodation_id`);

--
-- Index pour la table `steps_votes`
--
ALTER TABLE `steps_votes`
  ADD PRIMARY KEY (`user_id`,`step_id`),
  ADD KEY `step_id` (`step_id`);

--
-- Index pour la table `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`transport_id`);

--
-- Index pour la table `transports`
--
ALTER TABLE `transports`
  ADD PRIMARY KEY (`transport_id`),
  ADD KEY `step_id` (`step_id`);

--
-- Index pour la table `transports_votes`
--
ALTER TABLE `transports_votes`
  ADD PRIMARY KEY (`user_id`,`transport_id`),
  ADD KEY `transport_id` (`transport_id`);

--
-- Index pour la table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`trip_id`),
  ADD KEY `creator_id` (`creator_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Index pour la table `users_dislike`
--
ALTER TABLE `users_dislike`
  ADD PRIMARY KEY (`dislike_id`);

--
-- Index pour la table `users_like`
--
ALTER TABLE `users_like`
  ADD PRIMARY KEY (`like_id`);

--
-- Index pour la table `users_trips`
--
ALTER TABLE `users_trips`
  ADD PRIMARY KEY (`user_id`,`trip_id`),
  ADD KEY `trip_id` (`trip_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `accomodations`
--
ALTER TABLE `accomodations`
  MODIFY `accomodation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `activite`
--
ALTER TABLE `activite`
  MODIFY `activite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `activities`
--
ALTER TABLE `activities`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `pays`
--
ALTER TABLE `pays`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT pour la table `steps`
--
ALTER TABLE `steps`
  MODIFY `step_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT pour la table `transport`
--
ALTER TABLE `transport`
  MODIFY `transport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `transports`
--
ALTER TABLE `transports`
  MODIFY `transport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `trips`
--
ALTER TABLE `trips`
  MODIFY `trip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `users_dislike`
--
ALTER TABLE `users_dislike`
  MODIFY `dislike_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `users_like`
--
ALTER TABLE `users_like`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `accomodations_votes`
--
ALTER TABLE `accomodations_votes`
  ADD CONSTRAINT `accomodations_votes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `accomodations_votes_ibfk_2` FOREIGN KEY (`accomodation_id`) REFERENCES `accomodations` (`accomodation_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `activite`
--
ALTER TABLE `activite`
  ADD CONSTRAINT `lieux_activite` FOREIGN KEY (`activite_id`) REFERENCES `accomodations` (`accomodation_id`);

--
-- Contraintes pour la table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`step_id`) REFERENCES `steps` (`step_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `activities_votes`
--
ALTER TABLE `activities_votes`
  ADD CONSTRAINT `activities_votes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `activities_votes_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`activity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `steps`
--
ALTER TABLE `steps`
  ADD CONSTRAINT `step_location_name` FOREIGN KEY (`accomodation_id`) REFERENCES `accomodations` (`accomodation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `steps_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`trip_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `steps_votes`
--
ALTER TABLE `steps_votes`
  ADD CONSTRAINT `steps_votes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `steps_votes_ibfk_2` FOREIGN KEY (`step_id`) REFERENCES `steps` (`step_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `transports`
--
ALTER TABLE `transports`
  ADD CONSTRAINT `transports_ibfk_1` FOREIGN KEY (`step_id`) REFERENCES `steps` (`step_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `transports_votes`
--
ALTER TABLE `transports_votes`
  ADD CONSTRAINT `transports_votes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transports_votes_ibfk_2` FOREIGN KEY (`transport_id`) REFERENCES `transports` (`transport_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `users_trips`
--
ALTER TABLE `users_trips`
  ADD CONSTRAINT `users_trips_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_trips_ibfk_2` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`trip_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
