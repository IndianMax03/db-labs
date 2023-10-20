-- Запрос: Вывести космонавта в роли "Командир", посетившего наибольшее количество различный планет, кроме Земли

-- экспедиция - имя - от - куда

select 
space_expeditions.id as exp_id, 
space_expeditions.name as exp_name, 
origin_join.origin_name as origin,
destination_join.destination_name as destination
from space_expeditions 
join (
    select planets.id as origin_id, planets.name as origin_name from space_expeditions
    join planets on space_expeditions.origin_planet_id=planets.id
    group by origin_id
) origin_join on space_expeditions.origin_planet_id=origin_join.origin_id
join (
    select planets.id as destination_id, planets.name as destination_name from space_expeditions
    join planets on space_expeditions.destination_planet_id=planets.id
    group by destination_id
) destination_join on space_expeditions.destination_planet_id=destination_join.destination_id;

-- космонавт ид - имя - фамилия командиров

select roles.astronaut_id, astronauts.name, astronauts.surname 
from roles
join astronauts on roles.astronaut_id=astronauts.id
where roles.name='Командир';

-- космонавт ид - имя - фамилия - экспедиция ид

select commanders_join.as_id as astronaut_id, commanders_join.as_name as name, commanders_join.as_surname as surname, expedition_crew.space_expedition_id as expedition_id
from expedition_crew
join (
    select roles.astronaut_id as as_id, astronauts.name as as_name, astronauts.surname as as_surname
    from roles
    join astronauts on roles.astronaut_id=astronauts.id
    where roles.name='Командир'
) commanders_join on commanders_join.as_id=expedition_crew.astronaut_id;

-- космонавт ид - имя - фамилия - имя экспедиции - откуда - куда 

select commanders.astronaut_id, commanders.name, commanders.surname, expeditions.exp_name, expeditions.origin, expeditions.destination
from (
    select commanders_join.as_id as astronaut_id, commanders_join.as_name as name, commanders_join.as_surname as surname, expedition_crew.space_expedition_id as expedition_id
    from expedition_crew
    join (
        select roles.astronaut_id as as_id, astronauts.name as as_name, astronauts.surname as as_surname
        from roles
        join astronauts on roles.astronaut_id=astronauts.id
        where roles.name='Командир'
    ) commanders_join on commanders_join.as_id=expedition_crew.astronaut_id
) commanders
join (
        select 
    space_expeditions.id as exp_id, 
    space_expeditions.name as exp_name, 
    origin_join.origin_name as origin,
    destination_join.destination_name as destination
    from space_expeditions 
    join (
        select planets.id as origin_id, planets.name as origin_name from space_expeditions
        join planets on space_expeditions.origin_planet_id=planets.id
        group by origin_id
    ) origin_join on space_expeditions.origin_planet_id=origin_join.origin_id
    join (
        select planets.id as destination_id, planets.name as destination_name from space_expeditions
        join planets on space_expeditions.destination_planet_id=planets.id
        group by destination_id
    ) destination_join on space_expeditions.destination_planet_id=destination_join.destination_id
    where space_expeditions.is_success = true
) expeditions on commanders.expedition_id = expeditions.exp_id
order by commanders.astronaut_id;

-- прошлый запрос с полетами только не на Землю

select * 
from (
        select commanders.astronaut_id, commanders.name, commanders.surname, expeditions.exp_name, expeditions.origin, expeditions.destination
    from (
        select commanders_join.as_id as astronaut_id, commanders_join.as_name as name, commanders_join.as_surname as surname, expedition_crew.space_expedition_id as expedition_id
        from expedition_crew
        join (
            select roles.astronaut_id as as_id, astronauts.name as as_name, astronauts.surname as as_surname
            from roles
            join astronauts on roles.astronaut_id=astronauts.id
            where roles.name='Командир'
        ) commanders_join on commanders_join.as_id=expedition_crew.astronaut_id
    ) commanders
    join (
            select 
        space_expeditions.id as exp_id, 
        space_expeditions.name as exp_name, 
        origin_join.origin_name as origin,
        destination_join.destination_name as destination
        from space_expeditions 
        join (
            select planets.id as origin_id, planets.name as origin_name from space_expeditions
            join planets on space_expeditions.origin_planet_id=planets.id
            group by origin_id
        ) origin_join on space_expeditions.origin_planet_id=origin_join.origin_id
        join (
            select planets.id as destination_id, planets.name as destination_name from space_expeditions
            join planets on space_expeditions.destination_planet_id=planets.id
            group by destination_id
        ) destination_join on space_expeditions.destination_planet_id=destination_join.destination_id
        where space_expeditions.is_success = true
    ) expeditions on commanders.expedition_id = expeditions.exp_id 
    order by commanders.astronaut_id
) commanders_not_earth
where commanders_not_earth.destination != 'Земля';

-- имя - фамилия - количество посещенных уникальных планет

select commanders_planets.name, commanders_planets.surname, count(commanders_planets.astronaut_id) as unique_planets
from (
        select * 
    from (
            select commanders.astronaut_id, commanders.name, commanders.surname, expeditions.exp_name, expeditions.origin, expeditions.destination
        from (
            select commanders_join.as_id as astronaut_id, commanders_join.as_name as name, commanders_join.as_surname as surname, expedition_crew.space_expedition_id as expedition_id
            from expedition_crew
            join (
                select roles.astronaut_id as as_id, astronauts.name as as_name, astronauts.surname as as_surname
                from roles
                join astronauts on roles.astronaut_id=astronauts.id
                where roles.name='Командир'
            ) commanders_join on commanders_join.as_id=expedition_crew.astronaut_id
        ) commanders
        join (
                select 
            space_expeditions.id as exp_id, 
            space_expeditions.name as exp_name, 
            origin_join.origin_name as origin,
            destination_join.destination_name as destination
            from space_expeditions 
            join (
                select planets.id as origin_id, planets.name as origin_name from space_expeditions
                join planets on space_expeditions.origin_planet_id=planets.id
                group by origin_id
            ) origin_join on space_expeditions.origin_planet_id=origin_join.origin_id
            join (
                select planets.id as destination_id, planets.name as destination_name from space_expeditions
                join planets on space_expeditions.destination_planet_id=planets.id
                group by destination_id
            ) destination_join on space_expeditions.destination_planet_id=destination_join.destination_id
            where space_expeditions.is_success = true
        ) expeditions on commanders.expedition_id = expeditions.exp_id 
        order by commanders.astronaut_id
    ) commanders_not_earth
    where commanders_not_earth.destination != 'Земля'
) commanders_planets
group by commanders_planets.name, commanders_planets.surname;

-- результат запроса

select result.name, result.surname, result.unique_planets
from (
    select commanders_planets.name, commanders_planets.surname, count(commanders_planets.astronaut_id) as unique_planets
    from (
            select * 
        from (
                select commanders.astronaut_id, commanders.name, commanders.surname, expeditions.exp_name, expeditions.origin, expeditions.destination
            from (
                select commanders_join.as_id as astronaut_id, commanders_join.as_name as name, commanders_join.as_surname as surname, expedition_crew.space_expedition_id as expedition_id
                from expedition_crew
                join (
                    select roles.astronaut_id as as_id, astronauts.name as as_name, astronauts.surname as as_surname
                    from roles
                    join astronauts on roles.astronaut_id=astronauts.id
                    where roles.name='Командир'
                ) commanders_join on commanders_join.as_id=expedition_crew.astronaut_id
            ) commanders
            join (
                    select 
                space_expeditions.id as exp_id, 
                space_expeditions.name as exp_name, 
                origin_join.origin_name as origin,
                destination_join.destination_name as destination
                from space_expeditions 
                join (
                    select planets.id as origin_id, planets.name as origin_name from space_expeditions
                    join planets on space_expeditions.origin_planet_id=planets.id
                    group by origin_id
                ) origin_join on space_expeditions.origin_planet_id=origin_join.origin_id
                join (
                    select planets.id as destination_id, planets.name as destination_name from space_expeditions
                    join planets on space_expeditions.destination_planet_id=planets.id
                    group by destination_id
                ) destination_join on space_expeditions.destination_planet_id=destination_join.destination_id
                where space_expeditions.is_success = true
            ) expeditions on commanders.expedition_id = expeditions.exp_id 
            order by commanders.astronaut_id
        ) commanders_not_earth
        where commanders_not_earth.destination != 'Земля'
    ) commanders_planets
    group by commanders_planets.name, commanders_planets.surname
) result
where result.unique_planets = (
    select max(result.unique_planets) 
    from (select commanders_planets.name, commanders_planets.surname, count(commanders_planets.astronaut_id) as unique_planets
    from (
            select * 
        from (
                select commanders.astronaut_id, commanders.name, commanders.surname, expeditions.exp_name, expeditions.origin, expeditions.destination
            from (
                select commanders_join.as_id as astronaut_id, commanders_join.as_name as name, commanders_join.as_surname as surname, expedition_crew.space_expedition_id as expedition_id
                from expedition_crew
                join (
                    select roles.astronaut_id as as_id, astronauts.name as as_name, astronauts.surname as as_surname
                    from roles
                    join astronauts on roles.astronaut_id=astronauts.id
                    where roles.name='Командир'
                ) commanders_join on commanders_join.as_id=expedition_crew.astronaut_id
            ) commanders
            join (
                    select 
                space_expeditions.id as exp_id, 
                space_expeditions.name as exp_name, 
                origin_join.origin_name as origin,
                destination_join.destination_name as destination
                from space_expeditions 
                join (
                    select planets.id as origin_id, planets.name as origin_name from space_expeditions
                    join planets on space_expeditions.origin_planet_id=planets.id
                    group by origin_id
                ) origin_join on space_expeditions.origin_planet_id=origin_join.origin_id
                join (
                    select planets.id as destination_id, planets.name as destination_name from space_expeditions
                    join planets on space_expeditions.destination_planet_id=planets.id
                    group by destination_id
                ) destination_join on space_expeditions.destination_planet_id=destination_join.destination_id
                where space_expeditions.is_success = true
            ) expeditions on commanders.expedition_id = expeditions.exp_id 
            order by commanders.astronaut_id
        ) commanders_not_earth
        where commanders_not_earth.destination != 'Земля'
    ) commanders_planets
    group by commanders_planets.name, commanders_planets.surname) 
    result
);
