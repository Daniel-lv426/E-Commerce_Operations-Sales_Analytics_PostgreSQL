—-
Wstawianie klientów

INSERT INTO klienci (id_klienta, imie, nazwisko, miasto, wojewodztwo, data_rejestracji)
VALUES
(1, 'Jan', 'Kowalski', 'opole',	' Opolskie', '2025-01-15'),
(2, 'Anna', 'Nowak', 'Wrocław', 'dolnośląskie', '2025-02-01'),
(3, 'Piotr', ' Wiśniewski', 'kraków', 'MAŁOPOLSKIE', '2025-02-10'),
(4, 'Katarzyna', 'Wójcik', 'Opole', 'opolskie', '2025-03-05'),
(5, 'Michał', 'Kamiński', 'wrocław', 'Dolnośląskie', '2025-03-20');

—-
Wstawianie produktów

INSERT INTO produkty (id_produktu, nazwa_produktu, kategoria, cena_sprzedazy, koszt_zakupu)
VALUES
(1, 'Klawiatura Mechaniczna', ' ELEKTRONIKA', 350.00, 180.00),
(2, 'Mysz Bezprzewodowa', ' elektronika', 150.00, 70.00),
(3, 'Monitor 27 cali', 'Elektronika', 1100.00, 750.00),
(4, 'Fotel Biurowy Ergonomiczny', ' meble', 850.00, 420.00),
(5, 'Biurko z regulacją wysokości', 'MEBLE', 1600.00, 900.00),
(6, 'Podkładka pod mysz XL', 'akcesoria', 60.00, 15.00);

—-
Wstawianie zamówień

INSERT INTO zamowienia (id_zamowienia, id_klienta, data_zamowienia, status_zamowienia, koszt_dostawy)
VALUES
(1, 1, '2026-01-10 10:15:00', 'Zrealizowane', 15.00),
(2, 2, '2026-01-12 14:30:00', 'zrealizowane', 0.00),
(3, 1, '2026-02-01 09:00:00', 'ZREALIZOWANE', 15.00),
(4, 3, '2026-02-15 18:20:00', 'anulowane', 15.00),
(5, 4, '2026-03-02 11:45:00', 'Zrealizowane', 20.00),
(6, 2, '2026-03-10 16:10:00', 'zrealizowane', 0.00),
(7, 5, '2026-03-25 13:05:00', 'Zrealizowane', 15.00);

—-
Wstawianie pozycji zamówień

INSERT INTO pozycje_zamowienia (id_pozycji, id_zamowienia, id_produktu, ilosc, cena_jednostkowa)
VALUES
(1, 1, 1, 1, 350.00),
(2, 1, 6, 2, 60.00),
(3, 2, 3, 1, 1100.00),
(4, 2, 2, 1, 150.00),
(5, 3, 2, 1, 150.00),
(6, 4, 5, 1, 1600.00),
(7, 5, 4, 1, 850.00),
(8, 5, 6, 1, 60.00),
(9, 6, 1, 2, 340.00),
(10, 7, 5, 1, 1600.00);

