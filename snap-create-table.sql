DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS article;
DROP TABLE IF EXISTS articleTag;

-- create author table
CREATE TABLE author (
	authorId BINARY(16) NOT NULL,
	authorAvatarUrl VARCHAR(128),
	authorActivationToken CHAR(32) NOT NULL,
	authorEmail VARCHAR(128) NOT NULL,
	authorHash CHAR(97) NOT NULL,
	authorUserName VARCHAR(32) NOT NULL,
	UNIQUE(authorEmail),
	UNIQUE(authorUserName),
	PRIMARY KEY(authorId)
);

-- create tag table
CREATE TABLE tag (
	tagId BINARY(16) NOT NULL,
	tagName VARCHAR(32) NOT NULL,
	UNIQUE(tagName),
	PRIMARY KEY(tagId)
);

-- create article table
CREATE TABLE article (
	articleId BINARY(16) NOT NULL,
	articleAuthorId BINARY(16) NOT NULL,
	articleContent TEXT(21845),
	articleDate DATETIME(6) NOT NULL,
	articleImage VARCHAR(128),
	FOREIGN KEY (articleAuthorId) REFERENCES author(authorId),
	PRIMARY KEY(articleId)
);

-- create articleTag
CREATE TABLE articleTag (
	articleTagArticleId BINARY(16) NOT NULL,
	articleTagTagId BINARY(16) NOT NULL,
	FOREIGN KEY(articleTagArticleId) REFERENCES article(articleId),
	FOREIGN KEY(articleTagTagId) REFERENCES tag(tagId),
	PRIMARY KEY(articleTagArticleId, articleTagTagId)
);