package utils

import (
	"encoding/json"
	"fmt"
	"os"
)

func SaveToFile(data map[string]string){
	filename := "test.json"
	//  [RuleTest] JSON Injection analyzer:"dataflow"
	str, _ := json.MarshalIndent(data, "", " ")
	f, err := os.OpenFile(filename, os.O_WRONLY|os.O_CREATE, os.ModePerm)
	if err != nil {
		panic(err)
	}

	defer f.Close()

	fmt.Fprintf(f, "%s", str)
}