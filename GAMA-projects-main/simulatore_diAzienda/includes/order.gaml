/**
* Name: order
* Based on the internal empty template. 
* Author: pacom
* Tags: 
*/
model order
import "./client.gaml"
import "../models/dematerializzazione.gaml"

species order {
	string cv <- "OR" + rnd(1000);
	map<string, int> lista_prodotti <- ["prd1"::0, "prd2"::0, "prd3"::0, "prd4"::0, "prd5"::0];
	Client cliente <- one_of(Client);
	point puntoDarrivo <- cliente.coordinates;
}