package main

import (
	"fmt"
	"io"
	"net/http"
)

func health(w http.ResponseWriter, req *http.Request) {
	io.WriteString(w, "{\"status\": \"OK\"}")
	fmt.Printf("{\"status\": \"OK\"}\n")
}
func main() {
	http.HandleFunc("/health/", health)
	http.ListenAndServe(":8000", nil)
}
