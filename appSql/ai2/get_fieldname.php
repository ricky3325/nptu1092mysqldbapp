<?php
header("Content-Type: text/html; charset=utf-8");   // 宣告本頁字元為UTF8碼
include "con_db.inc";                               // 載入資料庫連結檔 
$sql_query = $_GET["sql"];                          // 取得GET傳進來的SQL查詢字串
//$sql_query = "select * from students";
//echo $sql_query;
$result = mysql_query($sql_query);                  // 將讀取的資料存入$result變數中
//如果有讀取資料時，則透過for迴圈來依序讀取欲顯示記錄的各「欄位名稱」
if ($result)
{
	for ($i=1; $i<=mysql_num_fields($result); $i++)             
	{
		$row_result = mysql_fetch_field($result);
		echo $row_result->name;
	
		if ($i < mysql_num_fields($result))
			echo "   ";
	}
}
else                                  //如果沒有讀取資料時，則顯示「查無此資料!」
	echo "查無此資料!";
mysql_close($db_link);                               // 關閉MariaDB資料庫連結 
?>