--  Космонавты
insert into astronauts values (nextval('astronauts_id_seq'), 'Максим', 'Тучков', 'male', 180, 100.212, 14);

--  Роли
insert into roles values (nextval('roles_id_seq'), currval('astronauts_id_seq'), 'Повар', '2004-10-19 10:23:54');
insert into roles values (nextval('roles_id_seq'), currval('astronauts_id_seq'), 'Пилот', '2010-11-21 16:12:22');

--  Искуственные интеллекты
insert into ais values (nextval('ais_id_seq'), 'ЭАЛ', 1.46);

--  Ракеты
insert into rockets values (nextval('rockets_id_seq'), 'Луна-24', false, 1);

--  Планеты
insert into planets values (nextval('planets_id_seq'), 'Земля', true, 30);
insert into planets values (nextval('planets_id_seq'), 'Венера', false, 344);
insert into planets values (nextval('planets_id_seq'), 'Маркурий', false, 506);

--  Экспедиции
insert into space_expeditions values (nextval('space_expeditions_id_seq'), 'Гуси-лебеди', 1, 1, 3, '2012-07-06 03:14:15', '2020-07-06 05:14:15',  null);

--  Состав экспедиции
insert into expedition_crew values (1, 1, 12);
