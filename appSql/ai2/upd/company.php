<?php
// 載入db.php來連結資料庫
require_once 'C:\AppServ\www\ai2\db.php';
?>

<h3>sql更新結果</h3>
<?php
$get_jno = $_GET["jno"];
$get_jname = $_GET["jname"];
$get_method = $_GET["method"];
$get_taxid = $_GET["taxid"];

// sql語法存在變數中
$sql = "UPDATE  juristic SET `switchboard`='$get_method', `jname`='$get_jname', `taxid`='$get_taxid' WHERE `jno`='$get_jno'";
// 用mysqli_query方法執行(sql語法)將結果存在變數中
$result = mysqli_query($link,$sql);

// 如果有異動到資料庫數量(更新資料庫)
if (mysqli_affected_rows($link)>0) {
echo "資料已更新";
}
elseif(mysqli_affected_rows($link)==0) {
    echo "無資料更新";
}
else {
    echo "{$sql} 語法執行失敗，錯誤訊息: " . mysqli_error($link);
}
 mysqli_close($link); 
 ?>