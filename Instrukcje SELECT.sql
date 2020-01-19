/*5 polecen SELECT z warunkiem WHERE*/
/*Polecenie zwraca kawy uprawiane na wysokosci rownej 1500 lub wyzszej*/
SELECT * FROM UPRAWIANEKAWY WHERE WYSOKOSCUPRAWY>=1500;
/*Polecenie zwraca regiony Hondurasu*/
SELECT REGION FROM REGION WHERE KRAJ='Honduras';
/*Zwraca nazwy kawiarni mieszczacych sie w Warszawie*/
SELECT NAZWAKAWIARNI, REGION FROM KAWIARNIA WHERE REGION='Warszawa';
/*Zwraca dane kaw o odmianie catuai obrabianej metoda "washed"*/
SELECT * FROM UPRAWIANEKAWY WHERE ODMIANA='Catuai' AND RODZAJOBROBKI='Washed';
/*Zwraca dane kawiarnii posiadajych wartosc wlasciciel*/
SELECT * FROM KAWIARNIA WHERE WLASCICIEL IS NOT NULL;

/*5 polecen SELECT ze zlaczeniem tabel*/
/*Zwraca region razem z nazwa kraju miejsc w ktorych sa uprawiane dane odmiany*/
SELECT t1.REGION, t2.KRAJ, t1.ODMIANA FROM UPRAWIANEKAWY t1 LEFT JOIN REGION t2 ON t1.REGION=t2.REGION;
/*Zwraca nazwy palarni razem z pelnym imieniem i nazwiskiem wlascicieli*/
SELECT NAZWAPALARNI, (IMIE ||' '|| NAZWISKO) as "Wlasciciel" FROM PALARNIEKAWY INNER JOIN WLASCICIEL ON PALARNIEKAWY.WLASCICIEL=WLASCICIEL.IDWLASCICIELA;
/*Zwraca zapachy kaw razem z danymi z tabeli kawywpalarniach*/
SELECT CECHAZAPACHOWA, KAWYWPALARNIACH.* FROM ZAPACHKAWY INNER JOIN KAWYWPALARNIACH ON KAWYWPALARNIACH.IDKAWY=ZAPACHKAWY.KAWA; 
/*Zwraca smaki kaw razem z danymi z tabeli kawywpalarniach*/
SELECT NUTASMAKOWA, KAWYWPALARNIACH.* FROM SMAKKAWY INNER JOIN KAWYWPALARNIACH ON KAWYWPALARNIACH.IDKAWY=SMAKKAWY.KAWA; 
/*Zwraca dane palarni kawy posiadajace kawy o jasnym stopniu wyparzenia*/
SELECT DISTINCT PALARNIEKAWY.* FROM PALARNIEKAWY LEFT JOIN KAWYWPALARNIACH ON IDPALARNI=PALARNIAKAWY WHERE STOPIENWYPALENIA='Jasny';

/*5 polecen SELECT z klauzula GROUP BY, w tym co najmniej 2 z klauzula HAVING*/
/*Zwraca odmiany o sredniej wysokosci upraw wiekszej niz 1500mnpm*/
SELECT ODMIANA, AVG(WYSOKOSCUPRAWY) FROM UPRAWIANEKAWY GROUP BY ODMIANA HAVING AVG(WYSOKOSCUPRAWY)>1500;
/*Liczba rodzajow kaw ktore pali palarnia*/
SELECT PALARNIAKAWY,COUNT(IDKAWY) AS "liczba palonych kaw" FROM KAWYWPALARNIACH GROUP BY PALARNIAKAWY;
/*Zwraca minimalna wysokosc upraw danej odmiany*/
SELECT ODMIANA, MIN(WYSOKOSCUPRAWY) FROM UPRAWIANEKAWY GROUP BY ODMIANA;
/*Liczba rodzajow kaw ktore posiada kawiarnia*/
SELECT KAWIARNIA,COUNT(KAWA) FROM KAWYWKAWIARNI GROUP BY KAWIARNIA;
/*Zwraca obrobki uzywane przy więcej niz jednej odmianie kawy*/
SELECT RODZAJOBROBKI, COUNT(ODMIANA) FROM UPRAWIANEKAWY GROUP BY RODZAJOBROBKI HAVING COUNT(ODMIANA)>1;