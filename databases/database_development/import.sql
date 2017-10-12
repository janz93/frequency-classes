USE frequency_classes;

CREATE TABLE `words` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `word_ci` varchar(255) DEFAULT NULL,
  `freq` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `word` (`word`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39304 DEFAULT CHARSET=utf8;

CREATE TABLE `sentences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sentence` text,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

CREATE TABLE `co_s` (
  `word1_id` int(10) unsigned NOT NULL DEFAULT '0',
  `word2_id` int(10) unsigned NOT NULL DEFAULT '0',
  `freq` int(8) unsigned DEFAULT NULL,
  `sig` float DEFAULT NULL,
  PRIMARY KEY (`word1_id`,`word2_id`),
  KEY `word1_sig` (`word1_id`,`sig`),
  KEY `word2_sig` (`word2_id`,`sig`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `co_n` (
  `word1_id` int(10) unsigned NOT NULL DEFAULT '0',
  `word2_id` int(10) unsigned NOT NULL DEFAULT '0',
  `freq` int(8) unsigned DEFAULT NULL,
  `sig` float DEFAULT NULL,
  PRIMARY KEY (`word1_id`,`word2_id`),
  KEY `word1_sig` (`word1_id`,`sig`),
  KEY `word2_sig` (`word2_id`,`sig`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `inv_w` (
  `word_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sentence_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pos` mediumint(2) unsigned NOT NULL DEFAULT '0',
  KEY `word_id` (`word_id`),
  KEY `sentence_id` (`sentence_id`),
  KEY `word_sentence` (`word_id`,`sentence_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `inv_so` (
  `source_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sentence_id` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `sentence_id` (`sentence_id`),
  KEY `source_id` (`source_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `sources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  KEY `id` (`id`),
  KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=9939 DEFAULT CHARSET=utf8;

ALTER TABLE `words` DISABLE KEYS;
ALTER TABLE `sentences` DISABLE KEYS;
ALTER TABLE `co_s` DISABLE KEYS;
ALTER TABLE `co_n` DISABLE KEYS;
ALTER TABLE `inv_w` DISABLE KEYS;
ALTER TABLE `inv_so` DISABLE KEYS;
ALTER TABLE `sources` DISABLE KEYS;

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/words.txt' INTO TABLE words;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/sentences.txt' INTO TABLE sentences;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/co_s.txt' INTO TABLE co_s;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/co_n.txt' INTO TABLE co_n;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/inv_w.txt' INTO TABLE inv_w;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/inv_so.txt' INTO TABLE inv_so;
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/sources.txt' INTO TABLE sources;

ALTER TABLE `words` ENABLE KEYS;
ALTER TABLE `sentences` ENABLE KEYS;
ALTER TABLE `co_s` ENABLE KEYS;
ALTER TABLE `co_n` ENABLE KEYS;
ALTER TABLE `inv_w` ENABLE KEYS;
ALTER TABLE `inv_so` ENABLE KEYS;
ALTER TABLE `sources` ENABLE KEYS;
