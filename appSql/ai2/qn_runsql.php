<?php

header("Content-Type: text/html; charset=utf-8");   // 宣告本頁字元為UTF8碼

include "con_db.inc";                      // 載入資料庫連結檔 


$sql_query = $_GET["sql"];

        echo $sql_query;
        echo "\n";

$result=mysql_query($sql_query);                                                    // 送出SQL字串給MySQL

if (mysql_affected_rows())
	echo "(INSERT UPDATE DELETE)指令執行成功";
else
   echo "(INSERT UPDATE DELETE)指令執行失敗";

mysql_close($db_link);                               // 關閉MySQL連結 

?>