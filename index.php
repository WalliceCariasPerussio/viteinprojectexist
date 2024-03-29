<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Vite + Vue</title>
  </head>
  <body>
    <div id="app"></div>

    <?php
      function vueRender(){
        
       
        $manifest = file_get_contents(__dir__. '/vue/dist/manifest.json');
        $manifest = json_decode($manifest, true);
        $css 	= $manifest['vue/src/main.css']['file'];
        $js 	= $manifest['vue/src/main.js']['file'];
        // corrigir a producao. O caminho deve ser relativo
        $html = "<link rel='stylesheet' href='vue/dist/$css' />";
        $html .= "<script type='module' src='vue/dist/$js'></script>";
       
        if(($_SERVER['SERVER_NAME'] === 'docker.localhost')){
          $html .=  "<script type='module' src='http://localhost:5173/@vite/client'></script>";
          $html .=  "<script type='module' src='http://localhost:5173/src/main.js'></script>";
        }
        return $html;
      }

      echo vueRender();
      echo "<br>";
      echo "Server IP: ".$_SERVER['SERVER_ADDR'];
      echo "<br>";
      echo "PHP Version: ".phpversion();
    ?>
  </body>
</html>
