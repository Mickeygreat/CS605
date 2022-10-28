/* Phase 4 - Answer to Business Analytical Questions */
/* Team # 10 */

/* Participating member names: Mickey Yeh, Linjin Yuan, Aimee Marmol */
/* Team Leader Name: Mickey Yeh */

/* SQL Answer to Question 1*/ 
/* Question 1 Comment */
/* Place SQL below */

Select count(restaurantid) as "Number of Restaurants", country as "Country"
from restaurant
group by country;


/* SQL Answer to Question 2 */ 
/* Question 2 Comment */
/* Place SQL below */

select count(recipe.recipeid) as "Number of Recipes", count(restaurant.restaurantid) as "Number of Restaurants", restaurant.country as "Country "
from recipe, restaurant, chef, show
where recipe.restaurantid = restaurant.restaurantid
and chef.chefid = show.chefid 
and restaurant.shownumber = show.shownumber
and chef.chefname Like 'Guy Fieri'
group by restaurant.country;



/* SQL Answer to Question 3 */ 
/* Question 3 Comment */
/* Place SQL below */

select count(Restaurant.restaurantid) as "RatingOf5Count", Restaurant.state
from Restaurant, Review
where Restaurant.Restaurantid = Review.Restaurantid
and Restaurant.state IN ('CA', 'TX') /* cannot use "=", "like", won't run */
and Review.rating = 5
group by Restaurant.state;


/* SQL Answer to Question 4 */ 
/* Question 4 Comment */
/* Place SQL below */

    /* Approach 1: Manipulate Recipe Table */
select recipename as "Recipe Name", totalcookingtime as "Longest Total Cooking Time In Minutes"
from recipe
where totalcookingtime =
    (select max(totalcookingtime) from recipe);
    
    /* Approach 2: manipulate data without resorting to Excel */
    
    /* Haven't figured out yet */



/* SQL Answer to Question 5 */ 
/* Question 5 Comment */
/* Place SQL below */

Select recipename as "Recipe", reviewdescription as "Review Description"
from recipe, review
where reviewdescription like '% love %' 
and reviewdescription like '% delicious %';


/* SQL Answer to Question 6 */ 
/* Question 6 Comment */
/* Place SQL below */

Select reviewid as "Review ID", daysago as "DaysAgo", 
        to_char(sysdate-daysago, 'mm-dd-rrrr')as "Review Date"
        from review
            where daysago < extract ( day from sysdate - 11-01-2021);


/* SQL Answer to Question 7 */ 
/* Question 7 Comment */
/* Place SQL below */

Select count(shownumber) as "Number of Shows", showyear as "Year"
        from show
            group by showyear
            order by showyear desc;


/* SQL Answer to Question 8 */ 
/* Question 8 Comment */
/* Place SQL below */


Select restaurant.country as "Country", count(*)as "Number of No Comments" /* Using "COUNT()" will count the number of "non-NULL" items in the specified column (NULL fields will be ignored) */
        from recipe, restaurant
        where recipe.restaurantid = restaurant.restaurantid
        and recipe.recipecomment is null
        group by restaurant.country;


    /* Test: to count null and non-null values */
    SELECT SUM(CASE WHEN Recipecomment is null THEN 1 ELSE 0 END) AS "Number Of Null Values", COUNT(Recipecomment) AS "Number Of Non-Null Values"
    FROM recipe;


/* SQL Answer to Question 9 */ 
/* Question 10 Comment */
/* Place SQL below */

Select count(recipelevel) as "Receipe Count", recipelevel as "Recipe" from recipe
group by recipelevel
having recipelevel In ('Intermediate', 'Advanced', 'Easy');


/* SQL Answer to Question 10 */ 
/* Question 10 Comment */
/* Place SQL below */

Select state, max(recipeid_count) 
from (select restaurant.state, count(recipe.recipeid) as recipeid_count 
from recipe, restaurant group by restaurant.state)
group by state
order by max(recipeid_count) desc
fetch first 1 row only;


/* End of Phase 4 Script */