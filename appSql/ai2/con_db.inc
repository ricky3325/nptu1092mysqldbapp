<?php   

$db_host = "localhost";      // MariaDB 主機位置
$db_id = "root";             // MariaDB 登入帳號
$db_pw = "123456789";             // MariaDB 登入密碼

$db_link = @mysql_connect($db_host,$db_id,$db_pw);     // 連結MariaDB資料庫系統

if (!$db_link)                                         // 如果連結不到MariaDB資料庫系統
	die ("MysqlLinkError");                        // 送出錯誤訊息

$sel_db = @mysql_select_db("ai2");                     // 選擇要連結的資料庫(本專案建立的資料庫Ai2)
if (!$sel_db)                                          // 如果連結不到Ai2資料庫
	die ("SelectDbError");                         // 送出錯誤訊息 

mysql_query("SET NAMES 'UTF8'");                       // 設定文字字元編碼為UTF8碼

?>