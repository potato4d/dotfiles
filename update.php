#!/usr/bin/env php
<?php
require_once __DIR__ . "/service/initialize.php";
println("Fetch remote changes...");
exec("git fetch");
println("Check update...");
exec("git diff remotes/origin/master", $check);
if($check){
  println(success("Update is available."));
}else{
  println(bold("Nothing update."));
}
