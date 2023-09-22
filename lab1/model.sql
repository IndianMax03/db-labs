create table if not exists humans (
    id serial primary key,
    name varchar(127) not null,
    sex varchar(127),
    height real,
    stress_resistance double precision
);

create table if not exists roles (
    id serial primary key,
    name varchar(63) not null
);

create table if not exists crew_members (
    id serial primary key,
    human_id integer,
    role_id integer,
    space_experiance real,
    foreign key (human_id) references humans(id)
);

create table if not exists control_types (
    id serial primary key,
    name varchar(31) not null
);

create table if not exists ais (
    id serial primary key,
    name varchar(127) not null,
    successful_flights integer,
    unsuccessful_flights integer
);

create table if not exists rockets (
    id serial primary key,
    name varchar(127) not null,
    control_type_id integer,
    ai_id integer,
    foreign key (control_types) references control_types(id),
    foreign key (ai_id) references ais(id)
);

create table if not exists planets (
    id serial primary key,
    name varchar(127) not null,
    has_atmosphere boolean,
    temperature real
);

create table if not exists space_expeditions (
    id serial primary key,
    name varchar(127) not null,
    rocket_id integer,
    origin_planet_id integer,
    destination_planet_id integer,
    start_of_expedition date,
    foreign key (rocket_id) references rockets(id),
    foreign key (destination_planet_id) references planet(id),
    foreign key (destination_planet_id) references planet(id)
);

create table if not exists crew_distributions (
    id serial primary key,
    space_expedition_id integer
    crew_member_id integer,
    foreign key (space_expedition_id) references space_expeditions(id),
    foreign key (crew_member_id) references crew_members(id)
);
