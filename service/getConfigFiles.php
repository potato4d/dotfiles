<?php
function getConfigFiles($dir, $ignore) {
  $files = scandir($dir);
  $files = array_filter($files, function ($file) {
    return !in_array($file, array('.', '..'));
  });
  return $files;
}
