CREATE database Vehicle_sales_management_system;
USE Vehicle_sales_management_system;

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `customer_id` mediumint,
  `c_name` varchar(255) default NULL,
  `c_email` varchar(255) default NULL,
  `c_address` varchar(255) default NULL,
  `c_mobile` varchar(100) default NULL,
  `c_age` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `manufacturer`;

CREATE TABLE `manufacturer` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `manf_id` mediumint,
  `manf_name` varchar(255) default NULL,
  `manf_email` varchar(255) default NULL,
  `manf_mobile` varchar(100) default NULL,
  `manf_address` varchar(255) default NULL,
  `contract_start_date` varchar(255),
  `contract_end_date` varchar(255),
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `branch`;

CREATE TABLE `branch` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `branch_id` mediumint,
  `b_name` varchar(255) default NULL,
  `b_email` varchar(255) default NULL,
  `b_phone` varchar(100) default NULL,
  `b_location` varchar(255),
  `number_of_employees` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `salesperson`;

CREATE TABLE `salesperson` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `sp_id` mediumint,
  `sp_name` varchar(255) default NULL,
  `sp_phone` varchar(100) default NULL,
  `sp_email` varchar(255) default NULL,
  `total_sales` mediumint default NULL,
  `commission_rate` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `vehicle`;

CREATE TABLE `vehicle` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `vehicle_id` mediumint,
  `v_status` varchar(255) default NULL,
  `v_make` mediumint default NULL,
  `v_model` varchar(255) default NULL,
  `v_mileage` mediumint default NULL,
  `v_price` mediumint default NULL,
  `fuel_type` varchar(255) default NULL,
  `transmission` varchar(255) default NULL,
  `manf_id` mediumint default NULL,
  `branch_id` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `cars`;

CREATE TABLE `cars` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `vehicle_id` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `bikes`;

CREATE TABLE `bikes` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `vehicle_id` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `trucks`;

CREATE TABLE `trucks` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `vehicle_id` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `sv_id` mediumint,
  `sv_status` varchar(255) default NULL,
  `sv_cost` mediumint default NULL,
  `sv_type` varchar(255) default NULL,
  `sv_date` varchar(255),
  `vehicle_id` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `reservation`;

CREATE TABLE `reservation` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `reservation_id` mediumint,
  `reservation_date` varchar(255),
  `reservation_status` varchar(255) default NULL,
  `customer_id` mediumint default NULL,
  `vehicle_id` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `salesorder`;

CREATE TABLE `salesorder` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `sales_id` mediumint,
  `s_price` mediumint default NULL,
  `s_date` varchar(255),
  `sp_id` mediumint default NULL,
  `customer_id` mediumint default NULL,
  `vehicle_id` mediumint default NULL,
  `branch_id` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `insurance`;

CREATE TABLE `insurance` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `insurance_id` mediumint,
  `ins_type` varchar(255) default NULL,
  `ins_period` mediumint default NULL,
  `ins_premium` mediumint default NULL,
  `ins_coverage` mediumint default NULL,
  `ins_provider` varchar(255) default NULL,
  `policy_number` varchar(255),
  `vehicle_id` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `payment_id` mediumint,
  `p_amount` mediumint default NULL,
  `p_date` varchar(255),
  `p_method` varchar(255) default NULL,
  `sales_id` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `cash`;

CREATE TABLE `cash` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `cash_id` varchar(255),
  `cash_amount` mediumint default NULL,
  `payment_id` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `loan`;

CREATE TABLE `loan` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `loan_id` varchar(255),
  `ln_amount` mediumint default NULL,
  `ln_period` mediumint default NULL,
  `remaining_balance` mediumint default NULL,
  `ln_emi` mediumint default NULL,
  `interest_rate` mediumint default NULL,
  `payment_id` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

show tables;


