/**
* Name: veronesi
* Based on the internal empty template. 
* Author: zetaemme
* Tags: 
*/

model dematerializzazione

import "../includes/client.gaml"

global {
	int grid_width <- 100;
	int grid_height <- 100;
	int num_clients <- 50;
	int num_trucks <- 5;
	list<string> listino_prodotti <- ["prd1","prd2","prd3","prd4","prd5"];
	list<Client> lista_clienti;
	
	init {    
	    loop i to: 0 from: num_clients{
	    	// FIXME
	    }
	    
	    create Company number: 1 {
	    	location <- {grid_width / 2, grid_height / 2};
	    }
	}
}

experiment Simulation type: gui {
	output {
		display main_display background: #lightgray { 
		 	grid Environment border: #black;
			species Client aspect: default;
			species Company aspect: default;
		}
	}
}
