-- TASK 4

-- 1
-- Store 1
select store_name, name, count(amount_of_sale)
from stores
inner join products p on stores.upc_code = p.id
where store_name = 'Magnum1'
group by store_name, name
order by count(amount_of_sale) desc limit 20;

-- Store 2
select store_name, name, count(amount_of_sale)
from stores
inner join products p on stores.upc_code = p.id
where store_name = 'Magnum2'
group by store_name, name
order by count(amount_of_sale) desc limit 20;

-- Store 3
select store_name, name, count(amount_of_sale)
from stores
inner join products p on stores.upc_code = p.id
where store_name = 'Magnum3'
group by store_name, name
order by count(amount_of_sale) desc limit 20;

-- Store 4
select store_name, name, count(amount_of_sale)
from stores
inner join products p on stores.upc_code = p.id
where store_name = 'Magnum4'
group by store_name, name
order by count(amount_of_sale) desc limit 20;

-- Store 5
select store_name, name, count(amount_of_sale)
from stores
inner join products p on stores.upc_code = p.id
where store_name = 'Magnum5'
group by store_name, name
order by count(amount_of_sale) desc limit 20;


-- 2
-- State 1
select store_state, name, count(amount_of_sale)
from stores
inner join products p on stores.upc_code = p.id
where store_state = 'Massachusetts'
group by store_state, name
order by count(amount_of_sale) desc limit 20;

-- State 2
select store_state, name, count(amount_of_sale)
from stores
inner join products p on stores.upc_code = p.id
where store_state = 'California'
group by store_state, name
order by count(amount_of_sale) desc limit 20;

-- State 3
select store_state, name, count(amount_of_sale)
from stores
inner join products p on stores.upc_code = p.id
where store_state = 'Michigan'
group by store_state, name
order by count(amount_of_sale) desc limit 20;

-- State 4
select store_state, name, count(amount_of_sale)
from stores
inner join products p on stores.upc_code = p.id
where store_state = 'Tennessee'
group by store_state, name
order by count(amount_of_sale) desc limit 20;

-- State 5
select store_state, name, count(amount_of_sale)
from stores
inner join products p on stores.upc_code = p.id
where store_state = 'Georgia'
group by store_state, name
order by count(amount_of_sale) desc limit 20;



-- 3
select store_name, count(amount_of_sale)
from stores
inner join products p on stores.upc_code = p.id
group by store_name
order by count(amount_of_sale) desc limit 5;


-- 4
-- In how many stores does Beef outsell Pepper?
select name, count(name)
from stores
inner join products p on stores.upc_code = p.id
where name = 'Beef' or name = 'Pepper'
group by name
order by count(name);   -- answer 1


select name, count(name)
from stores
inner join products p on stores.upc_code = p.id
where name != 'Milk'
group by name
order by count(name) desc limit 3;