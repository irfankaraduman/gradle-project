<?php
function sqlCall($tainted)
{
    echo $tainted;
    mysql_query("SELECT * FROM" . $tainted);

}

$tainted = $_GET[1];
$id = rand();
if (strlen($tainted) > 10)
{
    sqlcall($tainted);
}

$password = "BMW";

?>
