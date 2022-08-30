
use [Badge2022-Ecole]


CREATE TABLE roles
(
    rid INT PRIMARY KEY NOT NULL,
    rnom VARCHAR(max),
)


CREATE TABLE examens
(
    eid INT PRIMARY KEY NOT NULL,
    enom VARCHAR(max),
)

CREATE TABLE formations
(
    fid INT PRIMARY KEY NOT NULL,
    fnom VARCHAR(max),
)


CREATE TABLE cours
(
    cid INT PRIMARY KEY NOT NULL,
    cnom VARCHAR(max),
	cexams INT FOREIGN KEY REFERENCES examens(eid),
	cform INT FOREIGN KEY REFERENCES formations(fid)
)


CREATE TABLE utilisateurs
(
    uid INT PRIMARY KEY NOT NULL,
    unom VARCHAR(max),
    uprenom VARCHAR(max),
    uemail VARCHAR(max),
    udate_naissance DATE,
    upays VARCHAR(max),
    uville VARCHAR(max),
    ucode_postal VARCHAR(5),
    urole INT FOREIGN KEY REFERENCES roles(rid),
	uformation INT FOREIGN KEY REFERENCES formations(fid)
)

CREATE TABLE notesEleves
(
    nrid INT FOREIGN KEY REFERENCES utilisateurs(uid),
	ncid INT FOREIGN KEY REFERENCES cours(cid),
	nnote int
)


INSERT INTO [dbo].[roles] ([rid],[rnom]) VALUES (1, 'Admins');
INSERT INTO [dbo].[roles] ([rid],[rnom]) VALUES (2, 'Etudiants');
INSERT INTO [dbo].[roles] ([rid],[rnom]) VALUES (3, 'Formateurs');

INSERT INTO [dbo].[examens] ([eid],[enom]) VALUES (1, 'CyberSécurité : C#');
INSERT INTO [dbo].[examens] ([eid],[enom]) VALUES (2, 'CyberSécurité : Algo');
INSERT INTO [dbo].[examens] ([eid],[enom]) VALUES (3, 'CyberSécurité : Badge');

INSERT INTO [dbo].[formations] ([fid],[fnom]) VALUES (1, 'CyberSécurité');
INSERT INTO [dbo].[formations] ([fid],[fnom]) VALUES (2, 'Badge - CyberSécurité');

INSERT INTO [dbo].[cours] ([cid],[cnom],[cexams],[cform]) VALUES (1, 'Cours - 01',1,1);
INSERT INTO [dbo].[cours] ([cid],[cnom],[cexams],[cform]) VALUES (2, 'Cours - 02',1,1);
INSERT INTO [dbo].[cours] ([cid],[cnom],[cexams],[cform]) VALUES (3, 'Cours - 03',1,1);
INSERT INTO [dbo].[cours] ([cid],[cnom],[cexams],[cform]) VALUES (4, 'Cours - 04',1,1);


INSERT INTO [dbo].[utilisateurs] ([uid],[unom],[uprenom],[uemail],[udate_naissance],[upays],[uville],[ucode_postal],[urole],[uformation])
     VALUES (1,'Nom Etudiant 01','prenom Etudiant 01','Email Etudiant 01','2020-01-01','France','Toulouse','31300',2,1)

INSERT INTO [dbo].[notesEleves] ([nrid],[ncid],[nnote]) VALUES (1,1,15)


GO