INSERT INTO `issue_tracker`.`department` (`dept_id`, `dept_name`) VALUES (1, 'Finance');

INSERT INTO `issue_tracker`.`department` (`dept_id`, `dept_name`) VALUES (2, 'HR');

INSERT INTO `issue_tracker`.`user_details` (`user_id`, `google_id`, `name`, `email`, `role`, `dept_id`) VALUES (1, '101010', 'krishan', 'kk@gmail.com', 'resolver', 1);

INSERT INTO `issue_tracker`.`user_details` (`user_id`, `google_id`, `name`, `email`, `role`, `dept_id`) VALUES (2, '1515', 'pulkit', 'pk@gmail.com', 'dept-head', 1);

INSERT INTO `issue_tracker`.`issues` (`issue_id`, `created_by`, `created_on`, `dept_id`, `title`, `body`, `priority`) VALUES (11, 1, '2016-10-17 23:59:59', 1, 'first', ?, 'high');

INSERT INTO `issue_tracker`.`issues` (`issue_id`, `created_by`, `created_on`, `dept_id`, `title`, `body`, `priority`) VALUES (12, 1, '2016-10-17 22:59:59', 1, 'sec', ?, 'low');

UPDATE `issue_tracker`.`department` SET `dept_head`=2 WHERE `dept_id`='1';
