<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Vite + Vue</title>
  </head>
  <body>
    <div id="app"></div>
    <!-- <script type="module" src="http://localhost:5173/@vite/client"></script>
    <script type="module" src="http://localhost:5173/vue/src/main.js"></script> -->

    <?php
      function vueRender(){

        function ping($host, $port, $timeout) {
          $tB = microtime(true);
          $fP = @fSockOpen($host, $port, $errno, $errstr, $timeout);
          if (!$fP) return false;
          $tA = microtime(true);
          return round((($tA - $tB) * 1000), 0)." ms";
        }

        if(ping($_SERVER['HTTP_HOST'], 5173, 1000)){
          $html =  "<script type='module' src='http://localhost:5173/@vite/client'></script>";
          $html .=  "<script type='module' src='http://localhost:5173/vue/src/main.js'></script>";
        }else{
          $manifest = file_get_contents(__dir__. '/vue/dist/manifest.json');
          $manifest = json_decode($manifest, true);
          $css 	= $manifest['vue/src/main.css']['file'];
          $js 	= $manifest['vue/src/main.js']['file'];
          // corrigir a producao. O caminho deve ser relativo
          $html = "<link rel='stylesheet' href='vue/dist/$css' />";
          $html .= "<script type='module' src='vue/dist/$js'></script>";
        }

        return $html;
      }

      echo vueRender();
    ?>
  </body>
</html>
