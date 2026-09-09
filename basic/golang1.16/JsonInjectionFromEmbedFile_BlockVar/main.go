package main

import (
	"./utils"
	_ "embed"
	"encoding/json"
	"fmt"
)

var (
	//go:embed test.json
	jsonLike string
)

func saveJson(){
	var a [5]string
	a[3] = utils.GetUserInput()
	utils.SaveToFile(utils.MakeJSONStruct(a))
}

func main() {
	saveJson()
	data := map[string]string{}
	if err := json.Unmarshal([]byte(jsonLike), &data); err != nil {
		panic(err)
	}
	tainted, _ := json.Marshal(data)
	fmt.Println(string(tainted))
}
