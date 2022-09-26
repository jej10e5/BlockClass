package main

import (
	"log"
	"os"
)

func Newlog() *log.Logger {
	fileLog, _ := os.OpenFile("test.log", os.O_CREATE|os.O_WRONLY, os.FileMode(0644))
	defer fileLog.Close()
	myLog := log.New(fileLog, "INFO : ", log.LstdFlags)

	return myLog
}
