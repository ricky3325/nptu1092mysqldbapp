<?php

header("Content-Type: text/html; charset=utf-8");   // 宣告本頁字元為UTF8碼

include "con_db.inc";                               // 載入資料庫連結檔 

$sql_query = $_GET["sql"];                          // 取得GET傳進來的SQL查詢字串
//$sql_query = "select * from students";
//echo $sql_query;

$result = mysql_query($sql_query);   

if ($result)
{
	for ($i=1; $i<=mysql_num_fields($result); $i++)
	{
		$row_result = mysql_fetch_field($result);
		$FieldName[$i]=$row_result->name;	
	}

	$i = 1;                                                                                                      
	while ($row_result = @mysql_fetch_assoc($result) )             // 取得資料表的內容
	{
		for ($j=1; $j<=mysql_num_fields($result); $j++)
		{
			echo $row_result[$FieldName[$j]];
			if ($j < mysql_num_fields($result))
				echo "@@";		     
		}
        if ($i < mysql_num_rows($result ))
				echo "@#@";
		$i++;                                                  // 變數i 加1
	}
}
mysql_close($db_link);                                                 // 關閉MySQL連結 
?>