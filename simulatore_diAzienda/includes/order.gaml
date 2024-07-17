/**
* Name: order
* Based on the internal empty template. 
* Author: pacom
* Tags: 
*/
model order

species order {
	string cv <- "OR" + rnd(1000);
	map<string, int> lista_prodotti <- ["prd1"::0, "prd2"::0, "prd3"::0, "prd4"::0, "prd5"::0];
}