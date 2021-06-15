<?php
// 載入db.php來連結資料庫
require_once 'C:\AppServ\www\ai2\db.php';
?>

<h3>sql插入結果</h3>
<?php
$get_jno = $_GET["jno"];
$get_jname = $_GET["jname"];
$get_taxid = $_GET["taxid"];
$get_switchboard = $_GET["method"];

echo $get_mno;

// sql語法存在變數中
$sql = "INSERT INTO  juristic (`jno`, `jname`, `taxid`, `switchboard`) VALUES ('$get_jno','$get_jname','$get_taxid','$get_switchboard') ";

// 用mysqli_query方法執行(sql語法)將結果存在變數中
$result = mysqli_query($link,$sql);

// 如果有異動到資料庫數量(更新資料庫)
if (mysqli_affected_rows($link)>0) {
// 如果有一筆以上代表有更新
// mysqli_insert_id可以抓到第一筆的id
$new_nno= mysqli_insert_id ($link);
echo "新增後的nno為 {$new_nno} ";
}
elseif(mysqli_affected_rows($link)==0) {
    echo "無資料新增";
}
else {
    echo "{$sql} 語法執行失敗，錯誤訊息: " . mysqli_error($link);
}
 mysqli_close($link); 
 ?>