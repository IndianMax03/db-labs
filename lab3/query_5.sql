select УЧЕНИКИ.ГРУП, avg(age(Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ))
from (select distinct on (ЧИД) Н_УЧЕНИКИ.ИД ИД, ЧЛВК_ИД ЧИД, ГРУППА ГРУП from Н_УЧЕНИКИ) УЧЕНИКИ
join Н_ЛЮДИ on УЧЕНИКИ.ЧИД = Н_ЛЮДИ.ИД
group by УЧЕНИКИ.ГРУП
having avg(age(Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ)) < (
    select min(distinct age(Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ))
    from Н_УЧЕНИКИ УЧЕНИКИ_ПОД
    join Н_ЛЮДИ on УЧЕНИКИ_ПОД.ЧЛВК_ИД = Н_ЛЮДИ.ИД
    where УЧЕНИКИ_ПОД.ГРУППА = '1100'
);

--  потому что min возраст в 1100 = 12 years 20 days, нужно хотя бы <=
