


create table if not exists shipment (
	id int,
	data varchar(64)
);

create or replace function my_trigger() returns trigger as $$
	begin
		new.id = (select count(*) + 1 from shipment);
		return new;
	end
$$ language plpgsql;

create or replace trigger shipment_my_trigger
before insert on shipment
for each row
execute procedure my_trigger();

insert into shipment (data) values ('my data');

