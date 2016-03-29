<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once('db_ConnUtil.php');
//require_once('db_utils.php');
require_once('db_PSutils.php');

$insertCatSql = $conn->prepare($insertCat_ps);

$insertCatSql->bind_param("s",$catName);

$catName = "Appliances";

$insertCatSql->execute();

mysqli_close($conn);

?>