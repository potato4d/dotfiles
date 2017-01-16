<?php

function success($str){
  return "\033[1;32m" . $str . "\033[0m";
}

function info($str){
  return "\033[1;36m" . $str . "\033[0m";
}

function bold($str){
  return "\033[1;37m" . $str . "\033[0m";
}

function println($raw) {
  echo $raw . "\n";
}
