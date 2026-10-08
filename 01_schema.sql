—- ===============================================================
—- TABELA 1: KLIENCI (Wymiar)
—- ===============================================================
CREATE TABLE klienci (
id_klienta INTEGER PRIMARY KEY,
imie VARCHAR(50),
nazwisko VARCHAR(50),
miasto VARCHAR(50),
wojewodztwo VARCHAR(50),
data_rejestracji DATE);

—- ===============================================================
TABELA 2: PRODUKTY (Wymiar)
—- ===============================================================
CREATE TABLE produkty (
id_produktu INTEGER PRIMARY KEY,
nazwa_produktu VARCHAR(100),
kategoria VARCHAR(50),
cena_sprzedazy NUMERIC(10,2),
koszt_zakupu NUMERIC(10,2));

—- ===============================================================
TABELA 3: ZAMOWIENIA (Fakty)
—- ===============================================================
CREATE TABLE zamowienia (
id_zamowienia INTEGER PRIMARY KEY,
id_klienta INTEGER,
data_zamowienia TIMESTAMP,
status_zamowienia VARCHAR(50),
koszt_dostawy NUMERIC(6,2),
FOREIGN KEY (id_klienta) REFERENCES klienci (id_klienta));

—- ===============================================================
TABELA 4: POZYCJE_ZAMOWIENIA (Fakty)
—- ===============================================================
CREATE TABLE pozycje_zamowienia (
id_pozycji INTEGER PRIMARY KEY,
id_zamowienia INTEGER,
id_produktu INTEGER,
ilosc INTEGER,
cena_jednostkowa NUMERIC(8,2),
FOREIGN KEY (id_zamowienia) REFERENCES zamowienia (id_zamowienia),
FOREIGN KEY (id_produktu) REFERENCES produkty (id_produktu));

