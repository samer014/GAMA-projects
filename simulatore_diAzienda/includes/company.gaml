/**
* Name: company
* Based on the internal empty template. 
* Author: zetaemme
* Tags: 
*/

model company

import "./dematerializzazione.gaml"

species Company {
	string cv;
	bool ordineInCorso;
	Environment cell <- one_of(Environment);
	point coordinates <- {self.location.x ,self.location.y};
	list<map> magazzino;
	list<Truck> flotta;
	list<order> storicoOrdini;
	list cronologia;
	aspect default {
		draw circle(0.5) color: #red;
	}
	
	init {
		cv <- "azienda";
		location <- cell.location;
		magazzino <- [{"prd1", 1000000},{"prd2", 1000000},{"prd3", 1000000},{"prd4", 1000000},{"prd5", 1000000}];
		flotta <- [];
		loop i to: 0 from: num_trucks{
			flotta[i] <- create Truck;
		}
		storicoOrdini <- [];
		ordineInCorso <- false;
	}
	action nuovoOrdine(order ord){
		storicoOrdini accumulate(ord);
	}
	reflex assegnareOrdine{
		if(length(storicoOrdini)!=0){
			loop i to: 0 from: length(flotta){
				if(!flotta[i].inViaggio){
					flotta[i].ordineInCarico <- storicoOrdini[0];
					storicoOrdini[0] <- null; /*vorrei fare un pop come si fa negli stack*/
				}
			}
		}
	}
}
