/* Phase 2 - Building the Database */
/* Team # 10 */

/* Participating member names: Mickey Yeh, Aimee Marmol, Linjin Yuan */
/* Team Leader Name: Mickey Yeh */



/* SQL to Create Table 1 */ 
/* Place SQL below */

    /* SQL creates TABLES in alphabetical order!! can you change that?? */

CREATE TABLE Show
    (Show_ID 	NUMBER(4) not null ,
    Chef_ID NUMBER (2),
 	Show_Name	    varchar2(20) not null,
 	Show_Year	    Number(4) not null ,
	Season_Number	    Number(2) not null,   	 	
 	Show_Aired_On	   date not null,
 		CONSTRAINT Show_pk PRIMARY KEY (Show_ID));


/* SQL to Create Table 2 */ 
/* Place SQL below */        
CREATE TABLE Recipe
    (Recipe_ID 	NUMBER(3) ,
    Restaurant_ID number (4),
    Show_ID 	NUMBER(4) not null,
 	Recipe_Name	    varchar2(20),
 	Recipe_level	    Varchar2(10) ,
	Recipe_CookNotes	    varchar2(2000) ,   	 	
 	Recipe_TotalCookingTime	   varchar2(15),
    Recipe_PrepTime         varchar2(15),
    Recipe_CookingTime     varchar2(15),
    Recipe_Servings            varchar2(15),
    Recipe_Category             varchar2(20),
 		CONSTRAINT Recipe_ID_pk PRIMARY KEY (Recipe_Id));


/* SQL to Create Table 3 */ 
/* Place SQL below */ 		
Create table Ingredient
    (ingredient_id number(3),
    ingredient_description varchar2(200),
    Ingredient_quantity varchar2(200),
    CONSTRAINT ingredient_id_pk PRIMARY KEY (ingredient_id));


/* SQL to Create Table 4 */ 
/* Place SQL below */    
Create table Review
    (Review_ID number (5) not null,
    Recipe_ID 	NUMBER(3) ,
    Reviwer_Name varchar (20) not null,
    Review_Description varchar(2000),
    Review_Rating number (3) not null, 
    Review_NumberOfRatings number (3) not null,
    Review_Stars number (1,2) not null,
    Review_Date date not null, 
    CONSTRAINT Review_pk PRIMARY KEY (Review_ID));

/* SQL to Create Table 5 */ 
/* Place SQL below */    
Create table Celebrity_Chef
    (Chef_ID number (2),
    Chef_Name varchar2 (20), 
    Chef_Bio varchar2 (2000),
    Chef_WebSite_Address varchar2 (50),
    CONSTRAINT Celebrity_Chef_pk PRIMARY KEY(Chef_ID));
    
/* SQL to Create Table 6 */ 
/* Place SQL below */    
Create Table Restaurant 
    (Restaurant_ID number (4),
    Restaurant_Name varchar2(20), 
    Restaurant_Street varchar2 (50),
    Restaurant_City varchar2(50),
    Restaurant_State varchar2(50),
    Restaurant_Zip number(5),
    Restaurant_Country varchar2(50),
    Restaurant_Phone varchar2(50),
    Restaurant_Notes varchar2(2000),
    Restaurant_WhatToGet varchar2(50),
    CONSTRAINT Restaurant_pk PRIMARY KEY(Restaurant_ID));

/* SQL to Create Table 7 */ 
/* Place SQL below */    
Create table Yelp_Rating
    (Yelp_Rating_ID number (4) not null,
    Restaurant_ID number (4),
    Yelp_Restaurant_Yelp_Rating number (38),
    Yelp_Restaurant_Expense_Scale number (4),
    Yelp_Restaurant_Star_Rating number (2,2),
        CONSTRAINT Yelp_Rating_pk PRIMARY KEY(Yelp_Rating_ID));
        
/* SQL to Create Table 8 */ 
/* Place SQL below */
Create table Ingredient_Store
    (Store_Ingredient_ID number (3),
    Store_ID number (3), 
    Ingredient_ID number (3),
    Ingredient_Cost number (1,2),
    CONSTRAINT Ingredient_Store_pk PRIMARY KEY (Store_Ingredient_ID));
    

/* SQL to Create Table 9 */ 
/* Place SQL below */
Create table Recipe_Ingredient
    (Recipe_Ingredient_ID number (3),
    Recipe_ID number (3), 
    Ingredient_ID number (3),
    CONSTRAINT Recipe_Ingredient_pk PRIMARY KEY (Recipe_Ingredient_ID));

/* SQL to Create Table 10 */ 
/* Place SQL below */
Create table Store 
    (Store_ID number (3),
    Store_Name varchar2 (20),
    CONSTRAINT Store_ID_pk PRIMARY KEY (Store_ID));


/* SQL to Create Table 11 */ 
/* Place SQL below */
Create table Location 
    (Location_ID number (4),
    Location_SoldAt varchar2 (60),
    Location_SellingCost number (4,2),
    CONSTRAINT Location_ID_pk PRIMARY KEY (Location_ID));

/* SQL to Create Table 12 */ 
/* Place SQL below */
Create table Direction
    (Direction_ID number (4), 
    Recipe_ID number (3), 
    Direction_Recipe varchar2 (2000),
    CONSTRAINT Direction_ID_pk PRIMARY KEY (Direction_ID));

/* SQL to Create Table 13 */ 
/* Place SQL below */
Create table Recipe_Location
    (Recipe_Location_ID number (3),
    Recipe_ID number (3), 
    Location_ID number (3),
    CONSTRAINT Recipe_Location_ID_pk PRIMARY KEY (Recipe_Location_ID));



/* ---------------------*/

/* FK for TABLE 1: Show */
ALTER TABLE Show 
add CONSTRAINT Show_fk 
    FOREIGN KEY (Chef_ID) references Celebrity_Chef(Chef_ID);

/* FK for TABLE 2: Recipe */    
ALTER TABLE Recipe 
add CONSTRAINT Restaurant_ID_fk 
    FOREIGN KEY (Recipe_Id) references Restaurant(Restaurant_ID);


ALTER TABLE Recipe        
add 
    CONSTRAINT Show_ID_fk
    FOREIGN KEY (Recipe_Id) references Show(Show_ID); 

/* FK for TABLE 4: Review */        
ALTER TABLE Review 
add 
    CONSTRAINT Review_fk 
    FOREIGN KEY (Recipe_ID) references Recipe (Recipe_ID);

/* FK for TABLE 7: Yelp_Rating */
ALTER TABLE Yelp_Rating 
add 
    CONSTRAINT Yelp_Rating_fk 
    FOREIGN KEY(Restaurant_ID) references Restaurant(Restaurant_ID);

/* FK for TABLE 8: Ingredient_Store */
ALTER TABLE Ingredient_Store 
add 
    CONSTRAINT Ingredient_Store_fk1 
    FOREIGN KEY (Ingredient_ID) references Ingredient(Ingredient_ID);
    
ALTER TABLE Ingredient_Store 
add  
    CONSTRAINT Ingredient_Store_fk2 
    FOREIGN KEY (Store_ID) references Store(Store_ID); 

/* FK for TABLE 9: Recipe_Ingredient */    
ALTER TABLE Recipe_Ingredient 
add 
    CONSTRAINT Ingredient_Store_ID_fk1 
    FOREIGN KEY (Recipe_ID) references Recipe(Recipe_ID);
    
ALTER TABLE Recipe_Ingredient 
add
    CONSTRAINT Ingredient_Store_ID_fk2 
    FOREIGN KEY (Ingredient_ID) references Ingredient(Ingredient_ID);  

/* FK for TABLE 12: Direction */    
ALTER TABLE Direction 
add 
    CONSTRAINT Direction_ID_fk 
    FOREIGN KEY (Recipe_ID) references Recipe(Recipe_ID);

/* FK for TABLE 13: Recipe_Location */
ALTER TABLE Recipe_Location 
add 
    CONSTRAINT Recipe_Location_ID_fk1 
    FOREIGN KEY (Recipe_ID) references Recipe(Recipe_ID);
    
ALTER TABLE Recipe_Location 
add    
    CONSTRAINT Recipe_Location_ID_fk2 
    FOREIGN KEY (Location_ID) references Location(Location_ID);
    
/* ---------------------*/


/* Explanation for Multiple FK */
    /* No.1: Doesn't work */
ALTER TABLE Recipe 
add 
    CONSTRAINT Restaurant_ID_fk FOREIGN KEY (Recipe_ID) references Restaurant(Restaurant_ID),
    CONSTRAINT Show_ID_fk FOREIGN KEY (Recipe_ID) references Show(Show_ID); 

    /* No.2: this works, but will not show name in constraint! */
ALTER TABLE Recipe 
    add 
        (
        FOREIGN KEY (Recipe_Id) references Restaurant(Restaurant_ID),
        FOREIGN KEY (Recipe_Id) references Show(Show_ID)
        ); 



    /* No.3(Do alter table x2): this works as the correct one!! */
ALTER TABLE Recipe 
add CONSTRAINT Restaurant_ID_fk 
    FOREIGN KEY (Recipe_Id) references Restaurant(Restaurant_ID);


ALTER TABLE Recipe        
add 
    CONSTRAINT Show_ID_fk
    FOREIGN KEY (Recipe_Id) references Show(Show_ID); 




drop table SHOW;
drop table RECIPE;  
drop table INGREDIENT;  
drop table REVIEW;  
drop table CELEBRITY_CHEF;  
drop table RESTAURANT;  
drop table YELP_RATING;  
drop table INGREDIENT_STORE;  
drop table RECIPE_INGREDIENT;  
drop table STORE;  
drop table LOCATION;  
drop table DIRECTION;  
drop table RECIPE_LOCATION;  
/* End of Script */    