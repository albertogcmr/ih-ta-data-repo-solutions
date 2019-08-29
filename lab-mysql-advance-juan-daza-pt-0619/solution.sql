# First of all, things to keep in mind


# In table sales, a title can appear several times. 

	# 1. The royalties need to be calculated for each sale.

	# 2. Despite a title can have multiple sales records, the advance must be calculated only once for each tit1le.

	# In your eventual solution, you need to sum up the following profits for each individual author:

			#  All advances which is calculated exactly once for each title.

			#  All royalties in each sale.

# Therefore the steps are as follows:

	# 1. Calculate the royalty of each sale for each author.

	# 2. Using the output from Step 1 as a temp table, aggregate the total royalties for each title for each author.

	# 3. Using the output from Step 2 as a temp table, calculate the total profits of each author by aggregating the advances and total royalties of each title.


#### CHALLENGE 1 -- Most Profiting Authors
#### USING DERIVED TABLES

# Calculating the royalties for each title of each author:

SELECT 
		a.au_id id_author
    ,	t.title_id id_title
    ,	(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) sales_royalty
    from publications.authors a
    inner join publications.titleauthor ta on a.au_id = ta.au_id
    inner join publications.titles t on ta.title_id	= t.title_id
    inner join publications.sales s on t.title_id = s.title_id;


# Calculating the aggregate of royalties for each author title:

SELECT 
		temp_table1.id_author
    ,	temp_table1.id_title
    ,	sum(temp_table1.sales_royalty) total_royalty
    FROM
    (SELECT 
		a.au_id id_author
    ,	t.title_id id_title
    ,	(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) sales_royalty
    from publications.authors a
    inner join publications.titleauthor ta on a.au_id = ta.au_id
    inner join publications.titles t on ta.title_id	= t.title_id
    inner join publications.sales s on t.title_id = s.title_id) temp_table1
    group by id_author,id_title
    order by total_royalty desc;

# Calculating the total income as a sum of rolaty + advance

    SELECT 
		temp_table2.id_author
    ,	temp_table2.id_title
    ,	sum(total_royalty + t.advance) total_income
    from publications.authors a
    inner join publications.titleauthor ta on a.au_id = ta.au_id
    inner join publications.titles t on ta.title_id	= t.title_id
    inner join     
    (SELECT 
		temp_table1.id_author
    ,	temp_table1.id_title
    ,	sum(temp_table1.sales_royalty) total_royalty
    FROM
    (SELECT 
		a.au_id id_author
    ,	t.title_id id_title
    ,	(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) sales_royalty
    from publications.authors a
    inner join publications.titleauthor ta on a.au_id = ta.au_id
    inner join publications.titles t on ta.title_id	= t.title_id
    inner join publications.sales s on t.title_id = s.title_id) temp_table1
    group by id_author,id_title
    order by total_royalty desc) temp_table2 on temp_table2.id_author = a.au_id and temp_table2.id_title = t.title_id
    
    group by id_author,id_title
    order by total_income desc;


    ############# WARNING ##############
    #### Here it is assuming that a book is written by more than one author...I am not sure if that makes total sense... 


#### CHALLENGE 2 -- Alternative Solution
#### USING Creating MySQL temporary tables

CREATE TEMPORARY TABLE publications.sales_royalty
SELECT 
		a.au_id id_author
    ,	t.title_id id_title
    ,	(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) sales_royalty
    from publications.authors a
    inner join publications.titleauthor ta on a.au_id = ta.au_id
    inner join publications.titles t on ta.title_id	= t.title_id
    inner join publications.sales s on t.title_id = s.title_id;

CREATE TEMPORARY TABLE publications.total_royalty
SELECT 
		sales_royalty.id_author
    ,	sales_royalty.id_title
    ,	sum(sales_royalty.sales_royalty) total_royalty
    FROM publications.sales_royalty
    group by id_author,id_title
    order by total_royalty desc;

#### CHALLENGE 3 -- Creating permanent table

# First of all we create the table

CREATE TABLE most_profiting_authors (
    au_id VARCHAR(40)     NOT NULL,
    profits  VARCHAR(30) NULL,
    PRIMARY KEY(au_id));

# Secondly we introduce the data into the table

INSERT INTO most_profiting_authors (au_id,profits) values
('722-51-5454',15021.528),
('899-46-2035',17353.132),
('213-46-8915',15162.110),
('846-92-7186',8050.0000),
('427-17-2319',8050.0000),
('672-71-3249',8011.9920),
('267-41-2394',13020.944),
('472-27-2349',8008.9940),
('238-95-7766',7110.1600),
('807-91-6654',7083.8000),
('756-30-7391',7032.3850),
('724-80-9391',12028.720),
('998-72-3567',8363.4560),
('274-80-9391',5029.9850),
('409-56-7008',5017.9910),
('648-92-1872',4033.4600),
('486-29-1786',4019.9750),
('172-32-1176',2029.9850),
('712-45-1867',23.988000);