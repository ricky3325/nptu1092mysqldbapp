<?php   

$db_host = "localhost";      // MariaDB �D����m
$db_id = "root";             // MariaDB �n�J�b��
$db_pw = "123456789";             // MariaDB �n�J�K�X

$db_link = @mysql_connect($db_host,$db_id,$db_pw);     // �s��MariaDB��Ʈw�t��

if (!$db_link)                                         // �p�G�s������MariaDB��Ʈw�t��
	die ("MysqlLinkError");                        // �e�X���~�T��

$sel_db = @mysql_select_db("ai2");                     // ��ܭn�s������Ʈw(���M�׫إߪ���ƮwAi2)
if (!$sel_db)                                          // �p�G�s������Ai2��Ʈw
	die ("SelectDbError");                         // �e�X���~�T�� 

mysql_query("SET NAMES 'UTF8'");                       // �]�w��r�r���s�X��UTF8�X

?>