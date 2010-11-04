<?php

if (!isset($_SERVER['PHP_AUTH_USER'])) {
    header('WWW-Authenticate: Basic realm="My Realm"');
    header('HTTP/1.0 401 Unauthorized');
    echo 'Text to send if user hits Cancel button';
    exit;
} else {
    echo "<p>Hello {$_SERVER['PHP_AUTH_USER']}.</p>";
    echo "<p>You entered {$_SERVER['PHP_AUTH_PW']} as your password.</p>";
}




if (!$_POST['utilizador']) {
    echo "Erro: Preencha o utilizador, sff.<br />";
    exit;
}
$prefixo = stripslashes($_POST['utilizador']) . "_";
echo $prefixo . "<br/>";
echo "Tipo: " . $_FILES["file"]["type"] . "<br />";
echo "Código do erro: " . $_FILES["file"]["error"] . "<br />";
echo "Upload: " . $_FILES["file"]["name"] . "<br />";
echo "Type: " . $_FILES["file"]["type"] . "<br />";
echo "Size: " . ($_FILES["file"]["size"] / 1024) . " Kb<br />";
echo "Temp file: " . $_FILES["file"]["tmp_name"] . "<br />";


if (file_exists("upload/" . $_FILES["file"]["name"])) {
    echo $_FILES["file"]["name"] . " already exists. ";
} else {
    $caminho = "upload/" . $prefixo . $_FILES["file"]["name"];
    move_uploaded_file($_FILES["file"]["tmp_name"], $caminho);
    echo "Guardado em: " . $caminho;
    $comando = "/usr/bin/file " . $caminho;
    $output = system($comando);
    echo "<pre>$output</pre>";


    $doc = new DOMDocument();
    $resultado = $doc->load('upload/ficheiros.xml');
    echo $resultado ? "Existia" : "Não existia";
    $doc->preserveWhiteSpace = false;
    $doc->formatOutput = false;
    
    if ($resultado) {
        $lista = $doc->getElementsByTagName( "ficheiros" );
        $r = $lista->item(0);
        // print $lista->item(0)->nodeValue . "\n";
    } else {
        $r = $doc->createElement( "ficheiros" );
        $doc->appendChild( $r );
    }
    
    $f = $doc->createElement( "ficheiro" );
    
    $u = $doc->createElement( "utilizador" );
    $u->appendChild( $doc->createTextNode( $_POST['utilizador'] ));
    $f->appendChild( $u );
    
    $n = $doc->createElement( "nome" );
    $n->appendChild( $doc->createTextNode( $caminho ));
    $f->appendChild( $n );
    
    #$d = $doc->createElement( "data" );
    #$d->appendChild( $doc->createTextNode( date("y-m-d H:i:s", time()) ));
    #$f->appendChild( $d );

    $d = $doc->createAttribute( "data" );
    $d->appendChild( $doc->createTextNode( date("y-m-d H:i:s", time()) ));
    $f->appendChild( $d );
    
    $t = $doc->createElement( "tipo" );
    $t->appendChild( $doc->createTextNode( $output ));
    $f->appendChild( $t );
    
    $r->appendChild( $f );
    
    // echo $doc->saveXML();
    
    echo 'Wrote: ' . $doc->save('upload/ficheiros.xml') . ' bytes';
    

}
?>
