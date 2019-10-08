DELIMITER //

CREATE TRIGGER `dbee`.`insert_record_audit`
AFTER INSERT 
	ON `dbee`.`record` FOR EACH ROW
BEGIN
	DECLARE `v_action` INT;

	SELECT `id` 
		FROM `dbee`.`audit_action` 
		WHERE `audit_action`.`name`='created' 
		INTO `v_action`;
  INSERT INTO `dbee`.`record_audit`(
      `action`,
      `audit_id`,
      `audit_created_by`,
      `audit_created_date`,
      `audit_updated_by`,
      `audit_updated_date`,
      `audit_deleted_by`,
      `audit_deleted_date`,
      `audit_firstname`,
      `audit_lastname`,
      `audit_born_date`,
      `audit_address`,
      `audit_email`,
      `audit_phone`
      ) VALUES (
      `v_action`,
		  NEW.`id`,
		  NEW.`created_by`,
      NEW.`created_date`,
      NEW.`updated_by`,
      NEW.`updated_date`,
      NEW.`deleted_by`,
      NEW.`deleted_date`,
      NEW.`firstname`,
      NEW.`lastname`,
      NEW.`born_date`,
      NEW.`address`,
      NEW.`email`,
      NEW.`phone`
      );
END; //

DELIMITER //

CREATE TRIGGER `dbee`.`update_record_audit`
AFTER UPDATE
	ON `dbee`.`record` FOR EACH ROW
BEGIN
	DECLARE `v_action` INT;

	SELECT `id`
		FROM `dbee`.`audit_action`
		WHERE `audit_action`.`name`='updated'
		INTO `v_action`;
  INSERT INTO `dbee`.`record_audit`(
      `action`,
      `audit_id`,
      `audit_created_by`,
      `audit_created_date`,
      `audit_updated_by`,
      `audit_updated_date`,
      `audit_deleted_by`,
      `audit_deleted_date`,
      `audit_firstname`,
      `audit_lastname`,
      `audit_born_date`,
      `audit_address`,
      `audit_email`,
      `audit_phone`
      ) VALUES (
      `v_action`,
		  NEW.`id`,
		  NEW.`created_by`,
      NEW.`created_date`,
      NEW.`updated_by`,
      NEW.`updated_date`,
      NEW.`deleted_by`,
      NEW.`deleted_date`,
      NEW.`firstname`,
      NEW.`lastname`,
      NEW.`born_date`,
      NEW.`address`,
      NEW.`email`,
      NEW.`phone`
      );
END; //

DELIMITER //

CREATE TRIGGER `dbee`.`delete_record_audit`
AFTER DELETE
	ON `dbee`.`record` FOR EACH ROW
BEGIN
	DECLARE `v_action` INT;

	SELECT `id`
		FROM `dbee`.`audit_action`
		WHERE `audit_action`.`name`='deleted'
		INTO `v_action`;
  INSERT INTO `dbee`.`record_audit`(
      `action`,
      `audit_id`,
      `audit_created_by`,
      `audit_created_date`,
      `audit_updated_by`,
      `audit_updated_date`,
      `audit_deleted_by`,
      `audit_deleted_date`,
      `audit_firstname`,
      `audit_lastname`,
      `audit_born_date`,
      `audit_address`,
      `audit_email`,
      `audit_phone`
      ) VALUES (
      `v_action`,
      OLD.`id`,
      OLD.`created_by`,
      OLD.`created_date`,
      OLD.`updated_by`,
      OLD.`updated_date`,
      OLD.`deleted_by`,
      OLD.`deleted_date`,
      OLD.`firstname`,
      OLD.`lastname`,
      OLD.`born_date`,
      OLD.`address`,
      OLD.`email`,
      OLD.`phone`
      );
END; //
