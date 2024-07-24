# GAMA-projects
griglia NxM

al centro c'è l'azienda colore rosso
clienti in modo randomico nella griglia (rand x, rand y) una casella cliente non ha più di due caselle vicine, casella cliente è blu

cliente

-cv
-posizione
-magazzino
-ordine in corso
-ordine
-cronologia ordini

cv = codice univoco (stringa)
posizione = point
magazzino = lista di tuple che contengono nome prodotto e quantità
ordine in corso = boolean true se ordine in corso, null se non c'è nessun ordine, appena ordine in corso diventa true si attiva un timer di "1h"
ordine = una specie che può essere null
cronologia = cronologia di ordini, lista di ordini


azienda

-cv
-posizione
-listino lista prodotti
-magazzino
-portata_max
-flotta
-storico ordini
-documento

listino lista prodotti = una variabile pubblica che può essere usata nel globale, contiene la lista dei prodotti disponibili alla vendita nella azienda
portata_max = variablie pubblica di quanto può ordinare un cliente
flotta = lista di camion a disposizione
storico ordini = ordini per i camionisti che usa l'algorimo FIFO(First In First Out)
documento = contiene i codici univici del cliente, camion, ordine ed azienda


camion

-cv
-posizione
-ordine in carico
-capacità
-tempo di consegna
-carico
-tot quadratini percorsi

ordine in carico = boolean che è true se il camion ha con se del carico o null se è in azienda in attesa di un ordine
capacità = numero prodotti che può portare il camion il numero è uguale a portata_max della azienda
tempo di consegna = 1 ora
tot quadratini percorsi = quanti quadrati ha percorso per consegnare l'ordine


ordine

-cv
-lista prodotti
-cv cliente
-cv camion

lista profotti = lista di tuple lunga portata_max che contengono nome prodotto e quantità alcune tuple possono essere null


prodotto

-cv
