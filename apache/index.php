<!DOCTYPE html>
<html lang="en">
<?php
# find the images
$directory = "/var/www/html/images";

# compose array of files in $directory - removing the entries for the dots
$files = array_diff(scandir($directory), array('..', '.'));
?>

<!-- return the image from the php array defined above - regardless of the size -->
<img src="images/<?php echo $files[array_rand($files)] ?>"></img>
</html>
