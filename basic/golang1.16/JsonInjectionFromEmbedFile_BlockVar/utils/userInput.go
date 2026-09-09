package utils

import "fmt"

func GetUserInput() string {
	var userInput string
	_, err := fmt.Scan(&userInput)
	if err != nil {
		fmt.Println(err)
	}

	return userInput
}
