<?php

$home = $_SERVER["HOME"] . "/dotfiles";
$move = "cd " . $home;
$start_time = microtime(true);

require_once __DIR__ . "/println.php";
require_once __DIR__ . "/speedgun.php";

println("Initialize...");
exec($move);
