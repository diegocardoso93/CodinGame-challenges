<?php
$word1 = stream_get_line(STDIN, 256 + 1, "\n");
$word2 = stream_get_line(STDIN, 256 + 1, "\n");

$levenshteinDistance = function ($word1, $word2) {
    $tab = [];
    for ($x=0;$x<=strlen($word1);$x++) {
        $tab[$x][0] = $x;
    }
    for ($y=0;$y<=strlen($word2);$y++) {
        $tab[0][$y] = $y;
    }
    for ($x=1;$x<=strlen($word1);$x++) {
        for ($y=1;$y<=strlen($word2);$y++) {
            $cost = ($word1{$x-1} == $word2{$y-1}) ? 0 : 1;
            $tab[$x][$y] = min([
                $tab[$x-1][$y] + 1,
                $tab[$x][$y-1] + 1,
                $tab[$x-1][$y-1] + $cost
            ]);
        }
    }
    
    return $tab[strlen($word1)][strlen($word2)];
};

echo $levenshteinDistance($word1, $word2);

?>