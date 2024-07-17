/**
* Name: order
* Based on the internal empty template. 
* Author: pacom
* Tags: 
*/


model order
import "./"

/* Insert your model definition here */

species order{
	string cv;
	list<map> lista_prodotti;
	
	init{
		cv <- "OR" + rnd (1000);
		lista_prodotti[{"prd1",0},{"prd2",0},{"prd3",0},{"prd4",0},{"prd5",0}]
	}
}