USE `publications`;


-- challenge 1
    
SELECT
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    titles.title_id AS TITLE,
    publishers.pub_name AS PUBLISHER
FROM 
    authors  
INNER JOIN
    titleauthor
ON
    authors.au_id = titleauthor.au_id
INNER JOIN
    titles
ON
    titleauthor.title_id = titles.title_id
INNER JOIN
    publishers
ON
    titles.pub_id = publishers.pub_id;
    
-- challenge 2
    
SELECT
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    -- titles.title_id AS TITLE,
    count(titles.title_id) AS TOTAL,
    publishers.pub_name AS PUBLISHER
FROM 
    authors  
INNER JOIN
    titleauthor
ON
    authors.au_id = titleauthor.au_id
INNER JOIN
    titles
ON
    titleauthor.title_id = titles.title_id
INNER JOIN
    publishers
ON
    titles.pub_id = publishers.pub_id
GROUP BY
	authors.au_id, publishers.pub_name
ORDER BY 
	count(titles.title_id) DESC
    ;
    
-- Challenge3

SELECT authors.au_id AS 'AUTHOR ID', 
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    sum(sales.qty) AS 'TOTAL SALES'
FROM authors
INNER JOIN titleauthor
	ON  authors.au_id = titleauthor.au_id
INNER JOIN sales
	ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC
LIMIT 3;
        
-- challenge 4 
-- cambiar inner por left para que resulte NULLS y luego coalesce()

SELECT authors.au_id AS 'AUTHOR ID', 
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    COALESCE(sum(sales.qty), 0) AS 'TOTAL SALES'
FROM authors
LEFT JOIN titleauthor
	ON  authors.au_id = titleauthor.au_id
LEFT JOIN sales
	ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC
LIMIT 23;
