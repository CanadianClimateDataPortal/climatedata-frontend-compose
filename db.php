<?php
$setting_mysql_db_host="db";
$setting_mysql_db_user="climatedata";
$setting_mysql_db_pass='climatedata';
$setting_mysql_db_name="geocoder";

$con = mysqli_connect($setting_mysql_db_host,$setting_mysql_db_user,$setting_mysql_db_pass,$setting_mysql_db_name);
mysqli_set_charset($con,"utf8");

global $vars;

$vars['con'] = $con;

if (mysqli_connect_errno()) {
    throw new Exception(mysqli_connect_error(), mysqli_connect_errno());
}
