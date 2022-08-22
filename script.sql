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



