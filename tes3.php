<?php
$nbBooleans = 5; // change to whatever you want

// show header

for($i = 0; $i < $nbBooleans ; $i++)
{
  if ($i > 0)
    echo " | ";
  echo chr($i + 65); // 1 => A, 2 => B etc.
}

// separator line (dynamic size)

echo "\n".str_repeat("-", ($nbBooleans - 1) * 3 + $nbBooleans)."\n";

// show combinations

$nbInterations = pow(2, $nbBooleans);

for($i = 0; $i < $nbInterations; $i++)
{
  for ($iBit = 0; $iBit < $nbBooleans; $iBit++)
  {
    if ($iBit > 0)
      echo " | ";
    echo (($i & pow(2, $iBit)) != 0 ? 'Y' : 'N');
  }
  echo "\n";
}
?>