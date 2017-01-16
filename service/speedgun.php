<?php
function speedgun($start){
  return substr(microtime(true) - $start, 0, 6);
}
