create database mortalkombat;
create table kombatants (
     ID_kombatants integer PRIMARY KEY AUTOINCREMENT,
    Name varchar(255) not null,
    World varchar(255) not null,
    Faction varchar(255) not null
    CONSTRAINT fk_mortalkombat FOREIGN KEY (ID_kombat) REFERENCES kombat (ID_kombat)
);

create table kombat
(
    ID_kombat integer PRIMARY KEY AUTOINCREMENT,
    Name varchar(255),
    Endereco varchar(255),
    Faction varchar(255),
    ID_contratadas integer,
    CONSTRAINT fk_mortalkombat FOREIGN KEY (ID_kombatants) REFERENCES kombatants (ID_kombatants)
);