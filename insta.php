<html>
<body>


<?php
include 'Retrieve_url.php';
$tag = $_GET["tag"];

$searchData = file_get_contents('https://www.instagram.com/explore/tags/'.$tag.'/?__a=1');
$x = 0;
$link1="";
$link2="";
$link3="";
$link4="";
$link5="";
$link6="";

while (true)
{
	if ( $searchData[$x] == 'd' && $searchData[$x+1] == 'i' && $searchData[$x+2] == 's' && $searchData[$x+3] == 'p' && $searchData[$x+4] == 'l' && $searchData[$x+5] == 'a' && $searchData[$x+6] == 'y' && $searchData[$x+7] == '_' && $searchData[$x+8] == 'u' && $searchData[$x+9] == 'r' && $searchData[$x+10] == 'l')
	{
		$counter = 0;
												
		if (empty($link1)) 
		{
		While(true)
			{	
				$link1[$counter] = $searchData[$x+14+$counter];
				
				if(!empty($link1[0]) && !empty($link1[1]) && !empty($link1[2]))
				{
					if($link1[$counter] == 'g' && $link1[$counter-1] == 'p' && $link1[$counter-2] == 'j' && $link1[$counter-3] == '.')
					{
					
					$link1 = implode($link1);
					$x = $x + 14+$counter;
					break;
					}
				}
				$counter = $counter + 1;
			}
		}
		
	else if(empty($link2))
	{
		While(true)
			{	
				$link2[$counter] = $searchData[$x+14+$counter];
				
				if(!empty($link2[0]) && !empty($link2[1]) && !empty($link2[2]))
				{
					if($link2[$counter] == 'g' && $link2[$counter-1] == 'p' && $link2[$counter-2] == 'j' && $link2[$counter-3] == '.')
					{
					
					$link2 = implode($link2);
					$x = $x + 14+$counter;
					break;
					}
				}
				$counter = $counter + 1;
			}
	}
	
	
	else if(empty($link3))
	{
		While(true)
		{	
				$link3[$counter] = $searchData[$x+14+$counter];
				
				if(!empty($link3[0]) && !empty($link3[1]) && !empty($link3[2]))
				{
					if($link3[$counter] == 'g' && $link3[$counter-1] == 'p' && $link3[$counter-2] == 'j' && $link3[$counter-3] == '.')
					{
					
					$link3 = implode($link3);
					$x = $x + 14+$counter;
					break;
					}
				}
				$counter = $counter + 1;
			}

	}
	else if(empty($link4))
	{
		While(true)
		{	
				$link4[$counter] = $searchData[$x+14+$counter];
				
				if(!empty($link4[0]) && !empty($link4[1]) && !empty($link4[2]))
				{
					if($link4[$counter] == 'g' && $link4[$counter-1] == 'p' && $link4[$counter-2] == 'j' && $link4[$counter-3] == '.')
					{
					
					$link4 = implode($link4);
					$x = $x + 14+$counter;
					break;
					}
				}
				$counter = $counter + 1;
			}

	}
	else if(empty($link5))
	{
		While(true)
		{	
				$link5[$counter] = $searchData[$x+14+$counter];
				
				if(!empty($link5[0]) && !empty($link5[1]) && !empty($link5[2]))
				{
					if($link5[$counter] == 'g' && $link5[$counter-1] == 'p' && $link5[$counter-2] == 'j' && $link5[$counter-3] == '.')
					{
					
					$link5 = implode($link5);
					$x = $x + 14+$counter;
					break;
					}
				}
				$counter = $counter + 1;
			}
	}
	else if(empty($link6))
	{
		While(true)
		{	
				$link6[$counter] = $searchData[$x+14+$counter];
				
				if(!empty($link6[0]) && !empty($link6[1]) && !empty($link6[2]))
				{
					if($link6[$counter] == 'g' && $link6[$counter-1] == 'p' && $link6[$counter-2] == 'j' && $link6[$counter-3] == '.')
					{
					
					$link6 = implode($link6);
					$x = $x + 14+$counter;
					break;
					}
				}
				$counter = $counter + 1;
		}
		
			
			
	}
			
	
	
	
}

if (!empty($link6))
	{
		break;
	}
$x = $x + 1;

	
}

$allLink = array($link1,$link2,$link3,$link4,$link5,$link6);

?>

<img src="<?php echo $allLink[0] ?> " alt="insta6" width="500" height="600">
<img src="<?php echo $allLink[1] ?> " alt="insta1" width="500" height="600">
<img src="<?php echo $allLink[2] ?> " alt="insta2" width="500" height="600">
<img src="<?php echo $allLink[3] ?> " alt="insta3" width="500" height="600">
<img src="<?php echo $allLink[4] ?> " alt="insta4" width="500" height="600">
<img src="<?php echo $allLink[5] ?> " alt="insta5" width="500" height="600">


</body>
</html>

