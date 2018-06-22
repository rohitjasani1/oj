<?php 

class ModelModuleSmshare extends Model {
	
	function install() {
		
	    $query = $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "smsbean (
	        `id`          INT NOT NULL AUTO_INCREMENT ,
	        `to`          TEXT NULL                   ,
	        `body`        TEXT NULL                   ,
	        `username`    VARCHAR(64) NULL            ,
	        `reference`   TEXT NULL                   ,
	        `comment`     TEXT NULL                   ,
	        `price`       DECIMAL(15,6) NULL          ,
	        `create_date` DATETIME NULL               ,
	        `update_date` DATETIME NULL               ,
	    		
	         PRIMARY KEY (`id`) )"
	    );
	}
	
}

?>