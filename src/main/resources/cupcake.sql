-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cupcake
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cupcake
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cupcake` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `cupcake` ;

-- -----------------------------------------------------
-- Table `cupcake`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`admin` (
                                                 `admin_id` INT NOT NULL AUTO_INCREMENT,
                                                 `admin_username` VARCHAR(45) NOT NULL,
    `admin_password` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`admin_id`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cupcake`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`order` (
                                                 `order_id` INT NOT NULL AUTO_INCREMENT,
                                                 `order_username` VARCHAR(45) NOT NULL,
    `order_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `order_totalprice` INT NOT NULL,
    `order_checker` TINYINT NOT NULL DEFAULT '0',
    PRIMARY KEY (`order_id`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cupcake`.`cupcake_top`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`cupcake_top` (
                                                       `top_id` INT NOT NULL AUTO_INCREMENT,
                                                       `top_name` VARCHAR(45) NOT NULL,
    `top_price` INT NOT NULL,
    PRIMARY KEY (`top_id`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcake`.`cupcake_base`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`cupcake_base` (
                                                        `base_id` INT NOT NULL AUTO_INCREMENT,
                                                        `base_name` VARCHAR(45) NOT NULL,
    `base_price` INT NOT NULL,
    PRIMARY KEY (`base_id`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcake`.`orderline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`orderline` (
                                                     `top_id` INT NOT NULL,
                                                     `base_id` INT NOT NULL,
                                                     `orderline_amount` INT NOT NULL,
                                                     `orderline_id` INT NOT NULL AUTO_INCREMENT,
                                                     PRIMARY KEY (`orderline_id`),
    INDEX `fk_orderline_cupcake_top1_idx` (`top_id` ASC) VISIBLE,
    INDEX `fk_orderline_cupcake_base1_idx` (`base_id` ASC) VISIBLE,
    CONSTRAINT `fk_orderline_order1`
    FOREIGN KEY (`orderline_id`)
    REFERENCES `cupcake`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_orderline_cupcake_top1`
    FOREIGN KEY (`top_id`)
    REFERENCES `cupcake`.`cupcake_top` (`top_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_orderline_cupcake_base1`
    FOREIGN KEY (`base_id`)
    REFERENCES `cupcake`.`cupcake_base` (`base_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cupcake`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`user` (
                                                `user_id` INT NOT NULL AUTO_INCREMENT,
                                                `user_username` VARCHAR(45) NOT NULL,
    `user_password` VARCHAR(45) NOT NULL,
    `user_saldo` INT NOT NULL,
    `user_email` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`user_id`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
