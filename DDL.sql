-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-12-14 15:59:12.581

-- tables
-- Table: Kawiarnia
CREATE TABLE Kawiarnia (
    IdKawiarni integer  NOT NULL,
    NazwaKawiarni varchar2(20)  NOT NULL,
    Wlasciciel integer  NOT NULL,
    Region varchar2(20)  NOT NULL,
    Adres varchar2(30)  NOT NULL,
    CONSTRAINT Kawiarnia_pk PRIMARY KEY (IdKawiarni)
) ;

-- Table: KawyWKawiarni
CREATE TABLE KawyWKawiarni (
    Kawa integer  NOT NULL,
    Kawiarnia integer  NOT NULL,
    CONSTRAINT KawyWKawiarni_pk PRIMARY KEY (Kawa,Kawiarnia)
) ;

-- Table: KawyWPalarniach
CREATE TABLE KawyWPalarniach (
    IdKawy integer  NOT NULL,
    Kawa integer  NOT NULL,
    PalarniaKawy integer  NOT NULL,
    StopienWypalenia varchar2(6)  NOT NULL,
    MetodaParzenia varchar2(10)  NOT NULL,
    CONSTRAINT KawyWPalarniach_pk PRIMARY KEY (IdKawy)
) ;

-- Table: Odmiana
CREATE TABLE Odmiana (
    Odmiana varchar2(30)  NOT NULL,
    CONSTRAINT Odmiana_pk PRIMARY KEY (Odmiana)
) ;

-- Table: PalarnieKawy
CREATE TABLE PalarnieKawy (
    IdPalarni integer  NOT NULL,
    NazwaPalarni varchar2(50)  NOT NULL,
    Wlasciciel integer  NOT NULL,
    Region varchar2(20)  NOT NULL,
    CONSTRAINT PalarnieKawy_pk PRIMARY KEY (IdPalarni)
) ;

-- Table: Region
CREATE TABLE Region (
    Region varchar2(20)  NOT NULL,
    Kraj varchar2(20)  NOT NULL,
    CONSTRAINT Region_pk PRIMARY KEY (Region)
) ;

-- Table: RodzajObrobki
CREATE TABLE RodzajObrobki (
    RodzajObrobki varchar2(20)  NOT NULL,
    CONSTRAINT RodzajObrobki_pk PRIMARY KEY (RodzajObrobki)
) ;

-- Table: SmakKawy
CREATE TABLE SmakKawy (
    Kawa integer  NOT NULL,
    NutaSmakowa varchar2(20)  NOT NULL,
    CONSTRAINT SmakKawy_pk PRIMARY KEY (Kawa)
) ;

-- Table: UprawianeKawy
CREATE TABLE UprawianeKawy (
    Id integer  NOT NULL,
    Region varchar2(20)  NOT NULL,
    Odmiana varchar2(30)  NOT NULL,
    RodzajObrobki varchar2(20)  NOT NULL,
    WysokoscUprawy integer  NOT NULL,
    CONSTRAINT UprawianeKawy_pk PRIMARY KEY (Id)
) ;

-- Table: Wlasciciel
CREATE TABLE Wlasciciel (
    IdWlasciciela integer  NOT NULL,
    Imie varchar2(10)  NOT NULL,
    Nazwisko varchar2(50)  NOT NULL,
    CONSTRAINT Wlasciciel_pk PRIMARY KEY (IdWlasciciela)
) ;

-- Table: ZapachKawy
CREATE TABLE ZapachKawy (
    Kawa integer  NOT NULL,
    CechaZapachowa varchar2(10)  NOT NULL,
    CONSTRAINT ZapachKawy_pk PRIMARY KEY (Kawa)
) ;

-- foreign keys
-- Reference: KawaWKawiarni_Kawiarnia (table: KawyWKawiarni)
ALTER TABLE KawyWKawiarni ADD CONSTRAINT KawaWKawiarni_Kawiarnia
    FOREIGN KEY (Kawiarnia)
    REFERENCES Kawiarnia (IdKawiarni);

-- Reference: KawaWKawiarni_KawyWPalarniach (table: KawyWKawiarni)
ALTER TABLE KawyWKawiarni ADD CONSTRAINT KawaWKawiarni_KawyWPalarniach
    FOREIGN KEY (Kawa)
    REFERENCES KawyWPalarniach (IdKawy);

-- Reference: Kawiarnia_Region (table: Kawiarnia)
ALTER TABLE Kawiarnia ADD CONSTRAINT Kawiarnia_Region
    FOREIGN KEY (Region)
    REFERENCES Region (Region);

-- Reference: Kawiarnia_Wlasciciel (table: Kawiarnia)
ALTER TABLE Kawiarnia ADD CONSTRAINT Kawiarnia_Wlasciciel
    FOREIGN KEY (Wlasciciel)
    REFERENCES Wlasciciel (IdWlasciciela);

-- Reference: KawyPalarni (table: KawyWPalarniach)
ALTER TABLE KawyWPalarniach ADD CONSTRAINT KawyPalarni
    FOREIGN KEY (PalarniaKawy)
    REFERENCES PalarnieKawy (IdPalarni);

-- Reference: KawyWPalarniach_UprawianeKawy (table: KawyWPalarniach)
ALTER TABLE KawyWPalarniach ADD CONSTRAINT KawyWPalarniach_UprawianeKawy
    FOREIGN KEY (Kawa)
    REFERENCES UprawianeKawy (Id);

-- Reference: Kawy_Palarnie (table: SmakKawy)
ALTER TABLE SmakKawy ADD CONSTRAINT Kawy_Palarnie
    FOREIGN KEY (Kawa)
    REFERENCES KawyWPalarniach (IdKawy);

-- Reference: PalarnieKawy_Region (table: PalarnieKawy)
ALTER TABLE PalarnieKawy ADD CONSTRAINT PalarnieKawy_Region
    FOREIGN KEY (Region)
    REFERENCES Region (Region);

-- Reference: PalarnieKawy_Wlasciciel (table: PalarnieKawy)
ALTER TABLE PalarnieKawy ADD CONSTRAINT PalarnieKawy_Wlasciciel
    FOREIGN KEY (Wlasciciel)
    REFERENCES Wlasciciel (IdWlasciciela);

-- Reference: UprawianeKawy_Odmiana (table: UprawianeKawy)
ALTER TABLE UprawianeKawy ADD CONSTRAINT UprawianeKawy_Odmiana
    FOREIGN KEY (Odmiana)
    REFERENCES Odmiana (Odmiana);

-- Reference: UprawianeKawy_Region (table: UprawianeKawy)
ALTER TABLE UprawianeKawy ADD CONSTRAINT UprawianeKawy_Region
    FOREIGN KEY (Region)
    REFERENCES Region (Region);

-- Reference: UprawianeKawy_RodzajObrobki (table: UprawianeKawy)
ALTER TABLE UprawianeKawy ADD CONSTRAINT UprawianeKawy_RodzajObrobki
    FOREIGN KEY (RodzajObrobki)
    REFERENCES RodzajObrobki (RodzajObrobki);

-- Reference: ZapachKawy_Palarnie (table: ZapachKawy)
ALTER TABLE ZapachKawy ADD CONSTRAINT ZapachKawy_Palarnie
    FOREIGN KEY (Kawa)
    REFERENCES KawyWPalarniach (IdKawy);

-- End of file.

