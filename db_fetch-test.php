<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once('db_ConnUtil.php');
//require_once('db_utils.php');
require_once('db_PSutils.php');

//Print a header to the screen
$rowsSoFar = "<table>\n<tr>\n<th>ID#</th>\n<th>Category</th>\n</tr>\n";

$stmt = $conn->prepare($getAllCats_ps);

$stmt->execute();

$stmt->bind_result($id,$catName);

while(mysqli_stmt_fetch($stmt)){
    $rowsSoFar .= "<tr>\n<td>$id</td>\n<td>$catName</td>\n</tr>\n";
}

mysqli_stmt_close($stmt);

echo $rowsSoFar."</table>";

mysqli_close($conn);

?>