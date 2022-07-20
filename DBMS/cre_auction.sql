-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
CREATE SCHEMA auction;
-- -----------------------------------------------------

-- -----------------------------------------------------
USE auction;
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table seller
-- -----------------------------------------------------
DROP TABLE IF EXISTS seller ;

CREATE TABLE IF NOT EXISTS seller (
  SellerID INT NOT NULL,
  Name VARCHAR(120) NOT NULL,
  Phone CHAR(13) NOT NULL,
  PRIMARY KEY (SellerID))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table artefact
-- -----------------------------------------------------
DROP TABLE IF EXISTS artefact ;

CREATE TABLE IF NOT EXISTS artefact (
  ID INT NOT NULL,
  Name VARCHAR(50) NOT NULL,
  Description VARCHAR(250) NOT NULL,
  PRIMARY KEY (ID))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table buyer
-- -----------------------------------------------------
DROP TABLE IF EXISTS buyer ;

CREATE TABLE IF NOT EXISTS buyer (
  BuyerID INT NOT NULL,
  Name VARCHAR(120) NOT NULL,
  Phone VARCHAR(13) NOT NULL,
  PRIMARY KEY (BuyerID))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table offer
-- -----------------------------------------------------
DROP TABLE IF EXISTS offer ;

CREATE TABLE IF NOT EXISTS offer (
  SellerID INT NOT NULL,
  BuyerID INT NOT NULL,
  ArtefactID INT NOT NULL,
  OfferDate DATE NOT NULL,
  Ammount DECIMAL(7,2) NOT NULL,
  Acceptance TINYINT NULL DEFAULT 0,
  PRIMARY KEY (SellerID, BuyerID, ArtefactID),
  INDEX fk_Offer_Artefact1_idx (ArtefactID ASC),
  INDEX fk_Offer_Buyer1_idx (BuyerID ASC),
  CONSTRAINT fk_Offer_Seller
    FOREIGN KEY (SellerID)
    REFERENCES seller (SellerID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Offer_Artefact1
    FOREIGN KEY (ArtefactID)
    REFERENCES artefact (ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Offer_Buyer1
    FOREIGN KEY (BuyerID)
    REFERENCES buyer (BuyerID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Auction Insert SQL --
INSERT into seller values (1, 'Ann', '0509 123 321'),
(2, 'Bill', '0518 234 432'), 
(3, 'Carol', '02 8344 4777'); 

INSERT into artefact values (1, 'Vase', 'Ming Vase H50cm W30cm'), 
(2, 'Sketch', 'Early Modern Dutch School'), 
(3, 'Pot', 'Copper' 'US 18th Century'); 

INSERT into buyer values (1, 'Maggie', '0539 335 577'), 
(2, 'Nigel', '0519 434 389'), (3, 'Olga', '13 24 35');

INSERT into offer values (1,1,1,'2012-06-20', 81223.23,'0'), 
(1,1,2, '2012-06-20', 82223.23, '0'), 
(2,2,1, '2012-06-20', 1995.50, '0'), 
(2,2,2, '2012-06-20', 2300.15, '0');

COMMIT;SELECT * from offer;