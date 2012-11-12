<?php $handle = fopen('php://input','r');
                $jsonInput = fgets($handle);
                // Decoding JSON into an Array
                $decoded = json_decode($jsonInput,true);
                for($i = 0; $i < count($decoded); $i++)
                	print "$i";
?>