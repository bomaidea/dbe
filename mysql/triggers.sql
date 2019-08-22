DELIMITER //

CREATE TRIGGER dbe.insert_audit_action_audit
AFTER INSERT 
	ON dbe.audit_action FOR EACH ROW
BEGIN
	DECLARE v_action INT;

	SELECT id 
		FROM dbe.audit_action 
		WHERE audit_action.name='created' 
		INTO v_action;

	INSERT INTO dbe.users_audit (
		action, 
		audit_id, 
		created_by, 
		created_date, 
		updated_by, 
		updated_date, 
		deleted_by, 
		deleted_date, 
		name
	) VALUES (
		v_action,
		NEW.id, 
		NEW.created_by, 
		NEW.created_date, 
		NEW.updated_by, 
		NEW.updated_date, 
		NEW.deleted_by, 
		NEW.deleted_date, 
		NEW.audit_name
	);
END; // 

DELIMITER //

CREATE TRIGGER dbe.update_audit_action_audit
AFTER UPDATE 
	ON dbe.audit_action FOR EACH ROW
BEGIN
	DECLARE v_action INT;

	SELECT id 
		FROM dbe.audit_action 
		WHERE audit_action.name='updated' 
		INTO v_action;

	INSERT INTO dbe.users_audit (
		action, 
		audit_id, 
		created_by, 
		created_date, 
		updated_by, 
		updated_date, 
		deleted_by, 
		deleted_date, 
		name
	) VALUES (
		v_action,
		NEW.id, 
		NEW.created_by, 
		NEW.created_date, 
		NEW.updated_by, 
		NEW.updated_date, 
		NEW.deleted_by, 
		NEW.deleted_date, 
		NEW.audit_name
	);
END; // 

DELIMITER //

CREATE TRIGGER dbe.delete_audit_action_audit
AFTER DELETE 
	ON dbe.audit_action FOR EACH ROW
BEGIN
	DECLARE v_action INT;

	SELECT id 
		FROM dbe.audit_action 
		WHERE audit_action.name='deleted' 
		INTO v_action;

	INSERT INTO dbe.users_audit (
		action, 
		audit_id, 
		created_by, 
		created_date, 
		updated_by, 
		updated_date, 
		deleted_by, 
		deleted_date, 
		name
	) VALUES (
		v_action,
		NEW.id, 
		NEW.created_by, 
		NEW.created_date, 
		NEW.updated_by, 
		NEW.updated_date, 
		NEW.deleted_by, 
		NEW.deleted_date, 
		NEW.audit_name
	);
END; // 

DELIMITER //

CREATE TRIGGER dbe.insert_users_audit
AFTER INSERT 
	ON dbe.users FOR EACH ROW
BEGIN
	DECLARE v_action INT;

	SELECT id 
		FROM dbe.audit_action 
		WHERE audit_action.name='created' 
		INTO v_action;

	INSERT INTO dbe.users_audit (
		action, 
		audit_id, 
		created_by, 
		created_date, 
		updated_by, 
		updated_date, 
		deleted_by, 
		deleted_date, 
		audit_username, 
		audit_password, 
		audit_salt, 
		audit_firstname, 
		audit_lastname, 
		audit_email
	) VALUES (
		v_action,
		NEW.id, 
		NEW.created_by, 
		NEW.created_date, 
		NEW.updated_by, 
		NEW.updated_date, 
		NEW.deleted_by, 
		NEW.deleted_date, 
		NEW.username, 
		NEW.password, 
		NEW.salt, 
		NEW.firstname, 
		NEW.lastname, 
		NEW.email
	);
END; // 

DELIMITER //

CREATE TRIGGER dbe.update_users_audit
AFTER UPDATE
	ON dbe.users FOR EACH ROW
BEGIN
	DECLARE v_action INT;

	SELECT id 
		FROM dbe.audit_action 
		WHERE audit_action.name='updated' 
		INTO v_action;

	INSERT INTO dbe.users_audit (
		action, 
		audit_id, 
		created_by, 
		created_date, 
		updated_by, 
		updated_date, 
		deleted_by, 
		deleted_date, 
		audit_username, 
		audit_password, 
		audit_salt, 
		audit_firstname, 
		audit_lastname, 
		audit_email
	) VALUES (
		v_action,
		NEW.id, 
		NEW.created_by, 
		NEW.created_date, 
		NEW.updated_by, 
		NEW.updated_date, 
		NEW.deleted_by, 
		NEW.deleted_date, 
		NEW.username, 
		NEW.password, 
		NEW.salt, 
		NEW.firstname, 
		NEW.lastname, 
		NEW.email
	);
END; // 

DELIMITER //

CREATE TRIGGER dbe.delete_users_audit
AFTER DELETE
	ON dbe.users FOR EACH ROW
BEGIN
	DECLARE v_action INT;

	SELECT id 
		FROM dbe.audit_action 
		WHERE audit_action.name='delete' 
		INTO v_action;

	INSERT INTO dbe.users_audit (
		action, 
		audit_id, 
		created_by, 
		created_date, 
		updated_by, 
		updated_date, 
		deleted_by, 
		deleted_date, 
		audit_username, 
		audit_password, 
		audit_salt, 
		audit_firstname, 
		audit_lastname, 
		audit_email
	) VALUES (
		v_action,
		OLD.id, 
		OLD.created_by, 
		OLD.created_date, 
		OLD.updated_by, 
		OLD.updated_date, 
		OLD.deleted_by, 
		OLD.deleted_date, 
		OLD.username, 
		OLD.password, 
		OLD.salt, 
		OLD.firstname, 
		OLD.lastname, 
		OLD.email
	);
END; // 


DELIMITER //

CREATE TRIGGER dbe.insert_record_audit
AFTER INSERT 
	ON dbe.record FOR EACH ROW
BEGIN
	DECLARE v_action INT;

	SELECT id 
		FROM dbe.audit_action 
		WHERE audit_action.name='created' 
		INTO v_action;

	INSERT INTO dbe.users_audit (
		action, 
		audit_id, 
		created_by, 
		created_date, 
		updated_by, 
		updated_date, 
		deleted_by, 
		deleted_date,
		audit_firstname, 
		audit_lastname, 
		audit_born_date,
		audit_address,
		audit_email,
		audit_phone
	) VALUES (
		v_action,
		NEW.id, 
		NEW.created_by, 
		NEW.created_date, 
		NEW.updated_by, 
		NEW.updated_date, 
		NEW.deleted_by, 
		NEW.deleted_date, 
		NEW.firstname, 
		NEW.lastname, 
		NEW.born_date,
		NEW.address,
		NEW.email,
		NEW.phone
	);
END; // 

DELIMITER //

CREATE TRIGGER dbe.update_record_audit
AFTER UPDATE 
	ON dbe.record FOR EACH ROW
BEGIN
	DECLARE v_action INT;

	SELECT id 
		FROM dbe.audit_action 
		WHERE audit_action.name='updated' 
		INTO v_action;

	INSERT INTO dbe.users_audit (
		action, 
		audit_id, 
		created_by, 
		created_date, 
		updated_by, 
		updated_date, 
		deleted_by, 
		deleted_date,
		audit_firstname, 
		audit_lastname, 
		audit_born_date,
		audit_address,
		audit_email,
		audit_phone
	) VALUES (
		v_action,
		NEW.id, 
		NEW.created_by, 
		NEW.created_date, 
		NEW.updated_by, 
		NEW.updated_date, 
		NEW.deleted_by, 
		NEW.deleted_date, 
		NEW.firstname, 
		NEW.lastname, 
		NEW.born_date,
		NEW.address,
		NEW.email,
		NEW.phone
	);
END; // 

DELIMITER //

CREATE TRIGGER dbe.delete_record_audit
AFTER DELETE 
	ON dbe.record FOR EACH ROW
BEGIN
	DECLARE v_action INT;

	SELECT id 
		FROM dbe.audit_action 
		WHERE audit_action.name='deleted' 
		INTO v_action;

	INSERT INTO dbe.users_audit (
		action, 
		audit_id, 
		created_by, 
		created_date, 
		updated_by, 
		updated_date, 
		deleted_by, 
		deleted_date,
		audit_firstname, 
		audit_lastname, 
		audit_born_date,
		audit_address,
		audit_email,
		audit_phone
	) VALUES (
		v_action,
		OLD.id, 
		OLD.created_by, 
		OLD.created_date, 
		OLD.updated_by, 
		OLD.updated_date, 
		OLD.deleted_by, 
		OLD.deleted_date, 
		OLD.firstname, 
		OLD.lastname, 
		OLD.born_date,
		OLD.address,
		OLD.email,
		OLD.phone
	);
END; // 
