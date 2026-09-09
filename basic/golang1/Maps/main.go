package main

import (
	"fmt"
	"log"
)

func taintedFunc() (string, string) {
	var someData, password string
	fmt.Scan(&someData, &password)
	return someData, password
}

func main()  {
	m := make(map[string]string)
	m["someData"], m["password"] = taintedFunc()
	log.Println(m["someData"])
	password := m["password"]
	a := password
	log.Println(a)
}
