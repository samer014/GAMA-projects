/**
* Name: Truck
*  
* Author: pacom
* Tags: 
*/


model Truck

/* Insert your model definition here */

import "./grid_definition.gaml"
import "./order.gaml"
import "../models/dematerializzazione.gaml"

species Truck {
	string cv;
	bool inViaggio;
	Environment cell <- one_of(Environment);
	point coordinates <- {self.location.x ,self.location.y};
	int capacita;
	int totQuadrati;
	order ordineInCarico;
	
	aspect default {
		draw circle(0.5) color: #green;
	}
	
	init {
		location <- cell.location;
		cv <- "CM" + rnd (1000);
		capacita <- 20;
		totQuadrati <- 0;
		inViaggio <- false;
	}
}
