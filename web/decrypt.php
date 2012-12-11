<?php
//GVW2Zd3Z0oeZEhhh4SghtA==
$crypted = "GVW2Zd3Z0oeZEhhh4SghtA==";
$pass = "chicken butt";

$iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_ECB);
$iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
$key = 'a16byteslongkey!a16byteslongkey!';
$plaintext = "iphone";

$ciphertext = mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key, $plaintext, MCRYPT_MODE_ECB);
$base64encoded_ciphertext = base64_encode($ciphertext);
echo "ciphertext: ".$base64encoded_ciphertext."<br/>";

$plaintext = mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key, base64_decode($base64encoded_ciphertext), MCRYPT_MODE_ECB);
echo "plaintext: ".$plaintext."<br/>";

$base64encoded_ciphertext =  "I3chV+E2XUHeLCcJAhBaJQ==";
$plaintext = mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key, base64_decode($base64encoded_ciphertext), MCRYPT_MODE_ECB);
echo "plaintext: ".trim($plaintext);

?>