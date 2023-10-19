create table if not exists astronauts (
    id serial primary key,
    name varchar(32) not null,
    surname varchar(32) not null,
    sex varchar(6),
    height real,
    weight real,
    stress_resistance smallint,
    constraint valid_sex check (sex = 'male' or sex = 'female'),
    constraint valid_height check (height > 0),
    constraint valid_weight check (weight > 0)
);

create table if not exists roles (
    id serial primary key,
    astronaut_id integer references astronauts (id) on delete cascade on update cascade,
    name varchar(128) not null,
    assignment_date timestamp
);

create table if not exists ais (
    id serial primary key,
    name varchar(32) not null,
    version real,
    constraint valid_version check (version >= 0)
);

create table if not exists rockets (
    id serial primary key,
    name varchar(32) not null,
    has_manual_control boolean,
    ai_id integer references ais (id) on delete set null on update cascade
);

create table if not exists planets (
    id serial primary key,
    name varchar(64) not null,
    has_atmosphere boolean,
    temperature real
);

create table if not exists space_expeditions (
    id serial primary key,
    name varchar(32) not null,
    rocket_id integer references rockets (id) on delete set null on update cascade,
    origin_planet_id integer references planets (id) on delete restrict on update cascade,
    destination_planet_id integer references planets (id) on delete restrict on update cascade,
    opening timestamp,
    closure timestamp,
    is_success boolean,
    constraint valid_route check (origin_planet_id != destination_planet_id),
    constraint valid_time check (opening <= closure)
);

create table if not exists expedition_crew (
    astronaut_id integer references astronauts (id) on delete restrict on update cascade,
    space_expedition_id integer references space_expeditions (id) on delete cascade on update cascade,
    experience integer,
    constraint valid_experience check (experience >= 0),
    primary key (astronaut_id, space_expedition_id)
);
