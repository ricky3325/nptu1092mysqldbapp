<?php
// 載入db.php來連結資料庫
require_once 'C:\AppServ\www\ai2\db.php';
?>

<h3>sql刪除結果</h3>
<?php
$get_qno = $_GET["qno"]; 

// sql語法存在變數中
$sql = "DELETE FROM `commodity` WHERE `mno`= '$get_qno'";
// 用mysqli_query方法執行(sql語法)將結果存在變數中
$result = mysqli_query($link,$sql);

// 如果有異動到資料庫數量(更新資料庫)
if (mysqli_affected_rows($link)>0) {
echo "資料已刪除";
}
elseif(mysqli_affected_rows($link)==0) {
    echo "無資料刪除";
}
else {
    echo "{$sql} 語法執行失敗，錯誤訊息: " . mysqli_error($link);
}
 mysqli_close($link); 
 ?>