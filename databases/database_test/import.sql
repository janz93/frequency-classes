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

CREATE TABLE `word_search_meta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `frequency_class` int(3) DEFAULT NULL,
  `word_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `word_id` (`word_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
