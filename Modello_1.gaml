/**
* Name: Modello1
*  
* Author: pacom
* Tags: 
*/


model Modello1

/* Insert your model definition here */

global{
	int altezza;
	int base;
	int portata_max <- 5;
	list<list<casella>> matrice;
	
	init{
		altezza<-1000;
		base<-1000;
	}
	
}



species casella{
	point posizione;
}
species cliente parent: casella{
	/*chiedere per le tuple */
	type Mytuple{
		prodotto nome_prodotto;
		string quantita;
	}
	string cv;
	list<mytuple> magazzino;
	
	reflex ordinare{}
	reflex verificaMag{}
}
species azienda parent: casella{
	type Mytuple{
    	prodotto nome_prodotto;
	    string quantita;
	}
	string cv;
	list<Mytuple> magazzino;
	list<camion> flotta;
	
	list<ordine> storico_ordini;
	/*list<string> documento;*/
	
	reflex caricareOrdine{}
	reflex scaricareOrdine{}
	
	
}
species camion parent: casella{
	string cv;
	ordine ordineInCarico;
	int capacita <- portata_max;
	int tempo;
	int carico;
	int totPercorso;
	
	reflex caricare{}
	reflex scaricare{}
	reflex attendere{}
}
species ordine{
	type Mytuple{
    	prodotto nome_prodotto;
	    string quantita;
	}
	string cv;
	list<Mytuple> prodotti;
}
species prodotto{
	
}

experiment simulazione{}