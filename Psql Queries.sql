
--- Walmart project Queries
CREATE TABLE walmart (
    invoice_id SERIAL PRIMARY KEY,
    branch TEXT,
    city TEXT,
    category TEXT,
    unit_price NUMERIC(10, 2),
    quantity INTEGER,
    date DATE,
    time TIME,
    payment_method TEXT,
    rating NUMERIC(3, 1),
    profit_margin NUMERIC(4, 2)
);


select * from walmart;

ALTER TABLE walmart DROP CONSTRAINT walmart_pkey;

select count(*) from walmart

-- removing null values

DELETE FROM walmart
WHERE invoice_id IS NULL
   OR branch IS NULL
   OR city IS NULL
   OR category IS NULL
   OR unit_price IS NULL
   OR quantity IS NULL
   OR date IS NULL
   OR time IS NULL
   OR payment_method IS NULL
   OR rating IS NULL
   OR profit_margin IS NULL;


-- now check the total transactions

select count(*) from walmart


--payment methods

SELECT payment_method,
COUNT(*) as total_transaction
FROM walmart
GROUP BY payment_method



-- Selecting Distinct Branches

select 
count(distinct(branch))
from walmart

-- Minmuma quantity

select min(quantity)
from walmart

-- max
select max(quantity)
from walmart




- -------------------------------	Business Problems	------------------------
--Q.1 Find different payment method and number of transactions, number of qty sold?



SELECT payment_method,
COUNT(*) as total_transaction,
sum(quantity) as no_of_quantites

FROM walmart
GROUP BY 1



-----Question #2
-- Identify the highest-rated category in each branch, displaying the branch, category..??

--- AVG Rating
select
*
from(
SELECT 
		branch,
		category,
		AVG(rating) as avg_rating,
		RANK() OVER(PARTITION BY branch ORDER BY AVG(rating) DESC) as rank
	FROM walmart
	GROUP BY 1, 2
) 
where rank =1;



---Q.3 Identify the busiest day for each branch based on the number of transactions??--------------------------




