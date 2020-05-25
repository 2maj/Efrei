
CREATE TABLE Etudiant (

  NumEtu NUMBER(8) PRIMARY KEY,

  Nom VARCHAR2(20),

  Prenom VARCHAR2(20),

  DateNais DATE,

  Rue VARCHAR2(50),

  CP CHAR(5),

  Ville VARCHAR2(25)

);





CREATE TABLE Matiere (

  CodeMat CHAR(3) PRIMARY KEY,

  Libelle VARCHAR2(20),

  Coef NUMBER(3,2)

);



CREATE TABLE Epreuve (

  NumEpreuve NUMBER(10) PRIMARY KEY,

  DateEpreuve DATE,

  Lieu VARCHAR2(20),

  CodeMat CHAR(3)

);



CREATE TABLE Notation (

  NumEtu NUMBER(8),

  NumEpreuve NUMBER(10),

  Note NUMBER(4,2),

  PRIMARY KEY (NumEtu,NumEpreuve)

);



ALTER TABLE Epreuve ADD CONSTRAINT FkEpreuve1 FOREIGN KEY(CodeMat) REFERENCES Matiere(CodeMat);


ALTER TABLE Notation ADD CONSTRAINT FkNotation1 FOREIGN KEY(NumEtu) REFERENCES Etudiant(NumEtu);

ALTER TABLE Notation ADD CONSTRAINT FkNotation2 FOREIGN KEY(NumEpreuve) REFERENCES Epreuve(NumEpreuve);

