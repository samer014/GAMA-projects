model Truck
import "./grid_definition.gaml"
import "./order.gaml"
import "../models/dematerializzazione.gaml"

species Truck skills:[moving] {
	string cv <- "CM" + rnd (1000);
	bool inViaggio <- false;
	Environment cell <- one_of(Environment);
	point coordinates <- {self.location.x ,self.location.y};
	int capacita <- 20;
	order ordineInCarico;
	path stradaAndata <- path([{0,0},ordineInCarico.puntoDarrivo]);
	path stradaRitorno <- path([ordineInCarico.puntoDarrivo,{0,0}]);

	aspect default {
		draw circle(0.5) color: #green;
	}
	
	init {
		location <- cell.location;
	}
	

	reflex caricaOrdine{
		if(!inViaggio and coordinates = {0,0} and ordineInCarico != nil){
			do follow speed: 10.10 path: stradaAndata;
			do follow speed: 10.10 path: stradaRitorno;
			do scaricaOrdine;
		}
	}
	
	action scaricaOrdine{
		ordineInCarico <- nil;
	}
}
