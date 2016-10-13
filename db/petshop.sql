drop table if exists pets;
drop table if exists stores;


create table stores(
  id serial4 primary key,
  name varchar(255),
  address varchar(255),
  type varchar(255)
);

create table pets(
  id serial4 primary key,
  name varchar(255),
  type varchar(255),
  store_id int4 references stores(id)
);