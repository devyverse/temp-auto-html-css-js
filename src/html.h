#ifndef HTML_H
#define HTML_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void ghtml(){
	printf("Generating file HTML.../n");
	
	const char *html[]=  
	"<!DOCTYPE html>"
	"<html lang='en-usa'>"
	"<head>"
	"  <meta charset='UTF-8'/>"
	"  <title>Entreprise name</title>"
	"  <link rel='stylesheet' href='styles.css'>"
	"  <meta name=viewport' content='width=device-width, initial-scale=1'/>"
	"</head>"
	"<body>"
	"	<h1> TEST html IN C </h1>"
	"</body>"
	"</html>";

return 0;

}


void ghtml();



#endif
