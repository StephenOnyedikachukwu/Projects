-- we have realized that your business information has not been updated in a number of years.
-- In order to accurately assess the risk and approve your policy renewal, we will need you to provide all of the following information from the mavenmovies.

-- 1. We will need a list of all staff members, including their first and last names, email addresses, and the store
-- identification number where they work.
use mavenmovies;

select first_name, last_name, email, store_id from staff;

-- 2. We will need separate counts of inventory items held at each of your two stores.
select count(inventory_id) store_1_inventory_count from inventory where store_id =1;
select count(inventory_id) store_2_inventory_count from inventory where store_id =2;

-- 3. We will need a count of active customers for each of your stores. Separately, please.
select count(active) store_1_active_customers from customer where store_id =1;
select count(active) store_2_active_customers from customer where store_id =2;

-- 4. In order to assess the liability of a data breach, we will need you to provide a count of all customer email
-- addresses stored in the database.
select count(email) customers_email from customer;

-- 5. We are interested in how diverse your film offering is as a means of understanding how likely you are to
-- keep customers engaged in the future. Please provide a count of unique film titles you have in inventory at
-- each store and then provide a count of the unique categories of films you provide.
select count(distinct title) unique_titles from film f left join inventory i on i.film_id=f.film_id where store_id=1;
select count(distinct title) unique_titles from film f left join inventory i on i.film_id=f.film_id where store_id=2;

select count(distinct category_id) unique_category from film_category;
-- 6. We would like to understand the replacement cost of your films. Please provide the replacement cost for the
-- film that is least expensive to replace, the most expensive to replace, and the average of all films you carry.
select min(replacement_cost), max(replacement_cost), round(avg(replacement_cost),2) average_replacement_cost from film;

-- 7. We are interested in having you put payment monitoring systems and maximum payment processing
-- restrictions in place in order to minimize the future risk of fraud by your staff. Please provide the average
-- payment you process, as well as the maximum payment you have processed.
select round(avg(amount),2) average_payment, max(amount) max_payment from payment;

-- 8. We would like to better understand what your customer base looks like. Please provide a list of all customer
-- identification values, with a count of rentals they have made all-time, with your highest volume customers at
-- the top of the list.
select customer_id, count(rental_id) rental_count from rental group by customer_id order by rental_count desc;
 