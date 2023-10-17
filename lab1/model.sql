create table if not exists astronauts (
    id serial primary key, --  fix in model
    name varchar(32) not null,
    sex varchar(1),
    height real,
    weight real,
    stress_resistance smallint
);

create table if not exists roles (
    id serial primary key, --  fix in model
    astronaut_id integer references astronauts,
    name varchar(32),
    assignment_date timestamp
);

create table if not exists ais (
    name varchar(32) primary key,
    version real
);

create table if not exists rockets (
    id serial primary key, --  fix in model
    name varchar(32) not null,
    has_manual_control boolean,
    ai_name varchar(32) references ais
);

create table if not exists planets (
    id serial primary key, --  fix in model
    name varchar(64),
    has_atmosphere boolean,
    temperature real
);

create table if not exists space_expeditions (
    id serial primary key, --  fix in model
    name varchar(32) not null,
    rocket_id integer references rockets,
    origin_planet_id integer references planets,
    destination_planet_id integer references planets,
    opening timestamp, --  fix in model
    closure timestamp, --  fix in model
    is_success boolean
);

create table if not exists expedition_crew (
    astronaut_id integer references astronauts,
    space_expedition_id integer references space_expeditions,
    experience integer
);
