<?php
//GVW2Zd3Z0oeZEhhh4SghtA==
$crypted = "GVW2Zd3Z0oeZEhhh4SghtA==";
$pass = "chicken butt";

print fnDecrypt($crypted, $pass);

print decryptString($crypted, $pass);

function fnDecrypt($sValue, $sSecretKey) {
    return trim(
        mcrypt_decrypt(
            MCRYPT_RIJNDAEL_256, 
            $sSecretKey, 
            base64_decode($sValue), 
            MCRYPT_MODE_ECB,
            mcrypt_create_iv(
                mcrypt_get_iv_size(
                    MCRYPT_RIJNDAEL_256,
                    MCRYPT_MODE_ECB
                ), 
                MCRYPT_RAND
            )
        )
    );
}


function decyprtString($sValue, $sSecretKey) {
	$padded_key = $sSecretKey . str_repeat(chr(0x00), 16);
	$result = mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $padded_key, base64_decode($sValue), 'ecb');
}

?>