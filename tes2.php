<?php
function table($propositions)
{
  $combinations = pow(2, $propositions);
  $half = $combinations;
  $trueFlag = true;
  $counter = 0;
  $arr = array();
  //main logic
  for ($i = 0; $i < $propositions; $i++) {
    $half = $half / 2;
    for ($x = 0; $x < $combinations; $x++) {
      if ($trueFlag) {
        $arr[$i][$x] = true;
      } else {
        $arr[$i][$x] = false;
      }
      if ($counter == ($half - 1) && $trueFlag == true) {
        $trueFlag = false;
        $counter = 0;
      } elseif ($counter == ($half - 1) && $trueFlag == false) {
        $trueFlag = true;
        $counter = 0;
      } else {
        $counter++;
      }
    }
  }
  //write table
  echo <<<_HTML
	<table border="1">
_HTML;
// var_dump($propositions);
for ($x = 0; $x < $propositions; $x++) {
  echo "<tr><th>Condition Stub ".$x."</th>";
  for ($i = 0; $i < $combinations; $i++) {
      if ($arr[$x][$i]) {
        echo "<td style='padding: 4px'>1</td>";
      } else {
        echo "<td style='padding: 4px'>0</td>";
      }
    }
    echo "</tr>";
  }
  echo "</table>";
}

if (isset($_POST['propositions'])) {
  table($_POST['propositions']);
}
?>
<form action="" method="post">
  <input type="text" name="propositions">
  <input type="submit" value="Go!">
</form>