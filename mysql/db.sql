# Author: giuliobosco
# Version: 0.1.1 (2019-08-19 - 2019-09-15)


# -----------------------------------------------
#
# CREATE DATABASE
#
# -----------------------------------------------

CREATE DATABASE dbe;


# -----------------------------------------------
#
# CREATE TABLES
#
# -----------------------------------------------

CREATE TABLE dbe.audit_action
(
    id           INT AUTO_INCREMENT,

    name         VARCHAR(10) UNIQUE NOT NULL,

    PRIMARY KEY (id)
);

# -----------------------------------------------
# -----------------------------------------------

CREATE TABLE dbe.users
(
    id           INT AUTO_INCREMENT,

    created_by   INT                NOT NULL,
    created_date DATETIME           NOT NULL,
    updated_by   INT                NOT NULL,
    updated_date DATETIME           NOT NULL,
    deleted_by   INT,
    deleted_date DATETIME,

    username     VARCHAR(32) UNIQUE NOT NULL,
    password     CHAR(64)           NOT NULL,
    salt         CHAR(32)           NOT NULL,
    firstname    VARCHAR(64)        NOT NULL,
    lastname     VARCHAR(64)        NOT NULL,
    email 	 VARCHAR(128) UNIQUE NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES dbe.users (id) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (updated_by) REFERENCES dbe.users (id) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (deleted_by) REFERENCES dbe.users (id) ON DELETE NO ACTION ON UPDATE CASCADE
);

# -----------------------------------------------
# -----------------------------------------------

CREATE TABLE dbe.users_audit
(
    id              INT AUTO_INCREMENT,
    action          INT                NOT NULL,

    audit_id        INT                NOT NULL,
    audit_created_by      INT                NOT NULL,
    audit_created_date    DATETIME           NOT NULL,
    audit_updated_by      INT                NOT NULL,
    audit_updated_date    DATETIME           NOT NULL,
    audit_deleted_by      INT,
    audit_deleted_date    DATETIME,

    audit_username  VARCHAR(32)        NOT NULL,
    audit_password  CHAR(64)           NOT NULL,
    audit_salt      CHAR(32)           NOT NULL,
    audit_firstname VARCHAR(64)        NOT NULL,
    audit_lastname  VARCHAR(64)        NOT NULL,
    audit_email     VARCHAR(128)       NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (audit_id) REFERENCES dbe.users (id) ON DELETE NO ACTION ON UPDATE CASCADE
);

# -----------------------------------------------
# -----------------------------------------------

CREATE TABLE dbe.permission
(
    id           INT AUTO_INCREMENT,

    created_by   INT         NOT NULL,
    created_date DATETIME    NOT NULL,
    updated_by   INT         NOT NULL,
    updated_date DATETIME    NOT NULL,
    deleted_by   INT,
    deleted_date DATETIME,

    name         VARCHAR(10) UNIQUE NOT NULL,

    PRIMARY KEY (id)
);

# -----------------------------------------------
# -----------------------------------------------

CREATE TABLE dbe.permission_audit
(
    id           INT AUTO_INCREMENT,
    action       INT         NOT NULL,

    audit_id     INT         NOT NULL,
    audit_created_by   INT         NOT NULL,
    audit_created_date DATETIME    NOT NULL,
    audit_updated_by   INT         NOT NULL,
    audit_updated_date DATETIME    NOT NULL,
    audit_deleted_by   INT,
    audit_deleted_date DATETIME,

    audit_name   VARCHAR(10) NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (action) REFERENCES dbe.audit_action (id) ON DELETE NO ACTION ON UPDATE CASCADE
);

# -----------------------------------------------
# -----------------------------------------------

CREATE TABLE dbe.groups
(
    id           INT AUTO_INCREMENT,

    created_by   INT         NOT NULL,
    created_date DATETIME    NOT NULL,
    updated_by   INT         NOT NULL,
    updated_date DATETIME    NOT NULL,
    deleted_by   INT,
    deleted_date DATETIME,

    name         VARCHAR(10) UNIQUE NOT NULL,
	  parent_group INT,

    PRIMARY KEY (id),
	  FOREIGN KEY (parent_group) REFERENCES dbe.groups (id) ON DELETE NO ACTION ON UPDATE CASCADE
);

# -----------------------------------------------
# -----------------------------------------------

CREATE TABLE dbe.groups_audit
(
    id           INT AUTO_INCREMENT,
    action       INT         NOT NULL,

    audit_id     INT         NOT NULL,
    audit_created_by   INT         NOT NULL,
    audit_created_date DATETIME    NOT NULL,
    audit_updated_by   INT         NOT NULL,
    audit_updated_date DATETIME    NOT NULL,
    audit_deleted_by   INT,
    audit_deleted_date DATETIME,

    audit_name   VARCHAR(10) NOT NULL,
	  audit_parent_group INT,

    PRIMARY KEY (id),
    FOREIGN KEY (action) REFERENCES dbe.audit_action (id) ON DELETE NO ACTION ON UPDATE CASCADE
);

# -----------------------------------------------
# -----------------------------------------------

CREATE TABLE dbe.groups_permission
(
    id           INT AUTO_INCREMENT,

    created_by   INT         NOT NULL,
    created_date DATETIME    NOT NULL,
    updated_by   INT         NOT NULL,
    updated_date DATETIME    NOT NULL,
    deleted_by   INT,
    deleted_date DATETIME,

    permission   INT NOT NULL,
	  permission_group 	     INT NOT NULL,

    PRIMARY KEY (id),
	  FOREIGN KEY (permission) REFERENCES dbe.permission (id) ON DELETE CASCADE ON UPDATE CASCADE,
	  FOREIGN KEY (permission_group) REFERENCES dbe.groups (id) ON DELETE CASCADE ON UPDATE CASCADE
);

# -----------------------------------------------
# -----------------------------------------------

CREATE TABLE dbe.groups_permission_audit
(
    id           INT AUTO_INCREMENT,
    action       INT         NOT NULL,

    audit_id     INT         NOT NULL,
    audit_created_by   INT         NOT NULL,
    audit_created_date DATETIME    NOT NULL,
    audit_updated_by   INT         NOT NULL,
    audit_updated_date DATETIME    NOT NULL,
    audit_deleted_by   INT,
    audit_deleted_date DATETIME,

    audit_permission INT NOT NULL,
	  audit_groups 	 INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (action) REFERENCES dbe.audit_action (id) ON DELETE NO ACTION ON UPDATE CASCADE
);

# -----------------------------------------------
# -----------------------------------------------

CREATE TABLE dbe.users_groups
(
    id           INT AUTO_INCREMENT,

    created_by   INT         NOT NULL,
    created_date DATETIME    NOT NULL,
    updated_by   INT         NOT NULL,
    updated_date DATETIME    NOT NULL,
    deleted_by   INT,
    deleted_date DATETIME,

    users   INT NOT NULL,
	  user_group 	     INT NOT NULL,

    PRIMARY KEY (id),
	FOREIGN KEY (users) REFERENCES dbe.users (id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (user_group) REFERENCES dbe.groups (id) ON DELETE CASCADE ON UPDATE CASCADE
);

# -----------------------------------------------
# -----------------------------------------------

CREATE TABLE dbe.users_groups_audit
(
    id           INT AUTO_INCREMENT,
    action       INT         NOT NULL,

    audit_id     INT         NOT NULL,
    audit_created_by   INT         NOT NULL,
    audit_created_date DATETIME    NOT NULL,
    audit_updated_by   INT         NOT NULL,
    audit_updated_date DATETIME    NOT NULL,
    audit_deleted_by   INT,
    audit_deleted_date DATETIME,

    audit_users  INT NOT NULL,
	audit_groups INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (action) REFERENCES dbe.audit_action (id) ON DELETE NO ACTION ON UPDATE CASCADE
);


# -----------------------------------------------
# -----------------------------------------------

CREATE TABLE dbe.record (
    id INT AUTO_INCREMENT,
    
    created_by INT NOT NULL,
    created_date DATETIME NOT NULL,
    updated_by INT NOT NULL,
    updated_date DATETIME NOT NULL,
    deleted_by INT,
    deleted_date DATETIME,

    firstname VARCHAR (64) NOT NULL,
    lastname VARCHAR(64) NOT NULL,
    born_date DATE NOT NULL,
    address VARCHAR(128) NOT NULL,
    email VARCHAR (128) NOT NULL,
    phone VARCHAR (30) NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES dbe.users (id) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (updated_by) REFERENCES dbe.users (id) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (deleted_by) REFERENCES dbe.users (id) ON DELETE NO ACTION ON UPDATE CASCADE
);

# -----------------------------------------------
# -----------------------------------------------

CREATE TABLE dbe.record_audit (
    id INT AUTO_INCREMENT,
    action INT NOT NULL,

    audit_id INT NOT NULL,
    audit_created_by INT NOT NULL,
    audit_created_date DATETIME NOT NULL,
    audit_updated_by INT NOT NULL,
    audit_updated_date DATETIME NOT NULL,
    audit_deleted_by INT NOT NULL,
    audit_deleted_date INT NOT NULL,

    audit_firstname VARCHAR (64) NOT NULL,
    audit_lastname VARCHAR(64) NOT NULL,
    audit_born_date DATE NOT NULL,
    audit_address VARCHAR(128) NOT NULL,
    audit_email VARCHAR (128) NOT NULL,
    audit_phone VARCHAR (30) NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (action) REFERENCES dbe.audit_action (id) ON DELETE NO ACTION ON UPDATE CASCADE
);


# -----------------------------------------------
#
# INSERT SYSTEM DATA
#
# -----------------------------------------------

INSERT INTO dbe.audit_action (name) VALUES ('created'), ('updated'), ('deleted');

INSERT INTO dbe.users (created_by, created_date, updated_by, updated_date, username, password, salt, firstname, lastname, email) VALUES (1,NOW(),1,NOW(),'db_core','pw','salt','DB','CORE','core@db');
