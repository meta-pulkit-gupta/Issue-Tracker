SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `issue_tracker` ;
CREATE SCHEMA IF NOT EXISTS `issue_tracker` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `issue_tracker` ;

-- -----------------------------------------------------
-- Table `issue_tracker`.`user_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `issue_tracker`.`user_details` ;

CREATE  TABLE IF NOT EXISTS `issue_tracker`.`user_details` (
  `user_id` INT NOT NULL AUTO_INCREMENT ,
  `google_id` VARCHAR(255) NOT NULL ,
  `name` VARCHAR(255) NOT NULL ,
  `email` VARCHAR(255) NOT NULL ,
  `role` ENUM('general','dept-head','admin','resolver') NULL DEFAULT 'general' ,
  `dept_id` INT NULL DEFAULT 0 ,
  `profile_pic_url` VARCHAR(400) NULL ,
  PRIMARY KEY (`user_id`) ,
  UNIQUE INDEX `google_id_UNIQUE` (`google_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `issue_tracker`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `issue_tracker`.`department` ;

CREATE  TABLE IF NOT EXISTS `issue_tracker`.`department` (
  `dept_id` INT NOT NULL AUTO_INCREMENT ,
  `dept_name` VARCHAR(255) NOT NULL ,
  `dept_head` INT NULL ,
  PRIMARY KEY (`dept_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `issue_tracker`.`issues`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `issue_tracker`.`issues` ;

CREATE  TABLE IF NOT EXISTS `issue_tracker`.`issues` (
  `issue_id` INT NOT NULL AUTO_INCREMENT ,
  `created_by` INT NOT NULL ,
  `created_on` TIMESTAMP NOT NULL ,
  `dept_id` INT NULL ,
  `title` VARCHAR(255) NOT NULL ,
  `body` BLOB NOT NULL ,
  `priority` ENUM('low','medium','high') NULL DEFAULT 'low' ,
  `target_resolution_date` TIMESTAMP NULL ,
  `actual_resolution_date` TIMESTAMP NULL ,
  `current_status` VARCHAR(45) NULL ,
  PRIMARY KEY (`issue_id`) ,
  INDEX `fk_issues_user_details` (`created_by` ASC) ,
  INDEX `fk_issues_department1` (`dept_id` ASC) ,
  CONSTRAINT `fk_issues_user_details`
    FOREIGN KEY (`created_by` )
    REFERENCES `issue_tracker`.`user_details` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_issues_department1`
    FOREIGN KEY (`dept_id` )
    REFERENCES `issue_tracker`.`department` (`dept_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `issue_tracker`.`issue_attachment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `issue_tracker`.`issue_attachment` ;

CREATE  TABLE IF NOT EXISTS `issue_tracker`.`issue_attachment` (
  `attachment_id` INT NOT NULL AUTO_INCREMENT ,
  `issue_id` INT NOT NULL ,
  `attachment_url` VARCHAR(400) NOT NULL ,
  PRIMARY KEY (`attachment_id`) ,
  INDEX `fk_issue_attachment_issues1` (`issue_id` ASC) ,
  CONSTRAINT `fk_issue_attachment_issues1`
    FOREIGN KEY (`issue_id` )
    REFERENCES `issue_tracker`.`issues` (`issue_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `issue_tracker`.`tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `issue_tracker`.`tags` ;

CREATE  TABLE IF NOT EXISTS `issue_tracker`.`tags` (
  `tag_id` INT NOT NULL ,
  `tag_title` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`tag_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `issue_tracker`.`issue_tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `issue_tracker`.`issue_tags` ;

CREATE  TABLE IF NOT EXISTS `issue_tracker`.`issue_tags` (
  `issue_id` INT NOT NULL ,
  `tag_id` INT NOT NULL ,
  PRIMARY KEY (`issue_id`, `tag_id`) ,
  INDEX `fk_issue_tags_issues1` (`issue_id` ASC) ,
  INDEX `fk_issue_tags_tags1` (`tag_id` ASC) ,
  CONSTRAINT `fk_issue_tags_issues1`
    FOREIGN KEY (`issue_id` )
    REFERENCES `issue_tracker`.`issues` (`issue_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_issue_tags_tags1`
    FOREIGN KEY (`tag_id` )
    REFERENCES `issue_tracker`.`tags` (`tag_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `issue_tracker`.`issue_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `issue_tracker`.`issue_status` ;

CREATE  TABLE IF NOT EXISTS `issue_tracker`.`issue_status` (
  `issue_id` INT NOT NULL ,
  `status` ENUM('received','approved','assigned','resolved','closed','conflict','rejected') NOT NULL DEFAULT 'received' ,
  `updated_on` TIMESTAMP NULL ,
  `updated_by` INT NULL ,
  INDEX `fk_issue_status_issues1` (`issue_id` ASC) ,
  CONSTRAINT `fk_issue_status_issues1`
    FOREIGN KEY (`issue_id` )
    REFERENCES `issue_tracker`.`issues` (`issue_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `issue_tracker`.`comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `issue_tracker`.`comments` ;

CREATE  TABLE IF NOT EXISTS `issue_tracker`.`comments` (
  `comment_id` INT NOT NULL ,
  `issue_id` INT NOT NULL ,
  `user_id` INT NOT NULL ,
  `comment` VARCHAR(400) NULL ,
  PRIMARY KEY (`comment_id`) ,
  INDEX `fk_comments_issues1` (`issue_id` ASC) ,
  CONSTRAINT `fk_comments_issues1`
    FOREIGN KEY (`issue_id` )
    REFERENCES `issue_tracker`.`issues` (`issue_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `issue_tracker`.`issue_resolvers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `issue_tracker`.`issue_resolvers` ;

CREATE  TABLE IF NOT EXISTS `issue_tracker`.`issue_resolvers` (
  `issue_id` INT NOT NULL ,
  `resolver_id` INT NOT NULL ,
  PRIMARY KEY (`issue_id`, `resolver_id`) ,
  INDEX `fk_user_details_has_issues_issues1` (`issue_id` ASC) ,
  INDEX `fk_user_details_has_issues_user_details1` (`resolver_id` ASC) ,
  CONSTRAINT `fk_user_details_has_issues_user_details1`
    FOREIGN KEY (`resolver_id` )
    REFERENCES `issue_tracker`.`user_details` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_details_has_issues_issues1`
    FOREIGN KEY (`issue_id` )
    REFERENCES `issue_tracker`.`issues` (`issue_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


ALTER TABLE `issue_tracker`.`department` 
  ADD CONSTRAINT `fk_dept_head`
  FOREIGN KEY (`dept_head` )
  REFERENCES `issue_tracker`.`user_details` (`user_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_dept_head` (`dept_head` ASC) ;



ALTER TABLE `issue_tracker`.`user_details` 
  ADD CONSTRAINT `fk_department`
  FOREIGN KEY (`dept_id` )
  REFERENCES `issue_tracker`.`department` (`dept_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_department` (`dept_id` ASC) ;
