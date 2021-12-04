CREATE TABLE product_types(
   id INT GENERATED ALWAYS AS IDENTITY,
   type_name VARCHAR(40) NOT NULL,
   expiration_date DATE,
   weight_l_kg VARCHAR(40) NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE products(
   id INT GENERATED ALWAYS AS IDENTITY,
   name VARCHAR(40) NOT NULL,
   price money,
   amount_of_sale INT NOT NULL,
   date_of_sale DATE,
   type_id serial,
   PRIMARY KEY (id),
   constraint type_products_fk
   FOREIGN KEY (type_id) references product_types(id)
);

CREATE TABLE purchases(
    id INT GENERATED ALWAYS AS IDENTITY,
    date_of_purchase DATE,
    pur_products VARCHAR(40) NOT NULL,
    pur_products_amount INT NOT NULL,
    pur_sum money,
    upc_code serial,
    PRIMARY KEY (id),
    constraint products_products_fk
    FOREIGN KEY (upc_code) references products(id)
);

CREATE TABLE customers(
   id INT GENERATED ALWAYS AS IDENTITY,
   cus_first_name VARCHAR(40) NOT NULL,
   cus_last_name VARCHAR(40) NOT NULL,
   cus_phone_number INT NOT NULL,
   pur_id serial,
   PRIMARY KEY(id),
   constraint purchases_brands_fk
   FOREIGN KEY (pur_id) references purchases(id)
);

CREATE TABLE vendors(
   id INT GENERATED ALWAYS AS IDENTITY,
   vendor_first_name VARCHAR(40) NOT NULL,
   vendor_last_name VARCHAR(40) NOT NULL,
   vendor_method VARCHAR(40) NOT NULL,
   vendor_phone_number INT NOT NULL,
   upc_code serial,
   PRIMARY KEY(id),
   constraint products_vendors_fk
   FOREIGN KEY (upc_code) references products(id)

);

CREATE TABLE brands(
   id INT GENERATED ALWAYS AS IDENTITY,
   brand_name VARCHAR(40) NOT NULL,
   vendor_id serial,
   PRIMARY KEY (id),
   constraint vendors_brands_fk
   FOREIGN KEY (vendor_id) references vendors(id)
);

CREATE TABLE stores(
   id INT GENERATED ALWAYS AS IDENTITY,
   store_name VARCHAR(40) NOT NULL,
   store_state VARCHAR(40) NOT NULL,
   store_open_hour_am INT NOT NULL,
   cus_id serial,
   upc_code serial,
   PRIMARY KEY (id),
   constraint customers_stores_fk
   FOREIGN KEY (cus_id) references customers(id),
   FOREIGN KEY (upc_code) references products(id)
);

CREATE TABLE enterprise(
   id INT GENERATED ALWAYS AS IDENTITY,
   enterprise_name VARCHAR(40) NOT NULL,
   CEO_name VARCHAR(50) NOT NULL,
   address VARCHAR(40) NOT NULL,
   office_phone_number INT NOT NULL,
   brand_id serial,
   store_id serial,
   PRIMARY KEY (id),
   constraint brands_enterprise_fk
   FOREIGN KEY (brand_id) references brands(id),
   constraint stores_enterprise_fk
   FOREIGN KEY (store_id) references stores(id)
);



CREATE INDEX on enterprise (enterprise_name);
CREATE INDEX on stores (store_state);
CREATE INDEX on brands (brand_name);
CREATE INDEX on products (name);
CREATE INDEX on product_types (type_name);
CREATE INDEX on vendors (vendor_first_name, vendor_last_name);
CREATE INDEX on customers (cus_phone_number);
CREATE INDEX on purchases (date_of_purchase, pur_sum);





insert into product_types (type_name, expiration_date, weight_l_kg) values ('Ecolab - Hobart Upr Prewash Arm', '2018-05-22', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Ecolab - Medallion', '2018-01-01', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Maintenance Removal Charge', '2018-10-18', 5);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Chicken - Base', '2018-08-13', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Peas - Frozen', '2018-06-21', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Mustard - Seed', '2018-04-21', 7);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Container Clear 8 Oz', '2018-08-08', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Wine - Penfolds Koonuga Hill', '2018-06-28', 9);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Milk - Buttermilk', '2017-12-29', 4);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Kolrabi', '2018-07-13', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Broom Handle', '2018-07-12', 8);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Tea - Lemon Green Tea', '2018-05-03', 4);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Cheese - Augre Des Champs', '2018-03-17', 4);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Shrimp - Black Tiger 26/30', '2018-04-07', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Beer - Maudite', '2018-03-05', 9);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Flower - Daisies', '2018-06-11', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Sprite - 355 Ml', '2017-11-08', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Longos - Grilled Chicken With', '2017-11-07', 7);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Nut - Macadamia', '2018-09-05', 10);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Mayonnaise', '2018-04-08', 9);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Corn - On The Cob', '2017-12-27', 7);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Appetizer - Shrimp Puff', '2018-04-21', 3);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Wine - Red, Lurton Merlot De', '2018-05-12', 3);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Bread - Kimel Stick Poly', '2018-06-04', 7);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Wine - Kwv Chenin Blanc South', '2018-06-27', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Apples - Spartan', '2017-12-22', 10);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Cocktail Napkin Blue', '2017-12-11', 5);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Horseradish Root', '2018-05-21', 4);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Peas - Frozen', '2018-09-12', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Chicken - Whole Fryers', '2017-12-01', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Chocolate - Mi - Amere Semi', '2017-11-11', 3);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Soup Campbells', '2018-10-05', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Wine - Chenin Blanc K.w.v.', '2017-12-05', 5);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Ice Cream - Strawberry', '2017-12-13', 9);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Wine - White, Concha Y Toro', '2018-04-19', 3);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Pork - Bacon Cooked Slcd', '2018-05-28', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Corn Syrup', '2018-10-28', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Napkin - Beverage 1 Ply', '2018-02-14', 10);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Bread - Assorted Rolls', '2018-05-01', 9);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Island Oasis - Banana Daiquiri', '2017-12-13', 7);

insert into product_types (type_name, expiration_date, weight_l_kg) values ('Soup - Campbells Asian Noodle', '2018-02-05', 8);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Syrup - Monin - Blue Curacao', '2017-04-19', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Wooden Mop Handle', '2018-03-09', 3);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Crab - Blue, Frozen', '2017-01-22', 3);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Tomatoes - Vine Ripe, Yellow', '2018-03-06', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Breakfast Quesadillas', '2017-05-17', 5);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Juice - Clam, 46 Oz', '2017-04-17', 9);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Ice Cream - Chocolate', '2017-04-27', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Salmon Steak - Cohoe 8 Oz', '2018-01-31', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Fish - Base, Bouillion', '2018-05-16', 10);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Beef - Short Ribs', '2017-05-12', 10);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Beer - Original Organic Lager', '2017-06-25', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Appetizer - Mango Chevre', '2018-08-19', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Table Cloth 53x69 White', '2017-07-17', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Cod - Fillets', '2018-10-13', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Mushroom - Porcini, Dry', '2017-04-20', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Pastry - Baked Scones - Mini', '2017-05-27', 3);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Oil - Peanut', '2018-08-23', 3);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Cheese - Parmigiano Reggiano', '2018-07-18', 5);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Flax Seed', '2017-01-18', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Coffee - Decaffeinato Coffee', '2018-10-02', 9);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Syrup - Monin - Granny Smith', '2017-10-12', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Pork - Backs - Boneless', '2018-09-28', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Orange - Canned, Mandarin', '2017-01-02', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Appetizer - Mushroom Tart', '2018-10-23', 7);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Shallots', '2017-04-14', 4);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Spring Roll Veg Mini', '2017-07-06', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Eggplant Italian', '2017-04-19', 5);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Sugar - Brown', '2018-06-16', 8);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Caviar - Salmon', '2018-06-27', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Jolt Cola', '2017-02-18', 8);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Sauce - Cranberry', '2017-03-04', 10);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Lamb - Sausage Casings', '2017-01-30', 9);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Vermacelli - Sprinkles, Assorted', '2018-03-04', 5);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Cookie - Oatmeal', '2016-12-20', 7);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Cheese - La Sauvagine', '2017-04-26', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Cumin - Ground', '2017-09-03', 4);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Stock - Beef, White', '2018-04-17', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Magnotta - Bel Paese White', '2018-10-14', 4);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Cookies - Englishbay Oatmeal', '2017-04-04', 3);

insert into product_types (type_name, expiration_date, weight_l_kg) values ('Ecolab - Hobart Upr Prewash Arm', '2018-05-22', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Ecolab - Medallion', '2018-01-01', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Maintenance Removal Charge', '2018-10-18', 5);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Chicken - Base', '2018-08-13', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Peas - Frozen', '2018-06-21', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Mustard - Seed', '2018-04-21', 7);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Container Clear 8 Oz', '2018-08-08', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Wine - Penfolds Koonuga Hill', '2018-06-28', 9);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Milk - Buttermilk', '2017-12-29', 4);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Kolrabi', '2018-07-13', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Broom Handle', '2018-07-12', 8);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Tea - Lemon Green Tea', '2018-05-03', 4);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Cheese - Augre Des Champs', '2018-03-17', 4);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Shrimp - Black Tiger 26/30', '2018-04-07', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Beer - Maudite', '2018-03-05', 9);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Flower - Daisies', '2018-06-11', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Sprite - 355 Ml', '2017-11-08', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Longos - Grilled Chicken With', '2017-11-07', 7);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Nut - Macadamia', '2018-09-05', 10);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Mayonnaise', '2018-04-08', 9);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Corn - On The Cob', '2017-12-27', 7);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Appetizer - Shrimp Puff', '2018-04-21', 3);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Wine - Red, Lurton Merlot De', '2018-05-12', 3);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Bread - Kimel Stick Poly', '2018-06-04', 7);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Wine - Kwv Chenin Blanc South', '2018-06-27', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Apples - Spartan', '2017-12-22', 10);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Cocktail Napkin Blue', '2017-12-11', 5);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Horseradish Root', '2018-05-21', 4);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Peas - Frozen', '2018-09-12', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Chicken - Whole Fryers', '2017-12-01', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Chocolate - Mi - Amere Semi', '2017-11-11', 3);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Soup Campbells', '2018-10-05', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Wine - Chenin Blanc K.w.v.', '2017-12-05', 5);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Ice Cream - Strawberry', '2017-12-13', 9);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Wine - White, Concha Y Toro', '2018-04-19', 3);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Pork - Bacon Cooked Slcd', '2018-05-28', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Corn Syrup', '2018-10-28', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Napkin - Beverage 1 Ply', '2018-02-14', 10);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Bread - Assorted Rolls', '2018-05-01', 9);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Island Oasis - Banana Daiquiri', '2017-12-13', 7);

insert into product_types (type_name, expiration_date, weight_l_kg) values ('Soup - Campbells Asian Noodle', '2018-02-05', 8);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Syrup - Monin - Blue Curacao', '2017-04-19', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Wooden Mop Handle', '2018-03-09', 3);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Crab - Blue, Frozen', '2017-01-22', 3);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Tomatoes - Vine Ripe, Yellow', '2018-03-06', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Breakfast Quesadillas', '2017-05-17', 5);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Juice - Clam, 46 Oz', '2017-04-17', 9);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Ice Cream - Chocolate', '2017-04-27', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Salmon Steak - Cohoe 8 Oz', '2018-01-31', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Fish - Base, Bouillion', '2018-05-16', 10);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Beef - Short Ribs', '2017-05-12', 10);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Beer - Original Organic Lager', '2017-06-25', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Appetizer - Mango Chevre', '2018-08-19', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Table Cloth 53x69 White', '2017-07-17', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Cod - Fillets', '2018-10-13', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Mushroom - Porcini, Dry', '2017-04-20', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Pastry - Baked Scones - Mini', '2017-05-27', 3);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Oil - Peanut', '2018-08-23', 3);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Cheese - Parmigiano Reggiano', '2018-07-18', 5);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Flax Seed', '2017-01-18', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Coffee - Decaffeinato Coffee', '2018-10-02', 9);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Syrup - Monin - Granny Smith', '2017-10-12', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Pork - Backs - Boneless', '2018-09-28', 1);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Orange - Canned, Mandarin', '2017-01-02', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Appetizer - Mushroom Tart', '2018-10-23', 7);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Shallots', '2017-04-14', 4);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Spring Roll Veg Mini', '2017-07-06', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Eggplant Italian', '2017-04-19', 5);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Sugar - Brown', '2018-06-16', 8);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Caviar - Salmon', '2018-06-27', 2);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Jolt Cola', '2017-02-18', 8);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Sauce - Cranberry', '2017-03-04', 10);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Lamb - Sausage Casings', '2017-01-30', 9);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Vermacelli - Sprinkles, Assorted', '2018-03-04', 5);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Cookie - Oatmeal', '2016-12-20', 7);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Cheese - La Sauvagine', '2017-04-26', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Cumin - Ground', '2017-09-03', 4);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Stock - Beef, White', '2018-04-17', 6);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Magnotta - Bel Paese White', '2018-10-14', 4);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Cookies - Englishbay Oatmeal', '2017-04-04', 3);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Magnotta - Bel Paese White', '2018-10-14', 4);
insert into product_types (type_name, expiration_date, weight_l_kg) values ('Cookies - Englishbay Oatmeal', '2017-04-04', 3);






insert into products (name, price, amount_of_sale, date_of_sale) values ('Cheese - Brie, Triple Creme', '$444.30', 8, '2021-10-13');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Cheese - Sheep Milk', '$228.76', 5, '2021-07-22');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Tart Shells - Savory, 2', '$53.82', 10, '2021-04-11');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Pepper - Sorrano', '$30.31', 5, '2021-10-25');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Beef - Top Butt', '$140.75', 5, '2020-12-19');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Tea - Herbal - 6 Asst', '$398.43', 8, '2021-06-02');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Cheese - Pont Couvert', '$174.89', 2, '2021-11-30');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Sprouts - Pea', '$251.83', 6, '2021-01-17');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Lettuce - Escarole', '$120.47', 8, '2021-01-19');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Wine - German Riesling', '$15.30', 5, '2021-04-25');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Spring Roll Veg Mini', '$39.71', 9, '2021-01-02');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Nestea - Iced Tea', '$292.33', 3, '2021-02-01');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Chinese Foods - Thick Noodles', '$270.35', 10, '2021-05-02');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Beer - Upper Canada Light', '$398.88', 10, '2021-09-19');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Spinach - Spinach Leaf', '$423.91', 3, '2021-09-07');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Miso - Soy Bean Paste', '$487.18', 9, '2021-08-22');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Potatoes - Idaho 100 Count', '$5.37', 6, '2021-01-25');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Milk - Chocolate 250 Ml', '$148.35', 1, '2021-10-15');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Cleaner - Comet', '$306.50', 9, '2021-07-07');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Filter - Coffee', '$287.88', 10, '2021-06-03');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Venison - Racks Frenched', '$192.22', 6, '2021-04-08');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Turkey - Oven Roast Breast', '$180.83', 2, '2021-11-19');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Tomato Puree', '$284.68', 1, '2021-02-20');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Milk - 2%', '$116.03', 10, '2021-02-19');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Nantucket Cranberry Juice', '$21.57', 8, '2021-11-01');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Pasta - Cappellini, Dry', '$190.01', 7, '2021-09-30');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Veal - Kidney', '$297.18', 2, '2020-12-14');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Daikon Radish', '$14.59', 5, '2021-04-16');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Wooden Mop Handle', '$304.45', 10, '2021-07-29');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Nantucket - Kiwi Berry Cktl.', '$441.59', 10, '2021-07-20');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Compound - Orange', '$59.22', 6, '2021-01-06');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Cookies Oatmeal Raisin', '$46.02', 10, '2021-07-13');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Stock - Beef, White', '$22.10', 9, '2021-10-22');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Puree - Mocha', '$11.71', 9, '2021-06-24');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Sage - Rubbed', '$432.00', 5, '2021-09-02');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Pepper - Chillies, Crushed', '$481.43', 2, '2021-05-28');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Celery Root', '$467.34', 3, '2021-09-27');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Tea - Green', '$442.79', 2, '2020-12-06');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Juice - Clamato, 341 Ml', '$456.01', 10, '2021-05-31');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Cloves - Ground', '$253.45', 9, '2021-02-09');


insert into products (name, price, amount_of_sale, date_of_sale) values ('Cheese', '$444.30', 8, '2021-10-13');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Cheese', '$228.76', 5, '2021-07-22');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Tart Shells, 2', '$53.82', 10, '2021-04-11');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Pepper', '$30.31', 5, '2021-10-25');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Beef', '$140.75', 5, '2020-12-19');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Tea - Herbal ', '$398.43', 8, '2021-06-02');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Cheese', '$174.89', 2, '2021-11-30');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Sprouts', '$251.83', 6, '2021-01-17');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Lettuce', '$120.47', 8, '2021-01-19');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Wine - German Riesling', '$15.30', 5, '2021-04-25');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Spring Roll', '$39.71', 9, '2021-01-02');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Nestea', '$292.33', 3, '2021-02-01');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Thick Noodles', '$270.35', 10, '2021-05-02');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Upper Canada Light', '$398.88', 10, '2021-09-19');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Spinach Leaf', '$423.91', 3, '2021-09-07');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Soy Bean Paste', '$487.18', 9, '2021-08-22');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Idaho 100 Count', '$5.37', 6, '2021-01-25');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Milk', '$148.35', 1, '2021-10-15');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Cleaner', '$306.50', 9, '2021-07-07');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Coffee', '$287.88', 10, '2021-06-03');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Venison', '$192.22', 6, '2021-04-08');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Turkey', '$180.83', 2, '2021-11-19');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Tomato', '$284.68', 1, '2021-02-20');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Milk', '$116.03', 10, '2021-02-19');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Nantucket Juice', '$21.57', 8, '2021-11-01');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Pasta', '$190.01', 7, '2021-09-30');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Veal', '$297.18', 2, '2020-12-14');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Radish', '$14.59', 5, '2021-04-16');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Handle', '$304.45', 10, '2021-07-29');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Nantucket', '$441.59', 10, '2021-07-20');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Orange', '$59.22', 6, '2021-01-06');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Cookies', '$46.02', 10, '2021-07-13');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Stock', '$22.10', 9, '2021-10-22');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Puree', '$11.71', 9, '2021-06-24');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Sage', '$432.00', 5, '2021-09-02');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Pepper', '$481.43', 2, '2021-05-28');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Celery ', '$467.34', 3, '2021-09-27');
insert into products (name, price, amount_of_sale, date_of_sale) values ('TeaGreen', '$442.79', 2, '2020-12-06');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Clamato, 341 Ml', '$456.01', 10, '2021-05-31');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Cloves Ground', '$253.45', 9, '2021-02-09');

insert into products (name, price, amount_of_sale, date_of_sale) values ('Table Cloth', '$140.20', 6, '2020-01-03');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Wine', '$25.15', 5, '2020-03-07');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Table salt', '$140.20', 6, '2020-01-03');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Red Wine', '$25.15', 5, '2020-03-07');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Pastry', '$632.73', 5, '2019-10-03');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Coffee', '$457.80', 8, '2020-04-16');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Lamb Rack', '$234.47', 8, '2020-08-03');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Tomatoes', '$415.82', 9, '2021-11-10');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Tomato Puree', '$164.63', 7, '2021-01-22');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Beef', '$146.74', 5, '2019-01-02');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Yeast', '$73.70', 2, '2021-10-09');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Muffin Hinge', '$280.52', 2, '2019-08-26');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Salt', '$140.20', 6, '2020-01-03');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Beer', '$25.15', 5, '2020-03-07');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Cola', '$632.73', 5, '2019-10-03');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Tea', '$457.80', 8, '2020-04-16');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Chicken', '$234.47', 8, '2020-08-03');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Potatoes', '$415.82', 9, '2021-11-10');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Apples', '$164.63', 7, '2021-01-22');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Grapes', '$146.74', 5, '2019-01-02');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Melons', '$73.70', 2, '2021-10-09');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Watermelons', '$280.52', 2, '2019-08-26');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Table Cloth', '$140.20', 6, '2020-01-03');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Wine', '$25.15', 5, '2020-03-07');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Pastry', '$632.73', 5, '2019-10-03');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Coffee', '$457.80', 8, '2020-04-16');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Lamb Rack', '$234.47', 8, '2020-08-03');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Tomatoes', '$415.82', 9, '2021-11-10');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Tomato Puree', '$164.63', 7, '2021-01-22');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Beef', '$146.74', 5, '2019-01-02');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Yeast', '$73.70', 2, '2021-10-09');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Muffin Hinge', '$280.52', 2, '2019-08-26');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Salt', '$140.20', 6, '2020-01-03');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Beer', '$25.15', 5, '2020-03-07');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Cola', '$632.73', 5, '2019-10-03');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Tea', '$457.80', 8, '2020-04-16');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Chicken', '$234.47', 8, '2020-08-03');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Potatoes', '$415.82', 9, '2021-11-10');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Apples', '$164.63', 7, '2021-01-22');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Grapes', '$146.74', 5, '2019-01-02');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Melons', '$73.70', 2, '2021-10-09');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Watermelon', '$280.52', 2, '2019-08-26');

insert into products (name, price, amount_of_sale, date_of_sale) values ('Cheese', '$444.30', 8, '2021-10-13');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Cheese', '$228.76', 5, '2021-07-22');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Tart Shells, 2', '$53.82', 10, '2021-04-11');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Pepper', '$30.31', 5, '2021-10-25');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Beef', '$140.75', 5, '2020-12-19');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Tea - Herbal ', '$398.43', 8, '2021-06-02');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Cheese', '$174.89', 2, '2021-11-30');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Sprouts', '$251.83', 6, '2021-01-17');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Lettuce', '$120.47', 8, '2021-01-19');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Wine - German Riesling', '$15.30', 5, '2021-04-25');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Spring Roll', '$39.71', 9, '2021-01-02');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Nestea', '$292.33', 3, '2021-02-01');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Thick Noodles', '$270.35', 10, '2021-05-02');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Upper Canada Light', '$398.88', 10, '2021-09-19');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Spinach Leaf', '$423.91', 3, '2021-09-07');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Soy Bean Paste', '$487.18', 9, '2021-08-22');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Idaho 100 Count', '$5.37', 6, '2021-01-25');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Milk', '$148.35', 1, '2021-10-15');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Cleaner', '$306.50', 9, '2021-07-07');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Coffee', '$287.88', 10, '2021-06-03');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Venison', '$192.22', 6, '2021-04-08');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Turkey', '$180.83', 2, '2021-11-19');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Tomato', '$284.68', 1, '2021-02-20');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Milk', '$116.03', 10, '2021-02-19');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Nantucket Juice', '$21.57', 8, '2021-11-01');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Pasta', '$190.01', 7, '2021-09-30');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Veal', '$297.18', 2, '2020-12-14');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Radish', '$14.59', 5, '2021-04-16');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Handle', '$304.45', 10, '2021-07-29');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Nantucket', '$441.59', 10, '2021-07-20');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Orange', '$59.22', 6, '2021-01-06');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Cookies', '$46.02', 10, '2021-07-13');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Stock', '$22.10', 9, '2021-10-22');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Puree', '$11.71', 9, '2021-06-24');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Sage', '$432.00', 5, '2021-09-02');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Pepper', '$481.43', 2, '2021-05-28');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Celery ', '$467.34', 3, '2021-09-27');
insert into products (name, price, amount_of_sale, date_of_sale) values ('TeaGreen', '$442.79', 2, '2020-12-06');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Clamato, 341 Ml', '$456.01', 10, '2021-05-31');
insert into products (name, price, amount_of_sale, date_of_sale) values ('Cloves Ground', '$253.45', 9, '2021-02-09');

insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-09-27', 'Potatoes - Fingerling 4 Oz', 19, '$312.57');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-06-17', 'Gingerale - Diet - Schweppes', 3, '$592.69');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-02', 'Cheese - La Sauvagine', 16, '$574.58');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-03-04', 'Cheese - Victor Et Berthold', 5, '$242.88');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-08-13', 'Wine - Merlot Vina Carmen', 6, '$970.59');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-13', 'Pepper Squash', 10, '$696.71');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-04-26', 'Trout - Smoked', 10, '$282.90');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-08-08', 'Piping - Bags Quizna', 12, '$328.34');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-10-23', 'Chef Hat 20cm', 8, '$827.57');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-07-22', 'Foam Cup 6 Oz', 14, '$591.21');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-02-06', 'Rice Paper', 1, '$371.98');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-16', 'Beef - Kobe Striploin', 16, '$764.69');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-04-26', 'Pea - Snow', 17, '$193.89');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-11', 'Tomatoes - Heirloom', 18, '$680.96');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-07-06', 'Turkey Tenderloin Frozen', 17, '$50.79');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-01-31', 'Baking Soda', 6, '$981.94');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-07-19', 'Yogurt - Banana, 175 Gr', 7, '$720.82');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-06-23', 'Shrimp - Black Tiger 8 - 12', 10, '$822.76');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-04-10', 'Bagel - Ched Chs Presliced', 2, '$112.01');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-16', 'Lamb - Shoulder, Boneless', 2, '$502.06');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-18', 'Puff Pastry - Slab', 18, '$285.37');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-01-03', 'Wine - Jaboulet Cotes Du Rhone', 15, '$731.95');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-11-14', 'Chick Peas - Dried', 12, '$54.03');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-04-09', 'Cheese - Marble', 13, '$12.03');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-04-02', 'English Muffin', 10, '$658.81');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2020-12-12', 'Beer - Rickards Red', 12, '$819.01');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-28', 'Pineapple - Canned, Rings', 4, '$357.52');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-29', 'Beer - Maudite', 9, '$222.58');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-11-27', 'Milk Powder', 2, '$742.34');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-07-10', 'Ecolab - Hobart Washarm End Cap', 5, '$660.92');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-09-15', 'Flour Pastry Super Fine', 16, '$257.08');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-09-29', 'Bar Energy Chocchip', 18, '$746.12');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-09-11', 'Juice - Orangina', 2, '$234.50');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-09-09', 'Shopper Bag - S - 4', 6, '$426.77');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-04-08', 'Syrup - Kahlua Chocolate', 6, '$738.79');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-09-09', 'Bar Mix - Pina Colada, 355 Ml', 7, '$840.04');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-06-15', 'Sprouts - Alfalfa', 9, '$258.90');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-03-25', 'Cheese - Mix', 16, '$709.40');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-08-06', 'Lemons', 17, '$678.26');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-01-17', 'Wine - Two Oceans Sauvignon', 2, '$358.05');


insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-09-27', 'Potatoes - Fingerling 4 Oz', 19, '$312.57');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-06-17', 'Gingerale - Diet - Schweppes', 3, '$592.69');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-02', 'Cheese - La Sauvagine', 16, '$574.58');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-03-04', 'Cheese - Victor Et Berthold', 5, '$242.88');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-08-13', 'Wine - Merlot Vina Carmen', 6, '$970.59');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-13', 'Pepper Squash', 10, '$696.71');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-04-26', 'Trout - Smoked', 10, '$282.90');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-08-08', 'Piping - Bags Quizna', 12, '$328.34');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-10-23', 'Chef Hat 20cm', 8, '$827.57');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-07-22', 'Foam Cup 6 Oz', 14, '$591.21');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-02-06', 'Rice Paper', 1, '$371.98');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-16', 'Beef - Kobe Striploin', 16, '$764.69');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-04-26', 'Pea - Snow', 17, '$193.89');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-11', 'Tomatoes - Heirloom', 18, '$680.96');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-07-06', 'Turkey Tenderloin Frozen', 17, '$50.79');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-01-31', 'Baking Soda', 6, '$981.94');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-07-19', 'Yogurt - Banana, 175 Gr', 7, '$720.82');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-06-23', 'Shrimp - Black Tiger 8 - 12', 10, '$822.76');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-04-10', 'Bagel - Ched Chs Presliced', 2, '$112.01');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-16', 'Lamb - Shoulder, Boneless', 2, '$502.06');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-18', 'Puff Pastry - Slab', 18, '$285.37');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-01-03', 'Wine - Jaboulet Cotes Du Rhone', 15, '$731.95');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-11-14', 'Chick Peas - Dried', 12, '$54.03');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-04-09', 'Cheese - Marble', 13, '$12.03');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-04-02', 'English Muffin', 10, '$658.81');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2020-12-12', 'Beer - Rickards Red', 12, '$819.01');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-28', 'Pineapple - Canned, Rings', 4, '$357.52');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-29', 'Beer - Maudite', 9, '$222.58');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-11-27', 'Milk Powder', 2, '$742.34');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-07-10', 'Ecolab - Hobart Washarm End Cap', 5, '$660.92');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-09-15', 'Flour Pastry Super Fine', 16, '$257.08');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-09-29', 'Bar Energy Chocchip', 18, '$746.12');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-09-11', 'Juice - Orangina', 2, '$234.50');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-09-09', 'Shopper Bag - S - 4', 6, '$426.77');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-04-08', 'Syrup - Kahlua Chocolate', 6, '$738.79');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-09-09', 'Bar Mix - Pina Colada, 355 Ml', 7, '$840.04');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-06-15', 'Sprouts - Alfalfa', 9, '$258.90');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-03-25', 'Cheese - Mix', 16, '$709.40');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-08-06', 'Lemons', 17, '$678.26');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-01-17', 'Wine - Two Oceans Sauvignon', 2, '$358.05');

insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-09-27', 'Potatoes - Fingerling 4 Oz', 19, '$312.57');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-06-17', 'Gingerale', 3, '$592.69');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-02', 'Cheese - La Sauvagine', 16, '$574.58');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-03-04', 'Cheese - Victor Et Berthold', 5, '$242.88');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-08-13', 'Wine - Merlot Vina Carmen', 6, '$970.59');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-13', 'Pepper Squash', 10, '$696.71');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-04-26', 'Trout - Smoked', 10, '$282.90');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-08-08', 'Piping - Bags Quizna', 12, '$328.34');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-10-23', 'Chef Hat 20cm', 8, '$827.57');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-07-22', 'Foam Cup 6 Oz', 14, '$591.21');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-02-06', 'Rice Paper', 1, '$371.98');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-16', 'Beef - Kobe Striploin', 16, '$764.69');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-04-26', 'Pea - Snow', 17, '$193.89');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-11', 'Tomatoes - Heirloom', 18, '$680.96');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-07-06', 'Turkey Tenderloin Frozen', 17, '$50.79');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-01-31', 'Baking Soda', 6, '$981.94');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-07-19', 'Yogurt - Banana, 175 Gr', 7, '$720.82');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-06-23', 'Shrimp - Black Tiger 8 - 12', 10, '$822.76');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-04-10', 'Bagel - Ched Chs Presliced', 2, '$112.01');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-16', 'Lamb - Shoulder, Boneless', 2, '$502.06');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-18', 'Puff Pastry - Slab', 18, '$285.37');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-01-03', 'Wine - Jaboulet Cotes Du Rhone', 15, '$731.95');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-11-14', 'Chick Peas - Dried', 12, '$54.03');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-04-09', 'Cheese - Marble', 13, '$12.03');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-04-02', 'English Muffin', 10, '$658.81');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2020-12-12', 'Beer - Rickards Red', 12, '$819.01');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-28', 'Pineapple - Canned, Rings', 4, '$357.52');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-05-29', 'Beer - Maudite', 9, '$222.58');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-11-27', 'Milk Powder', 2, '$742.34');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-07-10', 'Ecolab - Hobart Washarm End Cap', 5, '$660.92');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-09-15', 'Flour Pastry Super Fine', 16, '$257.08');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-09-29', 'Bar Energy Chocchip', 18, '$746.12');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-09-11', 'Juice - Orangina', 2, '$234.50');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-09-09', 'Shopper Bag - S - 4', 6, '$426.77');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-04-08', 'Syrup - Kahlua Chocolate', 6, '$738.79');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-09-09', 'Bar Mix - Pina Colada, 355 Ml', 7, '$840.04');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-06-15', 'Sprouts - Alfalfa', 9, '$258.90');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-03-25', 'Cheese - Mix', 16, '$709.40');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-08-06', 'Lemons', 17, '$678.26');
insert into purchases (date_of_purchase, pur_products, pur_products_amount, pur_sum) values ('2021-01-17', 'Wine - Two Oceans Sauvignon', 2, '$358.05');





insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Marie', 'Woolsey', '78299872');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Berenice', 'Killerby', '47257248');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Mortie', 'Sibbering', '59886038');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Stephine', 'Harnor', '52560848');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Blondell', 'Millyard', '68716704');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Mycah', 'Jaquest', '83088176');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Jacquie', 'Van Brug', '94818697');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Brianna', 'Kirkness', '66297715');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Georgie', 'Drewry', '29286383');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Claudine', 'Casina', '75582114');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Westley', 'Pogg', '75798519');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Emeline', 'Fenkel', '98705594');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Dougie', 'Asch', '31723784');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Glenna', 'Catcheside', '16279763');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Carver', 'Colecrough', '32519293');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Devon', 'Songhurst', '51594599');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Alister', 'Basnett', '83453091');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Feliza', 'Wallach', '93994786');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Hagen', 'Trumble', '97051816');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Timofei', 'Stanbridge', '21413341');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Tobiah', 'Geibel', '11379832');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Maryanne', 'Weed', '86814511');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Ramonda', 'Spirit', '72625187');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Jenine', 'Nono', '83743400');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Monro', 'Bedham', '14686145');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Tallulah', 'Holdren', '48897743');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Amelia', 'Willmetts', '94005781');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Wrennie', 'Everit', '35301160');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Hartley', 'Killough', '44243313');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Nevil', 'Wilmot', '55512652');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Flemming', 'Beevers', '85016910');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Electra', 'McAlpine', '78565201');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Diandra', 'Bloggett', '15398647');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Christin', 'Aldins', '26800965');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Gwendolyn', 'Quick', '89594669');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Norman', 'Epdell', '79279570');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Waylin', 'Droghan', '41476081');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Sheri', 'Whetnall', '37446194');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Brocky', 'Herculeson', '58298809');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Garvin', 'Dymick', '59749075');

insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Marie', 'Woolsey', '78299872');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Berenice', 'Killerby', '47257248');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Mortie', 'Sibbering', '59886038');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Stephine', 'Harnor', '52560848');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Blondell', 'Millyard', '68716704');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Mycah', 'Jaquest', '83088176');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Jacquie', 'Van Brug', '94818697');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Brianna', 'Kirkness', '66297715');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Georgie', 'Drewry', '29286383');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Claudine', 'Casina', '75582114');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Westley', 'Pogg', '75798519');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Emeline', 'Fenkel', '98705594');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Dougie', 'Asch', '31723784');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Glenna', 'Catcheside', '16279763');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Carver', 'Colecrough', '32519293');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Devon', 'Songhurst', '51594599');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Alister', 'Basnett', '83453091');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Feliza', 'Wallach', '93994786');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Hagen', 'Trumble', '97051816');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Timofei', 'Stanbridge', '21413341');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Tobiah', 'Geibel', '11379832');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Maryanne', 'Weed', '86814511');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Ramonda', 'Spirit', '72625187');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Jenine', 'Nono', '83743400');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Monro', 'Bedham', '14686145');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Tallulah', 'Holdren', '48897743');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Amelia', 'Willmetts', '94005781');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Wrennie', 'Everit', '35301160');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Hartley', 'Killough', '44243313');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Nevil', 'Wilmot', '55512652');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Flemming', 'Beevers', '85016910');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Electra', 'McAlpine', '78565201');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Diandra', 'Bloggett', '15398647');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Christin', 'Aldins', '26800965');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Gwendolyn', 'Quick', '89594669');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Norman', 'Epdell', '79279570');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Waylin', 'Droghan', '41476081');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Sheri', 'Whetnall', '37446194');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Brocky', 'Herculeson', '58298809');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Garvin', 'Dymick', '59749075');

insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Marie', 'Woolsey', '78299872');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Berenice', 'Killerby', '47257248');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Mortie', 'Sibbering', '59886038');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Stephine', 'Harnor', '52560848');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Blondell', 'Millyard', '68716704');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Mycah', 'Jaquest', '83088176');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Jacquie', 'Van Brug', '94818697');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Brianna', 'Kirkness', '66297715');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Georgie', 'Drewry', '29286383');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Claudine', 'Casina', '75582114');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Westley', 'Pogg', '75798519');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Emeline', 'Fenkel', '98705594');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Dougie', 'Asch', '31723784');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Glenna', 'Catcheside', '16279763');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Carver', 'Colecrough', '32519293');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Devon', 'Songhurst', '51594599');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Alister', 'Basnett', '83453091');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Feliza', 'Wallach', '93994786');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Hagen', 'Trumble', '97051816');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Timofei', 'Stanbridge', '21413341');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Tobiah', 'Geibel', '11379832');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Maryanne', 'Weed', '86814511');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Ramonda', 'Spirit', '72625187');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Jenine', 'Nono', '83743400');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Monro', 'Bedham', '14686145');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Tallulah', 'Holdren', '48897743');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Amelia', 'Willmetts', '94005781');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Wrennie', 'Everit', '35301160');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Hartley', 'Killough', '44243313');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Nevil', 'Wilmot', '55512652');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Flemming', 'Beevers', '85016910');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Electra', 'McAlpine', '78565201');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Diandra', 'Bloggett', '15398647');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Christin', 'Aldins', '26800965');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Gwendolyn', 'Quick', '89594669');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Norman', 'Epdell', '79279570');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Waylin', 'Droghan', '41476081');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Sheri', 'Whetnall', '37446194');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Brocky', 'Herculeson', '58298809');
insert into customers (cus_first_name, cus_last_name, cus_phone_number) values ('Garvin', 'Dymick', '59749075');







insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Bentlee', 'Sproule', '626', '25692167');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Fara', 'Delooze', 'Santa Fe', '51938780');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Giacomo', 'Donaghie', 'Capri', '93392172');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Yancey', 'Egdell', 'Galant', '55786520');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Boycey', 'Stenett', 'Ram 2500', '74052683');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Sigismundo', 'Hayes', 'Sequoia', '85619846');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Joyce', 'Corss', 'Town & Country', '79564289');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Laurie', 'Isham', 'Celica', '44289013');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Petunia', 'Cory', 'Quest', '26879587');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Ofella', 'Barnson', 'Ram Van 2500', '10671831');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Neddie', 'Moline', 'Q5', '91520661');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Amil', 'Eliasson', 'Stratus', '91591455');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Doralia', 'Halvosen', '500SL', '17431046');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Irma', 'Bendare', 'Mirage', '31214465');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Jordon', 'Covotto', 'Sunfire', '87665943');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Efrem', 'Giraldo', 'G', '18919002');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Rafaello', 'Rockhill', 'LSS', '15342642');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Trumaine', 'Phoenix', 'E-Class', '28643313');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Donnie', 'Greatham', 'CLS-Class', '73358700');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Isabeau', 'Extill', 'MR2', '52110143');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Bruce', 'Worstall', 'Club Wagon', '59316228');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Lynea', 'Lenz', 'Express 3500', '24585685');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Erica', 'Treby', 'Rodeo Sport', '73242484');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Glyn', 'Oxford', 'Ram 3500', '79481853');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Jabez', 'Blazynski', 'Accord', '41025829');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Zorah', 'Claridge', '6000', '91950004');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Robb', 'Foddy', 'G', '32548937');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Berna', 'Bumford', 'Sunfire', '15569985');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Pancho', 'Tisor', 'Grand Vitara', '53964996');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Missie', 'Roots', 'Roadmaster', '74635698');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Raoul', 'Treadaway', '300CE', '21405593');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Lock', 'Miche', 'Quest', '10114692');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Vina', 'Luney', 'xB', '76466147');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Mata', 'MacCorley', 'Blazer', '49188936');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Reuven', 'Hawking', 'G37', '66471318');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Danita', 'Laurenty', 'G35', '51880165');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Tedi', 'Calderon', 'Corvette', '92953612');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Algernon', 'Iston', 'CLK-Class', '34916918');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Fania', 'Arkley', 'Corvette', '92420709');
insert into vendors (vendor_first_name, vendor_last_name, vendor_method, vendor_phone_number) values ('Desiri', 'Tunbridge', 'Forenza', '85773976');







insert into brands (brand_name) values ('Holdlamis');
insert into brands (brand_name) values ('Andalax');
insert into brands (brand_name) values ('Quo Lux');
insert into brands (brand_name) values ('Tin');
insert into brands (brand_name) values ('Fintone');
insert into brands (brand_name) values ('Holdlamis');
insert into brands (brand_name) values ('Cardguard');
insert into brands (brand_name) values ('Konklab');
insert into brands (brand_name) values ('Wrapsafe');
insert into brands (brand_name) values ('Prodder');
insert into brands (brand_name) values ('Tampflex');
insert into brands (brand_name) values ('Rank');
insert into brands (brand_name) values ('Hatity');
insert into brands (brand_name) values ('Greenlam');
insert into brands (brand_name) values ('Biodex');
insert into brands (brand_name) values ('Solarbreeze');
insert into brands (brand_name) values ('Hatity');
insert into brands (brand_name) values ('Sonair');
insert into brands (brand_name) values ('Kanlam');
insert into brands (brand_name) values ('Latlux');
insert into brands (brand_name) values ('Ronstring');
insert into brands (brand_name) values ('Stringtough');
insert into brands (brand_name) values ('Temp');
insert into brands (brand_name) values ('Job');
insert into brands (brand_name) values ('Y-find');
insert into brands (brand_name) values ('Duobam');
insert into brands (brand_name) values ('Bigtax');
insert into brands (brand_name) values ('Temp');
insert into brands (brand_name) values ('Voyatouch');
insert into brands (brand_name) values ('Ronstring');
insert into brands (brand_name) values ('Latlux');
insert into brands (brand_name) values ('Veribet');
insert into brands (brand_name) values ('Bigtax');
insert into brands (brand_name) values ('Ronstring');
insert into brands (brand_name) values ('Span');
insert into brands (brand_name) values ('Hatity');
insert into brands (brand_name) values ('Subin');
insert into brands (brand_name) values ('Bytecard');
insert into brands (brand_name) values ('Matsoft');
insert into brands (brand_name) values ('Stronghold');



insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1', 'California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2', 'Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum5','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum5','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum5','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum5','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum5','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum5','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','Georgia', 6);



insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1', 'California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2', 'Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum5','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum5','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum5','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum5','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum5','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum5','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','Georgia', 6);

insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1', 'California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2', 'Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum5','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum5','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum5','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum5','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum5','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum5','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum3','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','Georgia', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','California', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','Massachusetts', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum1','Tennessee', 8);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum4','Michigan', 6);
insert into stores (store_name, store_state, store_open_hour_am) values ('Magnum2','Georgia', 6);





insert into enterprise(enterprise_name, CEO_name, address, office_phone_number) values ('MAGNUM', 'DIANA RUZI', 'Tole bi 1', '3843872')


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