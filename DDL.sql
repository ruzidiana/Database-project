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
