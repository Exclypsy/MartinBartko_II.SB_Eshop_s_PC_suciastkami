CREATE DATABASE db_eshop
GO

USE db_eshop
GO


-- vytvorenie tabulky kontakt (q&a) len pre testovacie ucely

CREATE TABLE contact (
  id_contact INT NOT NULL PRIMARY KEY,
  cele_meno VARCHAR(100) NOT NULL,
  subjekt VARCHAR(255) NULL,
  mail VARCHAR(255) NOT NULL,
  tel_c VARCHAR(20) NOT NULL,
  obsah_spravy TEXT NULL
);
GO

INSERT INTO contact (id_contact, cele_meno, subjekt, mail, tel_c, obsah_spravy) VALUES
(5, 'Oliver', 'Procesor', 'gmjqziarmfoinbbzzw@cazlv.com', '948654789', 'Lorem Ipsum iii'),
(6, 'Martin', 'Graficka karta', 'martinbartko07@gmail.com', '948654789', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
GO

-- vytvorenie tabulky dorucenie a jej naplnenie

CREATE TABLE dorucenie (
  ID_dorucenie INT NOT NULL PRIMARY KEY,
  typ_dorucenia VARCHAR(255) NOT NULL
);
GO

INSERT INTO dorucenie (ID_dorucenie, typ_dorucenia) VALUES
(1, 'Slovenska Posta'),
(2, 'Kurier'),
(3, 'Baliko Box');
GO

-- vytvorenie kategorii a insert kategorii

CREATE TABLE kategorie (
  ID_kategoria INT NOT NULL PRIMARY KEY,
  nazov VARCHAR(255) NOT NULL
);
GO

INSERT INTO kategorie (ID_kategoria, nazov) VALUES
(1, 'Procesory'),
(2, 'Grafické karty'),
(3, 'RAM pamet'),
(4, 'Úložiská (HDD/SSD)'),
(5, 'Základné dosky'),
(6, 'Zdroje'),
(7, 'Chladenie'),
(8, 'PC skrine'),
(9, 'Optické mechaniky'),
(10, 'Klávesnice a myši'),
(11, 'Monitory'),
(12, 'Notebooky');
GO

-- vytvorenie kosika

CREATE TABLE kosik (
  ID_kosik INT NOT NULL PRIMARY KEY,
  ID_produk INT NULL,
  mnozstvo INT NULL,
  FOREIGN KEY (ID_produk) REFERENCES produkty(ID_produk)
);
GO

-- vytvorenie tabulky objednavky

CREATE TABLE objednavka (
  ID_objednavka INT NOT NULL PRIMARY KEY,
  ID_platba INT NULL,
  ID_dorucenie INT NULL,
  meno VARCHAR(100) NOT NULL,
  priezvisko VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL,
  tel_c VARCHAR(20) NOT NULL,
  PSC VARCHAR(10) NOT NULL,
  Mesto VARCHAR(255) NOT NULL,
  Ulica VARCHAR(255) NOT NULL,
  Obsah_objednavky TEXT NOT NULL,
  cas_objednavky DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (ID_platba) REFERENCES platba(ID_platba),
  FOREIGN KEY (ID_dorucenie) REFERENCES dorucenie(ID_dorucenie)
);
GO

-- inserty pre objednavky

INSERT INTO objednavka (ID_objednavka, ID_platba, ID_dorucenie, meno, priezvisko, email, tel_c, PSC, Mesto, Ulica, Obsah_objednavky) VALUES
(1, NULL, NULL, 'Martin', 'Bartko', 'martinbartko07@gmail.com', '23145678', 'Presov', '08001', 'asffhbjf', 'Nvidia RTX 3070 Ti , Nvidia RTX 3060, ASUS ROG Strix GeForce RTX 3080');
GO

INSERT INTO objednavka (ID_objednavka, ID_platba, ID_dorucenie, meno, priezvisko, email, tel_c, PSC, Mesto, Ulica, Obsah_objednavky) VALUES
(2, 3, 1, 'John', 'Doe', 'john.doe@example.com', '123456789', '12345', 'Sample City', 'Sample Street 123', 'Nvidia RTX 3070 Ti, Corsair Vengeance LPX 32GB (2x16GB) DDR4 3600MHz'),
(3, 1, 2, 'Jane', 'Smith', 'jane.smith@example.com', '987654321', '54321', 'Another City', 'Another Street 456', 'AMD Ryzen 7 7800X3D, ASUS ROG Strix B550-F Gaming');
GO

INSERT INTO objednavka (ID_objednavka, ID_platba, ID_dorucenie, meno, priezvisko, email, tel_c, PSC, Mesto, Ulica, Obsah_objednavky) VALUES
(4, 2, 2, 'Michael', 'Johnson', 'michael.johnson@example.com', '555123456', '54321', 'New Town', 'Sunset Boulevard 123', 'Corsair Vengeance RGB Pro 16GB (2x8GB) DDR4 3200MHz, Noctua NH-D15 chromax.black, Seasonic Focus GX-850 850W 80+ Gold'),
(5, 1, 1, 'Emily', 'Williams', 'emily.williams@example.com', '555987654', '12345', 'Big City', 'Main Street 456', 'Intel Core i9-12900K, GIGABYTE Radeon RX 6900 XT'),
(6, 3, 3, 'Daniel', 'Brown', 'daniel.brown@example.com', '555246810', '67890', 'Small Village', 'Forest Road 789', 'Crucial P2 1TB NVMe SSD, ASUS ROG Strix B550-F Gaming, Logitech G Pro X Keyboard'),
(7, 4, 1, 'Sophia', 'Miller', 'sophia.miller@example.com', '555135790', '09876', 'Ocean City', 'Seaside Avenue 12', 'ASUS ROG Strix GeForce RTX 3080, Fractal Design Meshify C'),
(8, 2, 3, 'Ethan', 'Davis', 'ethan.davis@example.com', '555369258', '13579', 'Mountain Town', 'Hillside Drive 456', 'Nvidia RTX 3060, Intel Core i9-12900K'),
(9, 3, 2, 'Olivia', 'Garcia', 'olivia.garcia@example.com', '555753159', '24680', 'River City', 'Riverside Road 789', 'ASUS TUF Gaming VG27AQ, Acer Predator Helios 300 Gaming Laptop'),
(10, 1, 1, 'Alexander', 'Martinez', 'alexander.martinez@example.com', '555987654', '98765', 'Forest Village', 'Meadow Lane 321', 'Corsair Vengeance LPX 32GB (2x16GB) DDR4 3600MHz, AMD Ryzen 7 7800X3D'),
(11, 2, 3, 'Mia', 'Hernandez', 'mia.hernandez@example.com', '555369258', '54321', 'Valley City', 'Valley Road 654', 'Razer DeathAdder V2 Gaming Mouse, ASUS ROG Strix B550-F Gaming'),
(12, 4, 2, 'William', 'Young', 'william.young@example.com', '555123456', '12345', 'Lake Town', 'Lakeview Drive 789', 'Noctua NH-D15 chromax.black, ASUS DRW-24B1ST DVD-RW'),
(13, 3, 1, 'Charlotte', 'Lee', 'charlotte.lee@example.com', '555753159', '67890', 'Country Side', 'Meadow Road 12', 'ASUS ROG Strix GeForce RTX 3080, ASUS ROG Strix B550-F Gaming');
GO

-- vytvorenie tabulky pre sposob platby 

CREATE TABLE platba (
  ID_platba INT NOT NULL PRIMARY KEY,
  typ_platby VARCHAR(255) NOT NULL
);
GO

INSERT INTO platba (ID_platba, typ_platby) VALUES
(1, 'Dobierka'),
(2, 'Kartou Online'),
(3, 'Prevodom na ucet'),
(4, 'Darcekova poukazka');
GO

-- vytvorenie tabulky pre prodkty

CREATE TABLE produkty (
  ID_produk INT NOT NULL PRIMARY KEY,
  nazov VARCHAR(255) NOT NULL,
  mnozstvo INT NOT NULL,
  cena DECIMAL(10,2) NOT NULL,
  popis TEXT NULL,
  ID_tax INT NULL,
  kod_produktu VARCHAR(50) NULL,
  ID_kategoria INT NULL,
  obrazok VARCHAR(255) NULL,
  FOREIGN KEY (ID_tax) REFERENCES tax(ID_tax),
  FOREIGN KEY (ID_kategoria) REFERENCES kategorie(ID_kategoria)
);
GO

-- naplnenie produktov

INSERT INTO produkty (ID_produk, nazov, mnozstvo, cena, popis, ID_tax, kod_produktu, ID_kategoria, obrazok) VALUES
(1, 'Nvidia RTX 3070 Ti ', 30, 1240.99, 'Lorem ipsum', 2, 'F345678', 2, 'https://via.placeholder.com/550x750'),
(2, 'Nvidia RTX 3060', 23, 830.99, 'Lorem ipsum', 2, 'F468238', 2, 'https://via.placeholder.com/550x750'),
(3, 'AMD Ryzen 7 5800X', 15, 469.99, 'Lorem ipsum', 1, 'AMD5800X', 1, 'https://via.placeholder.com/550x750'),
(4, 'AMD Ryzen 7 7800X3D', 23, 390.99, 'Lorem Ipsum', 2, 'F323678', 1, 'https://via.placeholder.com/550x750'),
(5, 'ASUS ROG Strix GeForce RTX 3080', 20, 1799.99, 'Lorem ipsum', 2, 'ROG3080', 2, 'https://via.placeholder.com/550x750'),
(6, 'GIGABYTE Radeon RX 6900 XT', 25, 1499.99, 'Lorem ipsum', 2, 'RX6900XT', 2, 'https://via.placeholder.com/550x750'),
(7, 'Corsair Vengeance LPX 32GB (2x16GB) DDR4 3600MHz', 30, 169.99, 'Lorem ipsum', 3, 'Vengeance32GB', 3, 'https://via.placeholder.com/550x750'),
(8, 'Crucial P2 1TB NVMe SSD', 40, 99.99, 'Lorem ipsum', 3, 'P21TB', 4, 'https://via.placeholder.com/550x750'),
(9, 'ASUS ROG Strix B550-F Gaming', 15, 199.99, 'Lorem ipsum', 1, 'ROGB550F', 5, 'https://via.placeholder.com/550x750'),
(10, 'Seasonic Focus GX-850 850W 80+ Gold', 20, 129.99, 'Lorem ipsum', 2, 'FocusGX850', 6, 'https://via.placeholder.com/550x750'),
(11, 'Noctua NH-D15 chromax.black', 10, 99.99, 'Lorem ipsum', 1, 'NH-D15', 7, 'https://via.placeholder.com/550x750'),
(12, 'Fractal Design Meshify C', 18, 89.99, 'Lorem ipsum', 2, 'MeshifyC', 8, 'https://via.placeholder.com/550x750'),
(13, 'ASUS DRW-24B1ST DVD-RW', 25, 19.99, 'Lorem ipsum', 3, 'DRW24B1ST', 9, 'https://via.placeholder.com/550x750'),
(14, 'Logitech G Pro X Keyboard', 30, 129.99, 'Lorem ipsum', 2, 'GProXKB', 10, 'https://via.placeholder.com/550x750'),
(15, 'Razer DeathAdder V2 Gaming Mouse', 35, 69.99, 'Lorem ipsum', 3, 'DeathAdderV2', 10, 'https://via.placeholder.com/550x750'),
(16, 'ASUS TUF Gaming VG27AQ', 22, 399.99, 'Lorem ipsum', 2, 'TUFVG27AQ', 11, 'https://via.placeholder.com/550x750'),
(17, 'Acer Predator Helios 300 Gaming Laptop', 12, 1299.99, 'Lorem ipsum', 1, 'PredatorHelios300', 12, 'https://via.placeholder.com/550x750'),
(18, 'Intel Core i9-12900K', 10, 599.99, 'Lorem ipsum', 1, 'i912900K', 1, 'https://via.placeholder.com/550x750');
GO

-- vytvorenie tabulky pre danovu sadzbu + insert pre nu

CREATE TABLE tax (
  ID_tax INT NOT NULL PRIMARY KEY,
  dan DECIMAL(5,2) NOT NULL
);
GO

INSERT INTO tax (ID_tax, dan) VALUES
(1, 10.00),
(2, 20.00),
(3, 5.00);
GO

-- uprava pre tabulky

ALTER TABLE kosik ADD CONSTRAINT kosik_fk_produk FOREIGN KEY (ID_produk) REFERENCES produkty(ID_produk);
GO

ALTER TABLE objednavka ADD CONSTRAINT objednavka_fk_platba FOREIGN KEY (ID_platba) REFERENCES platba(ID_platba),
                       CONSTRAINT objednavka_fk_dorucenie FOREIGN KEY (ID_dorucenie) REFERENCES dorucenie(ID_dorucenie);
GO

ALTER TABLE produkty ADD CONSTRAINT produkty_fk_tax FOREIGN KEY (ID_tax) REFERENCES tax(ID_tax),
                        CONSTRAINT produkty_fk_kategoria FOREIGN KEY (ID_kategoria) REFERENCES kategorie(ID_kategoria);
GO

ALTER TABLE kosik 
ADD ID_objednavka INT NULL;
GO

ALTER TABLE kosik 
ADD CONSTRAINT kosik_fk_objednavka FOREIGN KEY (ID_objednavka) REFERENCES objednavka(ID_objednavka);
GO

-- ###########################################

-- insert pre kosik

INSERT INTO kosik (ID_kosik, ID_produk, mnozstvo) VALUES
(1, 3, 2), -- 2x AMD Ryzen 7 5800X
(2, 5, 1), -- 1x ASUS ROG Strix GeForce RTX 3080
(3, 8, 3), -- 3x Crucial P2 1TB NVMe SSD
(4, 14, 1); -- 1x Logitech G Pro X Keyboard
GO

-- selecty pre kategorie

SELECT * FROM produkty WHERE ID_kategoria = 1; -- Procesory
GO

SELECT * FROM produkty WHERE ID_kategoria = 2; -- Grafické karty
GO

SELECT * FROM produkty WHERE ID_kategoria = 3; -- RAM pamäť
GO

SELECT * FROM produkty WHERE ID_kategoria = 4; -- Úložiská (HDD/SSD)
GO

SELECT * FROM produkty WHERE ID_kategoria = 5; -- Základné dosky
GO

SELECT * FROM produkty WHERE ID_kategoria = 6; -- Zdroje
GO

SELECT * FROM produkty WHERE ID_kategoria = 7; -- Chladenie
GO

SELECT * FROM produkty WHERE ID_kategoria = 8; -- PC skrine
GO

SELECT * FROM produkty WHERE ID_kategoria = 9; -- Optické mechaniky
GO

SELECT * FROM produkty WHERE ID_kategoria = 10; -- Klávesnice a myši
GO

SELECT * FROM produkty WHERE ID_kategoria = 11; -- Monitory
GO

SELECT * FROM produkty WHERE ID_kategoria = 12; -- Notebooky
GO

--procedury

-- procedura ktora zvysi mnozstvo produktov v kosiku

CREATE PROCEDURE ZvysMnozstvoVKosiku
    @ID_kosik INT,
    @PridaneMnozstvo INT
AS
BEGIN
    UPDATE kosik
    SET mnozstvo = mnozstvo + @PridaneMnozstvo
    WHERE ID_kosik = @ID_kosik;
END;
GO

EXEC ZvysMnozstvoVKosiku @ID_kosik = 1, @PridaneMnozstvo = 3;
GO

SELECT * FROM kosik;
GO

-- procedura pre zvysenie poctu produktov na sklade

CREATE PROCEDURE ZvysPoctyProduktov
    @ID_produk INT,
    @PridaneMnozstvo INT
AS
BEGIN
    UPDATE produkty
    SET mnozstvo = mnozstvo + @PridaneMnozstvo
    WHERE ID_produk = @ID_produk;
END;
GO

EXEC ZvysPoctyProduktov @ID_produk = 3, @PridaneMnozstvo = 3;
GO

SELECT * FROM produkty;
GO

-- triggre

CREATE TRIGGER trg_zmaz_objednavku
ON objednavka
FOR DELETE
AS
BEGIN
    DELETE FROM kosik WHERE ID_kosik IN (SELECT ID_kosik FROM deleted);
END;
GO

DELETE FROM kosik WHERE ID_kosik = 1;
GO

INSERT INTO kosik (ID_kosik, ID_produk, mnozstvo, ID_objednavka) VALUES
(1, 3, 2, 1), -- 2x AMD Ryzen 7 5800X
(2, 5, 1, 1), -- 1x ASUS ROG Strix GeForce RTX 3080
(3, 8, 3, 1), -- 3x Crucial P2 1TB NVMe SSD
(4, 14, 1, 1); -- 1x Logitech G Pro X Keyboard
GO

-- trigger pre odstranenie produktu ktory odstrany produkt aj s kosika

CREATE TRIGGER trg_zmaz_produkt
ON produkty
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM kosik WHERE ID_produk IN (SELECT ID_produk FROM deleted);
    DELETE FROM produkty WHERE ID_produk IN (SELECT ID_produk FROM deleted);
END;
GO

DELETE FROM produkty WHERE ID_produk = 5;
GO

-- trigger pre insertovanie novych produktov

CREATE TRIGGER trg_insert_produkt
ON produkty
INSTEAD OF INSERT
AS
BEGIN
    -- Overenie, či nový záznam obsahuje ID_produk
    IF EXISTS (SELECT 1 FROM inserted WHERE ID_produk IS NULL)
    BEGIN
        -- Ak nie, vloženie nových záznamov s generovanými ID_produk
        INSERT INTO produkty (nazov, mnozstvo, cena, popis, ID_tax, kod_produktu, ID_kategoria, obrazok)
        SELECT nazov, mnozstvo, cena, popis, ID_tax, kod_produktu, ID_kategoria, obrazok
        FROM inserted;
    END
    ELSE
    BEGIN
        -- Ak áno, vloženie nových záznamov s existujúcimi ID_produk
        INSERT INTO produkty (ID_produk, nazov, mnozstvo, cena, popis, ID_tax, kod_produktu, ID_kategoria, obrazok)
        SELECT ID_produk, nazov, mnozstvo, cena, popis, ID_tax, kod_produktu, ID_kategoria, obrazok
        FROM inserted;
    END
END;


-- Vloženie nového záznamu s existujúcim ID_produk
INSERT INTO produkty (ID_produk, nazov, mnozstvo, cena, popis, ID_tax, kod_produktu, ID_kategoria, obrazok)
VALUES (19, 'Nvidia RTX 3090', 15, 1999.99, 'Lorem ipsum', 2, 'RTX3090', 2, 'https://via.placeholder.com/550x750');

-- pohlady

-- view pre zobrazenie produktov a ich danovych sadzieb

CREATE VIEW Produkty_S_Kategóriami_Danové_Sadzby AS
SELECT p.ID_produk, p.nazov AS názov_produktu, k.nazov AS názov_kategórie, p.cena, t.dan AS daňová_sadzba
FROM produkty p
JOIN kategorie k ON p.ID_kategoria = k.ID_kategoria
JOIN tax t ON p.ID_tax = t.ID_tax;
GO

-- view pre zobrazenie objednavok aj s platov a typpom dorucenia

CREATE VIEW Objednávky_S_Informáciami_O_Plátbe_A_Doručení AS
SELECT o.ID_objednavka, o.meno, o.priezvisko, o.email, o.tel_c,
       o.PSC, o.Mesto, o.Ulica, o.Obsah_objednavky,
       p.typ_platby AS spôsob_platby, d.typ_dorucenia AS spôsob_doručenia
FROM objednavka o
LEFT JOIN platba p ON o.ID_platba = p.ID_platba
LEFT JOIN dorucenie d ON o.ID_dorucenie = d.ID_dorucenie;
GO

-- view ktore nam povie ci produkt je na sklade

CREATE VIEW Produkty_S_Dostupnostou AS
SELECT 
    p.ID_produk, 
    p.nazov AS nazov_produktu, 
    k.nazov AS nazov_kategorie, 
    p.cena, 
    p.mnozstvo AS dostupne_mnozstvo,
    CASE
        WHEN p.mnozstvo > 0 THEN 'Skladom'
        ELSE 'Nedostupné'
    END AS dostupnost
FROM 
    produkty p
JOIN 
    kategorie k ON p.ID_kategoria = k.ID_kategoria;


-- zobrazenie obsahu pohľadu Produkty_S_Kategóriami_Danové_Sadzby
SELECT * FROM Produkty_S_Kategóriami_Danové_Sadzby;
GO
-- zobrazenie obsahu pohľadu Objednávky_S_Informáciami_O_Plátbe_A_Doručení
SELECT * FROM Objednávky_S_Informáciami_O_Plátbe_A_Doručení;
GO

SELECT * FROM Produkty_S_Dostupnostou;
GO

-- joiny

SELECT p.nazov AS nazov_produktu, k.nazov AS nazov_kategorie
FROM produkty p
INNER JOIN kategorie k ON p.ID_kategoria = k.ID_kategoria;
GO

-- select pre zobrazenie objednavky

SELECT o.ID_objednavka, o.meno, o.priezvisko, o.email, o.tel_c,
       o.PSC, o.Mesto, o.Ulica, o.Obsah_objednavky,
       p.typ_platby AS sposob_platby, d.typ_dorucenia AS sposob_dorucenia
FROM objednavka o
LEFT JOIN platba p ON o.ID_platba = p.ID_platba
LEFT JOIN dorucenie d ON o.ID_dorucenie = d.ID_dorucenie;
GO