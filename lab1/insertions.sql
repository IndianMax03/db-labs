--  Космонавты
insert into astronauts values (1, 'Максим', 'Тучков', 'male', 180, 100.212, 3);
insert into astronauts values (2, 'Антон', 'Гаврилов', 'male', 169, 130.7, 61);
insert into astronauts values (3, 'Антон', 'Пушкин', 'male', 190, 61.42, 80);
insert into astronauts values (4, 'Ксения', 'Кондратьева', 'female', 150, 42.62, 2);
insert into astronauts values (5, 'Игорь', 'Аллаяров', 'male', 172, 78.882, -2);
insert into astronauts values (6, 'Владимир', 'Николаев', 'male', 190, 92.76, 54);
insert into astronauts values (7, 'Сергей', 'Клименков', 'male', 178, 110, 93);
insert into astronauts values (8, 'Евгений', 'Цопа', 'male', 168, 112.66, 90);
insert into astronauts values (9, 'Надежда', 'Наумова', 'female', 153, 105.32, 10);
insert into astronauts values (10, 'Дарья', 'Бострикова', 'female', 185, 82.16, 43);


--  Роли
insert into roles values (nextval('roles_id_seq'), 1, 'Повар', '1982-01-03 10:00:00');
insert into roles values (nextval('roles_id_seq'), 1, 'Бортинженер', '1984-02-14 11:00:00');

insert into roles values (nextval('roles_id_seq'), 2, 'Командир', '1986-03-15 12:00:00');
insert into roles values (nextval('roles_id_seq'), 2, 'Повар', '1988-04-01 13:00:00');
insert into roles values (nextval('roles_id_seq'), 2, 'Пилот-исследователь', '1990-05-21 14:00:00');

insert into roles values (nextval('roles_id_seq'), 3, 'Уборщик судна', '1992-06-23 15:00:00');

insert into roles values (nextval('roles_id_seq'), 4, 'Повар', '1994-07-17 16:00:00');
insert into roles values (nextval('roles_id_seq'), 4, 'Специалист по полезной нагрузке', '1996-08-12 17:00:00');

insert into roles values (nextval('roles_id_seq'), 5, 'Бортинженер', '1998-09-22 18:00:00');
insert into roles values (nextval('roles_id_seq'), 5, 'Специалист по международным полетам', '2000-10-27 19:00:00');

insert into roles values (nextval('roles_id_seq'), 6, 'Командир', '2001-11-05 20:00:00');
insert into roles values (nextval('roles_id_seq'), 6, 'Пилот лунного модуля', '2002-12-09 21:00:00');

insert into roles values (nextval('roles_id_seq'), 7, 'Командир', '2003-01-19 22:00:00');
insert into roles values (nextval('roles_id_seq'), 7, 'Пилот командного модуля', '2004-02-13 23:00:00');
insert into roles values (nextval('roles_id_seq'), 7, 'Космический пивовар', '2005-03-29 02:00:00');

insert into roles values (nextval('roles_id_seq'), 8, 'Специалист по сну в вакууме', '2006-04-02 00:00:00');

insert into roles values (nextval('roles_id_seq'), 9, 'Второй пилот', '2007-05-28 13:00:00');
insert into roles values (nextval('roles_id_seq'), 9, 'Повар', '2008-06-11 09:00:00');

insert into roles values (nextval('roles_id_seq'), 10, 'Командир', '2009-07-16 07:00:00');
insert into roles values (nextval('roles_id_seq'), 10, 'Специалист по полетам', '2010-08-08 04:00:00');

--  Искуственные интеллекты
insert into ais values (1, 'ЭАЛ', 1.46);
insert into ais values (2, 'Алиса', 1.0);
insert into ais values (3, 'Алиса', 2.0);
insert into ais values (4, 'GPT', 1.1);
insert into ais values (5, 'GPT', 3.3);
insert into ais values (6, 'GPT', 4.0);
insert into ais values (7, 'GPT', 4.6);
insert into ais values (8, 'GPT', 4.9);
insert into ais values (9, 'Midjourney', 2.3);
insert into ais values (10, 'Boitsev AI', 5.7);
insert into ais values (11, 'Муравей', 12.0);
insert into ais values (12, 'Ласточка', 3.2);

--  Ракеты
insert into rockets values (1, 'Восток', true, 8);
insert into rockets values (2, 'Восход', false, 11);
insert into rockets values (3, 'Союз', true, 6);
insert into rockets values (4, 'Мир', true, 1);
insert into rockets values (5, 'Буран', false, 3);
insert into rockets values (6, 'Спираль', false, 4);
insert into rockets values (7, 'Валун', false, 7);
insert into rockets values (8, 'Торнадо', true, 12);
insert into rockets values (9, 'Север', true, 2);
insert into rockets values (10, 'Матушка', false, 1);
insert into rockets values (11, 'Победа', false, 5);
insert into rockets values (12, 'Надежда', true, 7);

--  Планеты
insert into planets values (1, 'Маркурий', false, 167);
insert into planets values (2, 'Венера', true, 464);
insert into planets values (3, 'Земля', true, 7.2);
insert into planets values (4, 'Марс', true, -65);
insert into planets values (5, 'Юпитер', true, -110);
insert into planets values (6, 'Сатурн', true, -140);
insert into planets values (7, 'Уран', true, -195);
insert into planets values (8, 'Нептун', true, -200);
insert into planets values (9, 'Плутон', false, -223);
insert into planets values (10, 'Глизе', true, 40);

--  Экспедиции
insert into space_expeditions values (1, 'Леди разлуки', 7, 3, 2, '1985-04-24 18:57:42', '1990-08-12 09:23:17',  true);
insert into space_expeditions values (2, 'Викторина рыцаря', 9, 3, 8, '1990-11-07 07:35:51', '1994-12-31 15:12:08',  true);
insert into space_expeditions values (3, 'Атака Титанов', 8, 3, 10, '1995-06-03 21:28:59', '1998-02-19 12:45:36',  true);
insert into space_expeditions values (4, 'Космическое шествие', 2, 3, 7, '1998-10-15 04:17:24', '2000-03-28 10:59:53',  true);
insert into space_expeditions values (5, 'Троллейбусный парк', 1, 3, 1, '1981-01-23 02:10:45', '1984-05-06 10:48:04',  false);
insert into space_expeditions values (6, 'Тройной тулуп', 3, 3, 6, '2000-09-19 19:21:27', '2002-01-02 04:58:53',  true);
insert into space_expeditions values (7, 'Вечерний винегрет', 12, 3, 5, '2003-07-29 22:15:41', '2005-07-10 06:54:06',  true);
insert into space_expeditions values (8, 'Шаманский трюк', 10, 3, 10, '2012-07-05 00:08:59', '2054-02-22 15:31:34',  null);
insert into space_expeditions values (9, 'Карнавал красок', 11, 3, 2, '2005-12-05 00:08:59', '2008-10-18 08:46:24',  true);
insert into space_expeditions values (10, 'Скачки', 4, 3, 4, '2008-06-14 02:02:16', '2010-08-26 10:39:43',  true);
insert into space_expeditions values (11, 'Моржовый клык', 6, 3, 8, '2011-01-08 19:17:08', '2014-03-21 03:54:36',  false);
insert into space_expeditions values (12, 'Баба Яга', 5, 3, 7, '2016-05-04 12:32:01', '2022-09-16 21:09:28',  true);
insert into space_expeditions values (13, 'Танцы с бубном', 3, 6, 9, '2023-05-16 13:11:11', '2027-10-18 06:03:44',  true);
insert into space_expeditions values (14, 'Последняя дискотека', 8, 10, 2, '2029-09-30 09:07:22', '2034-10-23 12:12:12',  true);

--  Состав экспедиции 2, 6, 7, 10 -- командиры, всего 10 человек, астро-экспа-опыт
insert into expedition_crew values (2, 1, 12);
insert into expedition_crew values (1, 1, 12);
insert into expedition_crew values (3, 1, 12);
insert into expedition_crew values (6, 2, 12);
insert into expedition_crew values (4, 2, 12);
insert into expedition_crew values (7, 3, 12);
insert into expedition_crew values (5, 3, 12);
insert into expedition_crew values (8, 3, 12);
insert into expedition_crew values (2, 4, 12);
insert into expedition_crew values (1, 4, 12);
insert into expedition_crew values (10, 5, 12);
insert into expedition_crew values (9, 5, 12);
insert into expedition_crew values (10, 6, 12);
insert into expedition_crew values (1, 6, 12);
insert into expedition_crew values (3, 6, 12);
insert into expedition_crew values (7, 7, 12);
insert into expedition_crew values (4, 7, 12);
insert into expedition_crew values (2, 8, 12);
insert into expedition_crew values (5, 8, 12);
insert into expedition_crew values (1, 8, 12);
insert into expedition_crew values (2, 9, 12);
insert into expedition_crew values (1, 9, 12);
insert into expedition_crew values (6, 10, 12);
insert into expedition_crew values (5, 10, 12);
insert into expedition_crew values (7, 11, 12);
insert into expedition_crew values (9, 11, 12);
insert into expedition_crew values (6, 12, 12);
insert into expedition_crew values (8, 12, 12);
insert into expedition_crew values (10, 13, 12);
insert into expedition_crew values (3, 13, 12);
insert into expedition_crew values (10, 14, 12);
insert into expedition_crew values (4, 14, 12);
insert into expedition_crew values (3, 14, 12);
