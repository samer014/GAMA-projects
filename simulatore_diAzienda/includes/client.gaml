/**
* Name: client
* Based on the internal empty template. 
* Author: zetaemme
* Tags: 
*/

model client

import "./grid_definition.gaml"
import "./prodotti.gaml"
import "./order.gaml"
import "./company.gaml"

global {
    float time <- 1 #hour;
    int n_perOrdine <- 2;
}

species Client {
    string cv;
    Environment cell <- one_of(Environment);
    point coordinates <- {self.location.x, self.location.y};
    list<map> magazzino;
    bool ordineInCorso;
    list<order> cronologia_ordini_cliente;
    
    aspect default {
        draw circle(0.5) color: #blue;
    }
    
    init {
        location <- cell.location;
        magazzino <- [{"prd1"::rnd(20,50)},{"prd2"::rnd(20,50)},{"prd3"::rnd(20,50)},{"prd4"::rnd(20,50)},{"prd5"::rnd(20,50)}]; 
        cv <- "CL" +  rnd (1000);
        ordineInCorso <- false;
        cronologia_ordini_cliente <- [];
    }
    
    action ordina(order ordine) {
		
    }
    
    reflex controllaMagazzino {
		
    }
}
