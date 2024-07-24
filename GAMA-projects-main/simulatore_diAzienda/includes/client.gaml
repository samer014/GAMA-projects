/**
* Name: client
* Based on the internal empty template. 
* Author: zetaemme
* Tags: 
*/
model client

import "./grid_definition.gaml"
import "./order.gaml"
import "./company.gaml"
import "../models/dematerializzazione.gaml"

global {
	float time <- 1 #hour;
	int n_perOrdine <- 2;
}

species Client {
	string cv <- "CL" + rnd(1000);
	Environment cell <- one_of(Environment);
	point coordinates <- {self.location.x, self.location.y};
	map<string, int> magazzino <- ["prd1"::rnd(20, 50), "prd2"::rnd(20, 50), "prd3"::rnd(20, 50), "prd4"::rnd(20, 50), "prd5"::rnd(20, 50)];
	bool ordineInCorso <- false;
	list<order> cronologia_ordini_cliente <- [];

	aspect default {
		draw circle(0.5) color: #blue;
	}

	init {
		location <- cell.location;
	}

	action ordina(string prodotto){
		order ordine;
		ordine.lista_prodotti[prodotto] <- ordine.lista_prodotti[prodotto] + 40;
		listino_ordini <+ ordine;
	}

	reflex controllaMagazzino {
		loop i from: 0 to: 5{
			if(self.magazzino["prd"+i] < 10){
				do ordina("prd"+i);
			}
		}
	}
	reflex usaProdotti{
		int random <- rnd(1,5);
		self.magazzino["prd"+random] <- self.magazzino["prd"+random]-5;
	}

}
