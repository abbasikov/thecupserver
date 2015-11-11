SET FOREIGN_KEY_CHECKS=0;

drop database objectdb;
create database objectdb;
use  objectdb;

CREATE 
    TABLE `dbobject` 
    ( 
        `counter` INT not null AUTO_INCREMENT UNIQUE,
        `client_id` smallint NOT NULL default 0, 
        `type` varchar(5) NOT NULL, 
        `uuid` varchar(32) NOT NULL,
        `version` smallint default 0, 
        `name` varchar(255) default NULL, 
        `created_by` varchar(32) NOT NULL, 
        `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, 
        `modified_by` varchar(32), 
        `modified_on` timestamp null, 
        `status` smallint default 0, 
        `status_modified_on` timestamp null,
        PRIMARY KEY (`uuid`), 
        KEY `idx_dbobject_client_id` (`client_id`), 
        KEY `idx_dbobject_type` (`type`), 
        KEY `idx_dbobject_status` (`status`)
    ) 
    ENGINE= InnoDB DEFAULT CHARSET=utf8;
    
CREATE 
    TABLE `dbobject_metadata` 
    (
        `client_id` smallint NOT NULL default 0,
        `type` varchar(5),
        `uuid` varchar(32) NOT NULL, 
        `name` varchar(255) NOT NULL, 
        `value` mediumtext, 
        `created_by` varchar(32) NOT NULL, 
        `created_on` timestamp NOT NULL default CURRENT_TIMESTAMP, 
        `status` smallint default 0, 
        `status_modified_on` timestamp null,
        PRIMARY KEY (`uuid`,`name`),
        KEY `idx_dbobject_object_metadata_type` (`type`),
        KEY `idx_dbobject_object_metadata_client_id` (`client_id`)
    ) 
    ENGINE= InnoDB DEFAULT CHARSET=utf8;     
    
CREATE 
    TABLE `dbobject_relationship` 
    ( 
        `client_id` smallint NOT NULL default 0,
        `p_uuid` varchar(32) NOT NULL, 
        `c_uuid` varchar(32) NOT NULL, 
        `relationship_type` varchar(32) NOT NULL default '', 
        `sortorder` smallint default '0', 
		`created_by` varchar(32) NOT NULL,         
        `created_on` timestamp NOT NULL default CURRENT_TIMESTAMP, 
        `status` smallint default 0, 
        `status_modified_on` timestamp null,
        PRIMARY KEY (`p_uuid`,`c_uuid`,`relationship_type`), 
        KEY `idx_dbobject_relationship_client_id` (`client_id`),
        KEY `fk_dbobject_relationship_parent` (`p_uuid`), 
        KEY `fk_dbobject_relationship_child` (`c_uuid`), 
        KEY `idx_dbobject_relationship_type` (`relationship_type`) 
    ) 
    ENGINE= InnoDB DEFAULT CHARSET=utf8;         

CREATE 
    TABLE `dbobject_acl` 
    ( 
        `client_id` smallint NOT NULL default 0,
        `principal_uuid` varchar(32) NOT NULL, 
        `uuid` varchar(32) NOT NULL, 
        `permission` varchar(32) NOT NULL, 
        `created_by` varchar(32) NOT NULL, 
        `created_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
        `status` smallint default 0, 
        `status_modified_on` timestamp null,
        PRIMARY KEY (`principal_uuid`,`uuid`), 
        KEY `idx_dbobject_acl_client_id` (`client_id`),
        KEY `idx_dbobject_acl_pricipal_object_permission` (`principal_uuid`, `uuid`,`permission`)
    ) 
    ENGINE= InnoDB DEFAULT CHARSET=utf8; 

CREATE 
    TABLE `dbobject_content_store` 
    ( 
        `client_id` smallint NOT NULL default 0,
        `uuid` varchar(32) NOT NULL, 
        `content_type` varchar(32) NOT NULL, 
        `uri` varchar(255) default NULL, 
        `data` longblob, 
        `created_by` varchar(32) NOT NULL, 
        `created_on` timestamp NOT NULL default CURRENT_TIMESTAMP, 
        `extension` varchar(32) default NULL, 
        `content_size` int default NULL, 
        `content_size_enc` int default NULL, 
        `checksum` varchar(32) default null, 
        `status` smallint default 0, 
        `status_modified_on` timestamp null,
        PRIMARY KEY (`uuid`,`content_type`), 
        KEY `idx_dbobject_content_store_client_id` (`client_id`)
    ) 
    ENGINE= InnoDB DEFAULT CHARSET=utf8; 


CREATE 
    TABLE `dbobject_relationship_metadata` 
    (
        `client_id` smallint NOT NULL default 0,
        `p_uuid` varchar(32) NOT NULL, 
        `c_uuid` varchar(32) NOT NULL, 
        `name` varchar(255) NOT NULL, 
        `value` mediumtext, 
        `created_by` varchar(32) NOT NULL default '', 
        `created_on_` timestamp NOT NULL default CURRENT_TIMESTAMP, 
        `relationship_type` varchar(32) NOT NULL default '0', 
        `status` smallint default 0, 
        `status_modified_on` timestamp null,
        PRIMARY KEY (`p_uuid`,`c_uuid`,`relationship_type`,`name`), 
        KEY `idx_dbobject_relationship_metadata_client_id` (`client_id`)
    ) 
    ENGINE= InnoDB DEFAULT CHARSET=utf8;
    
CREATE 
    TABLE `dbobject_metadata_json` 
    (
        `client_id` smallint NOT NULL default 0,
        `type` varchar(5),
        `uuid` varchar(32) NOT NULL, 
        `property_name` varchar(20) NOT NULL,
        `name` varchar(255) NOT NULL, 
        `value` mediumtext, 
        `created_by` varchar(32) NOT NULL, 
        `created_on` timestamp NOT NULL default CURRENT_TIMESTAMP, 
        `status` smallint default 0, 
        `status_modified_on` timestamp null,
        PRIMARY KEY (`uuid`,`name`),
        KEY `idx_dbobject_object_metadata_json_type` (`type`),
        KEY `idx_dbobject_object_metadata_json_client_id` (`client_id`)
    ) 
    ENGINE= InnoDB DEFAULT CHARSET=utf8; 
    
SET FOREIGN_KEY_CHECKS=1;

INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`) VALUES ('100', '0', 'USER1', 'USER1-SUPADMIN-FTC1', '0', 'ftcadmin', 'Macys', '2015-09-24 22:02:56', 'null', '2015-09-24 22:02:56', '0');    
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) VALUES ('0', 'USER1', 'USER1-SUPADMIN-FTC1', 'isSuperAdmin', 'true', 'MACYS', '2015-09-24 22:02:57', '0', '2015-09-24 22:02:57');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) VALUES ('0', 'USER1', 'USER1-SUPADMIN-FTC1', 'password','fZG1Cw1FMeVZQCOcbNaAlRtLDaRA6A5ZVpXkkwIWcF5CkNRaahuKOGEcg2f8SeIP', 'MACYS', '2015-09-24 22:02:57', '0', '2015-09-24 22:02:57');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) VALUES ('0', 'USER1', 'USER1-SUPADMIN-FTC1', 'userName','ftcadmin', 'MACYS', '2015-09-24 22:02:57', '0', '2015-09-24 22:02:57');

INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`) VALUES ('101', '0', 'RELSE', 'RELSE-57B91307-18E6', '0', '15I', 'Super Admin', '2015-10-01 14:00:17');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-18E6', 'bcomDate', '9/10', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-18E6', 'branchCutDate', '8/26', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-18E6', 'branchFreezeDate', '9/10', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-18E6', 'branchHardLockDate', '9/7', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-18E6', 'branchProductionDate', '9/10', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-18E6', 'mcomDate', '9/10', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-18E6', 'isActivated', 'false', '', '2015-10-01 14:00:17', '0');

INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`) VALUES ('102', '0', 'RELSE', 'RELSE-57B91307-28E6', '0', '15J', 'Super Admin', '2015-10-01 14:00:17');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-28E6', 'bcomDate', '9/10', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-28E6', 'branchCutDate', '8/26', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-28E6', 'branchFreezeDate', '9/10', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-28E6', 'branchHardLockDate', '9/7', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-28E6', 'branchProductionDate', '9/10', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-28E6', 'mcomDate', '9/10', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-28E6', 'isActivated', 'false', '', '2015-10-01 14:00:17', '0');

INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`) VALUES ('103', '0', 'RELSE', 'RELSE-57B91307-38E6', '0', '16A', 'Super Admin', '2015-10-01 14:00:17');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-38E6', 'bcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-38E6', 'branchCutDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-38E6', 'branchFreezeDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-38E6', 'branchHardLockDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-38E6', 'branchProductionDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-38E6', 'mcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-38E6', 'isActivated', 'true', '', '2015-10-01 14:00:17', '0');

INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`) VALUES ('104', '0', 'RELSE', 'RELSE-57B91307-48E6', '0', '16B', 'Super Admin', '2015-10-01 14:00:17');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-48E6', 'bcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-48E6', 'branchCutDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-48E6', 'branchFreezeDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-48E6', 'branchHardLockDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-48E6', 'branchProductionDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-48E6', 'mcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-48E6', 'isActivated', 'true', '', '2015-10-01 14:00:17', '0');


INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`) VALUES ('105', '0', 'RELSE', 'RELSE-57B91307-58E6', '0', '16C', 'Super Admin', '2015-10-01 14:00:17');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-58E6', 'bcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-58E6', 'branchCutDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-58E6', 'branchFreezeDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-58E6', 'branchHardLockDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-58E6', 'branchProductionDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-58E6', 'mcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-58E6', 'isActivated', 'true', '', '2015-10-01 14:00:17', '0');


INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`) VALUES ('106', '0', 'RELSE', 'RELSE-57B91307-68E6', '0', '16D', 'Super Admin', '2015-10-01 14:00:17');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-68E6', 'bcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-68E6', 'branchCutDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-68E6', 'branchFreezeDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-68E6', 'branchHardLockDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-68E6', 'branchProductionDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-68E6', 'mcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-68E6', 'isActivated', 'true', '', '2015-10-01 14:00:17', '0');


INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`) VALUES ('107', '0', 'RELSE', 'RELSE-57B91307-78E6', '0', '16E', 'Super Admin', '2015-10-01 14:00:17');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-78E6', 'bcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-78E6', 'branchCutDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-78E6', 'branchFreezeDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-78E6', 'branchHardLockDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-78E6', 'branchProductionDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-78E6', 'mcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-78E6', 'isActivated', 'true', '', '2015-10-01 14:00:17', '0');


INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`) VALUES ('108', '0', 'RELSE', 'RELSE-57B91307-88E6', '0', '16F', 'Super Admin', '2015-10-01 14:00:17');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-88E6', 'bcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-88E6', 'branchCutDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-88E6', 'branchFreezeDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-88E6', 'branchHardLockDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-88E6', 'branchProductionDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-88E6', 'mcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-88E6', 'isActivated', 'true', '', '2015-10-01 14:00:17', '0');

INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`) VALUES ('109', '0', 'RELSE', 'RELSE-57B91307-98E6', '0', '16G', 'Super Admin', '2015-10-01 14:00:17');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-98E6', 'bcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-98E6', 'branchCutDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-98E6', 'branchFreezeDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-98E6', 'branchHardLockDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-98E6', 'branchProductionDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-98E6', 'mcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-98E6', 'isActivated', 'true', '', '2015-10-01 14:00:17', '0');

INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`) VALUES ('110', '0', 'RELSE', 'RELSE-57B91307-10E6', '0', '16H', 'Super Admin', '2015-10-01 14:00:17');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-10E6', 'bcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-10E6', 'branchCutDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-10E6', 'branchFreezeDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-10E6', 'branchHardLockDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-10E6', 'branchProductionDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-10E6', 'mcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-10E6', 'isActivated', 'true', '', '2015-10-01 14:00:17', '0');

INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`) VALUES ('111', '0', 'RELSE', 'RELSE-57B91307-11E6', '0', '16I', 'Super Admin', '2015-10-01 14:00:17');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-11E6', 'bcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-11E6', 'branchCutDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-11E6', 'branchFreezeDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-11E6', 'branchHardLockDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-11E6', 'branchProductionDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-11E6', 'mcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-11E6', 'isActivated', 'true', '', '2015-10-01 14:00:17', '0');

INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`) VALUES ('112', '0', 'RELSE', 'RELSE-57B91307-12E6', '0', '16J', 'Super Admin', '2015-10-01 14:00:17');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-12E6', 'bcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-12E6', 'branchCutDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-12E6', 'branchFreezeDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-12E6', 'branchHardLockDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-12E6', 'branchProductionDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-12E6', 'mcomDate', 'TBD', '', '2015-10-01 14:00:17', '0');
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`) VALUES ('0', 'RELSE', 'RELSE-57B91307-12E6', 'isActivated', 'true', '', '2015-10-01 14:00:17', '0');

INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('171', '0', 'COMPO', 'COMPO-0F8240C1-1B4A', '0', 'Android Mobile App', 'Super Admin', '2015-11-04 14:34:33', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-1B4A', 'description', '', '', '2015-11-04 14:34:33', '0', NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-1B4A', 'isChecked', 'false', '', '2015-11-04 14:34:33', '0', NULL);

INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('172', '0', 'COMPO', 'COMPO-0F8240C1-2B4B', '0', 'FCC', 'Super Admin', '2015-11-04 14:34:33', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-2B4B', 'description', '', '', '2015-11-04 14:34:33', '0', NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-2B4B', 'isChecked', 'false', '', '2015-11-04 14:34:33', '0', NULL);

INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('173', '0', 'COMPO', 'COMPO-0F8240C1-3B4A', '0', 'iOS Mobile App', 'Super Admin', '2015-11-04 14:34:33', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-3B4A', 'description', '', '', '2015-11-04 14:34:33', '0', NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-3B4A', 'isChecked', 'false', '', '2015-11-04 14:34:33', '0', NULL);

INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('174', '0', 'COMPO', 'COMPO-0F8240C1-4B4A', '0', 'Legacy', 'Super Admin', '2015-11-04 14:34:33', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-4B4A', 'description', '', '', '2015-11-04 14:34:33', '0', NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-4B4A', 'isChecked', 'false', '', '2015-11-04 14:34:33', '0', NULL);


INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('175', '0', 'COMPO', 'COMPO-0F8240C1-5B4A', '0', 'Mashery', 'Super Admin', '2015-11-04 14:34:33', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-5B4A', 'description', '', '', '2015-11-04 14:34:33', '0', NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-5B4A', 'isChecked', 'false', '', '2015-11-04 14:34:33', '0', NULL);


INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('176', '0', 'COMPO', 'COMPO-0F8240C1-6B4A', '0', 'Mew', 'Super Admin', '2015-11-04 14:34:33', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-6B4A', 'description', '', '', '2015-11-04 14:34:33', '0', NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-6B4A', 'isChecked', 'false', '', '2015-11-04 14:34:33', '0', NULL);


INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('177', '0', 'COMPO', 'COMPO-0F8240C1-7B4A', '0', 'MSP Customer', 'Super Admin', '2015-11-04 14:34:33', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-7B4A', 'description', '', '', '2015-11-04 14:34:33', '0', NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-7B4A', 'isChecked', 'false', '', '2015-11-04 14:34:33', '0', NULL);


INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('178', '0', 'COMPO', 'COMPO-0F8240C1-8B4A', '0', 'MSP Content', 'Super Admin', '2015-11-04 14:34:33', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-8B4A', 'description', '', '', '2015-11-04 14:34:33', '0', NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-8B4A', 'isChecked', 'false', '', '2015-11-04 14:34:33', '0', NULL);


INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('179', '0', 'COMPO', 'COMPO-0F8240C1-9B4A', '0', 'MSP Order', 'Super Admin', '2015-11-04 14:34:33', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-9B4A', 'description', '', '', '2015-11-04 14:34:33', '0', NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-9B4A', 'isChecked', 'false', '', '2015-11-04 14:34:33', '0', NULL);


INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('180', '0', 'COMPO', 'COMPO-0F8240C1-104B', '0', 'MSP Customer Batch', 'Super Admin', '2015-11-04 14:34:33', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-104B', 'description', '', '', '2015-11-04 14:34:33', '0', NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-104B', 'isChecked', 'false', '', '2015-11-04 14:34:33', '0', NULL);


INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('181', '0', 'COMPO', 'COMPO-0F8240C1-114A', '0', 'MSP Discovery', 'Super Admin', '2015-11-04 14:34:33', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-114A', 'description', '', '', '2015-11-04 14:34:33', '0', NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-114A', 'isChecked', 'false', '', '2015-11-04 14:34:33', '0', NULL);


INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('182', '0', 'COMPO', 'COMPO-0F8240C1-124A', '0', 'MSP Order Batch', 'Super Admin', '2015-11-04 14:34:33', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-124A', 'description', '', '', '2015-11-04 14:34:33', '0', NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-124A', 'isChecked', 'false', '', '2015-11-04 14:34:33', '0', NULL);


INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('183', '0', 'COMPO', 'COMPO-0F8240C1-134A', '0', 'NavApp', 'Super Admin', '2015-11-04 14:34:33', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-134A', 'description', '', '', '2015-11-04 14:34:33', '0', NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-134A', 'isChecked', 'false', '', '2015-11-04 14:34:33', '0', NULL);


INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('184', '0', 'COMPO', 'COMPO-0F8240C1-144A', '0', 'OES', 'Super Admin', '2015-11-04 14:34:33', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-144A', 'description', '', '', '2015-11-04 14:34:33', '0', NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-144A', 'isChecked', 'false', '', '2015-11-04 14:34:33', '0', NULL);


INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('185', '0', 'COMPO', 'COMPO-0F8240C1-154A', '0', 'ShopApp', 'Super Admin', '2015-11-04 14:34:33', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-154A', 'description', '', '', '2015-11-04 14:34:33', '0', NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-154A', 'isChecked', 'false', '', '2015-11-04 14:34:33', '0', NULL);


INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('186', '0', 'COMPO', 'COMPO-0F8240C1-164A', '0', 'UI', 'Super Admin', '2015-11-04 14:34:33', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-164A', 'description', '', '', '2015-11-04 14:34:33', '0', NULL);
INSERT INTO `objectdb`.`dbobject_metadata` (`client_id`, `type`, `uuid`, `name`, `value`, `created_by`, `created_on`, `status`, `status_modified_on`) 									VALUES ('0', 'COMPO', 'COMPO-0F8240C1-164A', 'isChecked', 'false', '', '2015-11-04 14:34:33', '0', NULL);

INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('1', '0', 'SYSCO', 'SYSCO-124C5746-1C69', '0', 'Android Eng-1', 'TheCup', '2015-11-04 14:42:57', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('2', '0', 'SYSCO', 'SYSCO-124C5746-2C69', '0', 'Android Eng-2', 'TheCup', '2015-11-04 14:42:57', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('3', '0', 'SYSCO', 'SYSCO-124C5746-3C69', '0', 'Android Eng-3', 'TheCup', '2015-11-04 14:42:57', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('4', '0', 'SYSCO', 'SYSCO-124C5746-4C69', '0', 'Copy Writer', 'TheCup', '2015-11-04 14:42:57', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('5', '0', 'SYSCO', 'SYSCO-124C5746-5C69', '0', 'Creative', 'TheCup', '2015-11-04 14:42:57', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('6', '0', 'SYSCO', 'SYSCO-124C5746-6C69', '0', 'iOS Eng-1', 'TheCup', '2015-11-04 14:42:57', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('7', '0', 'SYSCO', 'SYSCO-124C5746-7C69', '0', 'iOS Eng-2', 'TheCup', '2015-11-04 14:42:57', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('8', '0', 'SYSCO', 'SYSCO-124C5746-8C69', '0', 'iOS Eng-3', 'TheCup', '2015-11-04 14:42:57', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('9', '0', 'SYSCO', 'SYSCO-124C5746-9C69', '0', 'Java-1', 'TheCup', '2015-11-04 14:42:57', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('10', '0', 'SYSCO', 'SYSCO-124C5746-1069', '0', 'Java-2', 'TheCup', '2015-11-04 14:42:57', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('11', '0', 'SYSCO', 'SYSCO-124C5746-1169', '0', 'Java-3', 'TheCup', '2015-11-04 14:42:57', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('12', '0', 'SYSCO', 'SYSCO-124C5746-1269', '0', 'QE-1', 'TheCup', '2015-11-04 14:42:57', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('13', '0', 'SYSCO', 'SYSCO-124C5746-1369', '0', 'QE-2', 'TheCup', '2015-11-04 14:42:57', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('14', '0', 'SYSCO', 'SYSCO-124C5746-1469', '0', 'QE-3', 'TheCup', '2015-11-04 14:42:57', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('15', '0', 'SYSCO', 'SYSCO-124C5746-1569', '0', 'UI-1', 'TheCup', '2015-11-04 14:42:57', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('16', '0', 'SYSCO', 'SYSCO-124C5746-1669', '0', 'UI-2', 'TheCup', '2015-11-04 14:42:57', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('17', '0', 'SYSCO', 'SYSCO-124C5746-1769', '0', 'UI-3', 'TheCup', '2015-11-04 14:42:57', NULL, NULL, NULL, NULL);
INSERT INTO `objectdb`.`dbobject` (`counter`, `client_id`, `type`, `uuid`, `version`, `name`, `created_by`, `created_on`, `modified_by`, `modified_on`, `status`, `status_modified_on`) VALUES ('18', '0', 'SYSCO', 'SYSCO-124C5746-1869', '0', 'UX', 'TheCup', '2015-11-04 14:42:57', NULL, NULL, NULL, NULL);






   

    