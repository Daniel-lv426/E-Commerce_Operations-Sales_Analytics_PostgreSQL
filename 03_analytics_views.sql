—-==========================================================================================
Widok 1: Efektywność sprzedaży i Marżowość Kategorii
—-==========================================================================================
—- Cel: Agregacja przychodu, zysku, oraz marży % po wyczyszczeniu danych (tylko zamówienia
—- zrealizowane).


CREATE VIEW raport AS 
WITH zestawienie AS (
SELECT 
COALESCE(UPPER(TRIM(p.kategoria)), 'Nieokreślona') AS kategoria_, 
COUNT(DISTINCT z.id_zamowienia) AS ilosc_zamowien, 
SUM(pz.ilosc * pz.cena_jednostkowa) AS wartosc_sprzedazy, 
SUM(pz.ilosc * pz.cena_jednostkowa) - SUM(pz.ilosc * p.koszt_zakupu) AS marza_kwotowa
FROM zamowienia z 
JOIN pozycje_zamowienia pz 
ON z.id_zamowienia = pz.id_zamowienia 
JOIN produkty p 
ON pz.id_produktu = p.id_produktu
WHERE LOWER(TRIM(z.status_zamowienia)) = 'zrealizowane'
GROUP BY kategoria_)
SELECT 
kategoria_, 
ilosc_zamowien, 
wartosc_sprzedazy, 
marza_kwotowa, 
ROUND((marza_kwotowa / wartosc_sprzedazy) * 100, 2) AS proc_marza, 
DENSE_RANK() OVER(ORDER BY marza_kwotowa DESC) AS najwiekszy_zysk
FROM zestawienie;


============================================================================================
—- Widok 2: Odstępy czasowe klientów
—-==========================================================================================
—- Cel: Identyfikacja powracających klientów, wyliczenie kolejności zamówień oraz liczby dni
—- od poprzedniego zakupu.


CREATE VIEW raport_klienci AS WITH dane AS (SELECT
k.id_klienta, 
z.data_zamowienia::DATE,
ROW_NUMBER() OVER(PARTITION BY k.id_klienta ORDER BY z.data_zamowienia ASC) AS nr_zamowienia_klienta,
LAG(z.data_zamowienia) OVER(PARTITION BY k.id_klienta ORDER BY z.data_zamowienia ASC)::DATE AS data_poprzedniego_zamowienia
FROM klienci k 
JOIN zamowienia z 
ON k.id_klienta = z.id_klienta
WHERE LOWER(TRIM(z.status_zamowienia)) = 'zrealizowane')
SELECT
id_klienta,  
nr_zamowienia_klienta,
data_zamowienia,
data_poprzedniego_zamowienia,
data_zamowienia - data_poprzedniego_zamowienia AS roznica_w_dniach
FROM dane
ORDER BY roznica_w_dniach;
