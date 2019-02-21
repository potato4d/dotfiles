package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"
	"strings"
)

func main() {
	home := os.Getenv("HOME")
	pwd, err := filepath.Abs(".")
	if err != nil {
	}

	files, err := ioutil.ReadDir("./config")
	if err != nil {
		log.Fatal(err)
	}

	for _, f := range files {
		homefile := home + "/" + f.Name()
		targetfile := pwd + "/config/" + f.Name()
		err = os.Symlink(targetfile, homefile)
		if err != nil {
			fmt.Printf("\x1b[31m%s\x1b[0m", "Error")
			fmt.Println("")
			fmt.Print("  ")
			replacedErr1 := strings.Replace(err.Error(), pwd, ".", -1)
			replacedErr2 := strings.Replace(replacedErr1, home, "~", -1)
			fmt.Println(replacedErr2)
			fmt.Println("")
		}
	}
}
