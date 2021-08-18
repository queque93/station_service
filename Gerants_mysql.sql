CREATE DATABASE IF NOT EXISTS `GERANTS` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `GERANTS`;

CREATE TABLE `CLIENT` (
  `id_client` VARCHAR(42),
  `nom_client` VARCHAR(42),
  `numero_client` VARCHAR(42),
  `type_client` VARCHAR(42),
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `BANQUE` (
  `id_banque` VARCHAR(42),
  `nom_banque` VARCHAR(42),
  `nom_responsable` VARCHAR(42),
  `numero_responsable` VARCHAR(42),
  PRIMARY KEY (`id_banque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `VENTE` (
  `id_vente` VARCHAR(42),
  `espece` VARCHAR(42),
  `tpe` VARCHAR(42),
  `credit` VARCHAR(42),
  `date_vente` VARCHAR(42),
  `id_pompiste` VARCHAR(42),
  PRIMARY KEY (`id_vente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `REMBOURSEMENT` (
  `id_remboursement` VARCHAR(42),
  `date_remboursement` VARCHAR(42),
  `montant_remboursement` VARCHAR(42),
  `type_remboursement` VARCHAR(42),
  `id_client` VARCHAR(42),
  `id_credit` VARCHAR(42),
  PRIMARY KEY (`id_remboursement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `VERSEMENT` (
  `id_versement` VARCHAR(42),
  `montant` VARCHAR(42),
  `date_versement` VARCHAR(42),
  `bordereau_versement` VARCHAR(42),
  `id_gerant` VARCHAR(42),
  `id_banque` VARCHAR(42),
  PRIMARY KEY (`id_versement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `POMPISTE` (
  `id_pompiste` VARCHAR(42),
  `prenom_pompiste` VARCHAR(42),
  `nom_pompiste` VARCHAR(42),
  `adresse_pompiste` VARCHAR(42),
  `telephone_pompiste` VARCHAR(42),
  `id_user` VARCHAR(42),
  `login` VARCHAR(42),
  `status` VARCHAR(42),
  `id_station` VARCHAR(42),
  PRIMARY KEY (`id_pompiste`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `POMPE` (
  `id_pompe` VARCHAR(42),
  `libelle` VARCHAR(42),
  `status` VARCHAR(42),
  `id_cuve` VARCHAR(42),
  PRIMARY KEY (`id_pompe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CREDIT` (
  `id_credit` VARCHAR(42),
  `libelle` VARCHAR(42),
  `type_credit` VARCHAR(42),
  `date_credit` VARCHAR(42),
  `montant` VARCHAR(42),
  `id_client` VARCHAR(42),
  `id_gerant` VARCHAR(42),
  PRIMARY KEY (`id_credit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `OCTROIE` (
  `id_gerant` VARCHAR(42),
  `id_credit` VARCHAR(42),
  PRIMARY KEY (`id_gerant`, `id_credit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `GERANT` (
  `id_gerant` VARCHAR(42),
  `prenom_gerant` VARCHAR(42),
  `nom_gerant` VARCHAR(42),
  `adresse_gerant` VARCHAR(42),
  `telephone_gerant` VARCHAR(42),
  `mail_gerant` VARCHAR(42),
  `id_user` VARCHAR(42),
  `login` VARCHAR(42),
  PRIMARY KEY (`id_gerant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `INDEX` (
  `index_depart` VARCHAR(42),
  `index_fermeture` VARCHAR(42),
  `date_index` VARCHAR(42),
  `id_pompiste` VARCHAR(42),
  PRIMARY KEY (`index_depart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `DONNE` (
  `id_direction` VARCHAR(42),
  `id_credit` VARCHAR(42),
  PRIMARY KEY (`id_direction`, `id_credit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `STATION` (
  `id_station` VARCHAR(42),
  `nom_station` VARCHAR(42),
  `adresse_station` VARCHAR(42),
  `telephone_station` VARCHAR(42),
  `type_payement` VARCHAR(42),
  `statusbis_station` VARCHAR(42),
  `objectif` VARCHAR(42),
  `besoin` VARCHAR(42),
  `status` VARCHAR(42),
  `id_gerant` VARCHAR(42),
  PRIMARY KEY (`id_station`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CUVE` (
  `id_cuve` VARCHAR(42),
  `capacite` VARCHAR(42),
  `status` VARCHAR(42),
  `id_produit` VARCHAR(42),
  `index_depart` VARCHAR(42),
  `id_station` VARCHAR(42),
  PRIMARY KEY (`id_cuve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `DIRECTION` (
  `id_direction` VARCHAR(42),
  `nom_responsable` VARCHAR(42),
  PRIMARY KEY (`id_direction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `COMMANDE` (
  `numero_commande` VARCHAR(42),
  `quantité` VARCHAR(42),
  `date_commande` VARCHAR(42),
  `id_direction` VARCHAR(42),
  `id_produit` VARCHAR(42),
  PRIMARY KEY (`numero_commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `PRODUIT` (
  `id_produit` VARCHAR(42),
  `nom` VARCHAR(42),
  `reference` VARCHAR(42),
  `prix` VARCHAR(42),
  PRIMARY KEY (`id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `LIVRAISON` (
  `id_livraison` VARCHAR(42),
  `quantité` VARCHAR(42),
  `bon_livraison` VARCHAR(42),
  `voiture` VARCHAR(42),
  `chauffeur` VARCHAR(42),
  `id_produit` VARCHAR(42),
  PRIMARY KEY (`id_livraison`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `VENTE` ADD FOREIGN KEY (`id_pompiste`) REFERENCES `POMPISTE` (`id_pompiste`);
ALTER TABLE `REMBOURSEMENT` ADD FOREIGN KEY (`id_credit`) REFERENCES `CREDIT` (`id_credit`);
ALTER TABLE `REMBOURSEMENT` ADD FOREIGN KEY (`id_client`) REFERENCES `CLIENT` (`id_client`);
ALTER TABLE `VERSEMENT` ADD FOREIGN KEY (`id_banque`) REFERENCES `BANQUE` (`id_banque`);
ALTER TABLE `VERSEMENT` ADD FOREIGN KEY (`id_gerant`) REFERENCES `GERANT` (`id_gerant`);
ALTER TABLE `POMPISTE` ADD FOREIGN KEY (`id_station`) REFERENCES `STATION` (`id_station`);
ALTER TABLE `POMPE` ADD FOREIGN KEY (`id_cuve`) REFERENCES `CUVE` (`id_cuve`);
ALTER TABLE `CREDIT` ADD FOREIGN KEY (`id_gerant`) REFERENCES `GERANT` (`id_gerant`);
ALTER TABLE `CREDIT` ADD FOREIGN KEY (`id_client`) REFERENCES `CLIENT` (`id_client`);
ALTER TABLE `OCTROIE` ADD FOREIGN KEY (`id_credit`) REFERENCES `CREDIT` (`id_credit`);
ALTER TABLE `OCTROIE` ADD FOREIGN KEY (`id_gerant`) REFERENCES `GERANT` (`id_gerant`);
ALTER TABLE `INDEX` ADD FOREIGN KEY (`id_pompiste`) REFERENCES `POMPISTE` (`id_pompiste`);
ALTER TABLE `DONNE` ADD FOREIGN KEY (`id_credit`) REFERENCES `CREDIT` (`id_credit`);
ALTER TABLE `DONNE` ADD FOREIGN KEY (`id_direction`) REFERENCES `DIRECTION` (`id_direction`);
ALTER TABLE `STATION` ADD FOREIGN KEY (`id_gerant`) REFERENCES `GERANT` (`id_gerant`);
ALTER TABLE `CUVE` ADD FOREIGN KEY (`id_station`) REFERENCES `STATION` (`id_station`);
ALTER TABLE `CUVE` ADD FOREIGN KEY (`index_depart`) REFERENCES `INDEX` (`index_depart`);
ALTER TABLE `CUVE` ADD FOREIGN KEY (`id_produit`) REFERENCES `PRODUIT` (`id_produit`);
ALTER TABLE `COMMANDE` ADD FOREIGN KEY (`id_produit`) REFERENCES `PRODUIT` (`id_produit`);
ALTER TABLE `COMMANDE` ADD FOREIGN KEY (`id_direction`) REFERENCES `DIRECTION` (`id_direction`);
ALTER TABLE `LIVRAISON` ADD FOREIGN KEY (`id_produit`) REFERENCES `PRODUIT` (`id_produit`);