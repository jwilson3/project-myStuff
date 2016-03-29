<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//CREATE PREPARED STATEMENTS TO BE EXECUTED FROM ANOTHER FILE.
//Insert statement to insert a new category into the database.
$insertCat_ps = "INSERT INTO category(categoryName) VALUES (?)";

//Return all of the categories from the category table
$getAllCats_ps = "SELECT * FROM category";

?>