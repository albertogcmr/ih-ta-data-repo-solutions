use lab_mysql;
    
-- seeding cars     
	
INSERT INTO 
	cars (id_car, VIN,  manufacturer, model, year, color ) 
VALUES
	(0, 	'3K096I98581DHSNUP',  	'Volkswagen',  	'Tiguan',  	2019, 	'Blue'),
	(1, 	'3K096I98581DHSNUP',  	'Volkswagen',  	'Tiguan',  	2019, 	'Blue'),
	(2, 	'3K096I98581DHSNUP',  	'Volkswagen',  	'Tiguan',  	2019, 	'Blue'),
	(3, 	'3K096I98581DHSNUP',  	'Volkswagen',  	'Tiguan',  	2019, 	'Blue'),
	(4, 	'3K096I98581DHSNUP',  	'Volkswagen',  	'Tiguan',  	2019, 	'Blue'),
	(5, 	'3K096I98581DHSNUP',  	'Volkswagen',  	'Tiguan',  	2019, 	'Blue'),
	(6, 	'3K096I98581DHSNUP',  	'Volkswagen',  	'Tiguan',  	2019, 	'Blue'); 

-- seeding customers     
	
INSERT INTO 
	customers (id_customer , customer_id,  name ,    phone  ,    adress ,    state ,   city,  country,    postal) 
VALUES
	(0, 	'10001', 	'Pablo Picasso' 	,'+34 636 17 63 82' , 	'Paseo de la Chopera, 14', 	'Madrid', 	'Madrid', 	'Spain', 	'28045'), 
    (1,	'20001' 	,'Abraham Lincoln' ,	'+1 305 907 7086'  ,	'120 SW 8th St' ,	'Miami' ,	'Florida' ,	'United States' 	,'33130');
	
