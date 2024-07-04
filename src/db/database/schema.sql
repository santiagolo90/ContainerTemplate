CREATE TABLE IF NOT EXISTS `audits` (
     `id` INT NOT NULL AUTO_INCREMENT,
     `route` VARCHAR(255),
     `ip` VARCHAR(255),
     `method` VARCHAR(255),
     `origin` VARCHAR(255),
     PRIMARY KEY (`id`)
);