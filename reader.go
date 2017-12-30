package main

import (
	"encoding/csv"
	"fmt"
  "os"
  "io"
)

func main() {
  file, err := os.Open("data-7M.csv")
	if err != nil {
		fmt.Println("Error:", err)
		return
	}
	defer file.Close()

	reader := csv.NewReader(file)
	for {
		_, err := reader.Read()
		if err == io.EOF {
			break
		} else if err != nil {
			fmt.Println("Error:", err)
			return
		}
	}
}
