# Анализ запроса №2

## Запрос на языке SQL

```sql
select Н_ЛЮДИ.ИД, Н_ОБУЧЕНИЯ.НЗК, Н_УЧЕНИКИ.ИД
from Н_УЧЕНИКИ
right join Н_ОБУЧЕНИЯ on Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ОБУЧЕНИЯ.ЧЛВК_ИД
right join Н_ЛЮДИ on Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
where (
    Н_ЛЮДИ.ОТЧЕСТВО > 'Георгиевич'
    and
    Н_ОБУЧЕНИЯ.ЧЛВК_ИД < 163484
);

```

## Индексы

1) Hash

Данный индекс может быть полезен исключительно для ускорения JOIN'ов:

- Н_УЧЕНИКИ(ЧЛВК_ИД)
- Н_ОБУЧЕНИЯ(ЧЛВК_ИД) - для PK, так как PK - составной

2) B-tree

Бинарное дерево же будет полезно в тех же случаях, что и hash, но также в выражениях WHERE:

- Н_УЧЕНИКИ(ЧЛВК_ИД)
- Н_ЛЮДИ(ОТЧЕСТВО)
- Н_ОБУЧЕНИЯ(ЧЛВК_ИД)

3) GiST

Избыточен

4) SP-GiST

Избыточен

5) GIN

Избыточен

6) BRIN

По аналогии с первым запросом, натуральная корреляция наблюдается на колонках-внешних ключах, а также в случаях сравнения:

- Н_УЧЕНИКИ(ЧЛВК_ИД)
- Н_ОБУЧЕНИЯ(ЧЛВК_ИД)

С учетом сказанного, наилучшим сочетанием индексов в рамках данного запроса я считаю:

> hash для Н_УЧЕНИКИ(ЧЛВК_ИД)
>
> b-tree для Н_ЛЮДИ(ОТЧЕСТВО)
>
> b-tree для Н_ОБУЧЕНИЯ(ЧЛВК_ИД)

## Планы выполнения запроса

### До добавления индексов

Планы, как и в первом запросе, будут следовать увеличению оптимизации запроса.

1) "В лоб"

![plan1](/lab4/query_2/img/q2_plan1.svg)

2) Ранняя выборка

![plan2](/lab4/query_2/img/q2_plan2.svg)

3) Ранняя выборка и проекция перед соединением

![plan3](/lab4/query_2/img/q2_plan3.svg)

4) Ранняя выборка, проекция перед соединением и проекция перед выборкой

![plan4](/lab4/query_2/img/q2_plan4.svg)

### После добавления индексов

Конвеерность в первом плане исключает нужду в двух индексах сразу: b-tree для Н_ЛЮДИ(ОТЧЕСТВО) и b-tree для Н_ОБУЧЕНИЯ(ЧЛВК_ИД). В последующих планах все индексы релевантны.

## Вывод команды `EXPLAIN ANALYZE`

Команда демонстрирует то, что планировщиком был выбран план №1 с соединениями по хэшу

![explain_analyze_q2](/lab4/query_2/img/explain_analyze_q2.png)
