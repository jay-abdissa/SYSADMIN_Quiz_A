#!/bin/bash
#The Directory Variable
Directory=${1}
#The Identifier Variable
Identifier=${2}

#Checks that there are two parameters
if [[ $# > 2 || $# < 2 ]]; then 
	echo "You need to prive two arguements for this script to work."
	echo "Usage: make-go-dir <root directory name> <identifier name>"
else
	echo "I am about to create a directory structure named *$Directory*."
	echo "Do you want to continue [Yes/No]?"
fi

#Hold user input
read Response

#If input is yes
if [[ "$Response" = "Yes" ]]; then
	echo "Creating directory structure..."
	mkdir $Directory
	cd $Directory
	mkdir bin cmd cmd/api internals migrations remote
	touch cmd/api/main.go go.mod Makefile

	#Write a string to main.go
	echo -e '// File: cmd/api/main.go \n\npackage main \n\nimport "fmt" \n\nfunc main() { \nfmt.Println("Hello world!") \n}' >>cmd/api/main.go
	#Add identifier to go.mod
	echo "module $Directory.$Identifier" >> go.mod
	#Display a message which states main has been created and can be tested
	echo "I have created a *main.go* file for you to test the directory structure."
	echo "Type *go run ./cmd/api* at the root directory of your project to test the project. Thank you."

#If input is no
elif [[ "$Response" = "No" ]]; then
	echo "Abort."
fi
