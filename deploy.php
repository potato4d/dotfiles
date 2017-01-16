#!/usr/bin/env php
<?php
require_once __DIR__ . "/service/initialize.php";
$dotfiles = [];
echo "Start Install...\n";

println("Get dotfiles...\n");
exec("ls -a ./config/", $dotfiles);
println(bold("Lists:"));
$dotfiles = array_filter($dotfiles, function ($file) {
  return !in_array($file, array(".", "..", ".DS_Store"));
});

foreach ($dotfiles as $key => $dotfile) {
  println("  " . $dotfile);
}

println(info("\nMake Symlink...\n"));

foreach ($dotfiles as $key => $dotfile) {
  println(bold("[COPY] ") . $dotfile);
  println(success("  from: ") . $_SERVER["HOME"] . "/config/" . $dotfile);
  println(success("    to: ") . $_SERVER["HOME"] .    "/"     . $dotfile . "\n");
  exec("rm ~/" . $dotfile);
  exec("ln -s " . $home . "/config/" . $dotfile . " ~/" . $dotfile);
}

println(success("Complete! ") . bold(speedgun($start_time) . "ms") );

exec("source ~/.bash_profile");
exec("source ~/.bashrc");
