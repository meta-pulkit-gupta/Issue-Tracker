CREATE DATABASE `issue_tracker` /*!40100 DEFAULT CHARACTER SET latin1 */;

CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  `dept_head` int(11) DEFAULT NULL,
  PRIMARY KEY (`dept_id`),
  KEY `fk_department_user_details` (`dept_head`),
  CONSTRAINT `fk_department_user_details` FOREIGN KEY (`dept_head`) REFERENCES `user_details` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `issue_attachment` (
  `attachment_id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) NOT NULL,
  `attachment_url` varchar(400) NOT NULL,
  PRIMARY KEY (`attachment_id`),
  KEY `fk_issue_attachment_issues1` (`issue_id`),
  CONSTRAINT `fk_issue_attachment_issues1` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `issue_resolvers` (
  `issue_id` int(11) NOT NULL,
  `resolver_id` int(11) NOT NULL,
  PRIMARY KEY (`issue_id`,`resolver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `issue_status` (
  `issue_id` int(11) NOT NULL,
  `status` enum('received','approved','assigned','resolved','closed','rejected','conflict') NOT NULL DEFAULT 'received',
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`issue_id`,`status`),
  KEY `fk_issue_status_issues1` (`issue_id`),
  CONSTRAINT `fk_issue_status_issues1` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `issue_tags` (
  `issue_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`issue_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `issues` (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dept_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `body` blob NOT NULL,
  `priority` enum('low','medium','high') DEFAULT 'low',
  `target_resolution_date` timestamp NULL DEFAULT NULL,
  `actual_resolution_date` timestamp NULL DEFAULT NULL,
  `current_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `fk_issues_user_details` (`created_by`),
  KEY `fk_issues_department1` (`dept_id`),
  CONSTRAINT `fk_issues_department1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_issues_user_details` FOREIGN KEY (`created_by`) REFERENCES `user_details` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL,
  `tag_title` varchar(45) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `google_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('general','dept-head','admin','resolver') DEFAULT 'general',
  `dept_id` int(11) DEFAULT '0',
  `profile_pic_url` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `google_id_UNIQUE` (`google_id`),
  KEY `fk_user_details_department` (`dept_id`),
  CONSTRAINT `fk_user_details_department` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_comments_issues1` (`issue_id`),
  CONSTRAINT `fk_comments_issues1` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;