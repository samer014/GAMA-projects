model simulation

global{
	int num_of_human <- 100;
	int human_max_age <- 80;
	int human_min_age <- 1;
	//float young_chance_death <- 5.0;
	//float adult_chance_death <- 15.0;
	//float old_chance_death <- 50.0;
	float born_rate <- 1/40;
	int young_count <- 0;
	int adult_count <- 0;
	int old_count <- 0;
	float adult_chance_unemployed <- 15.0;

	
	int cycle <- 1 #year;
	
	init{
		create person number: num_of_human;
	}
	
	reflex nascite when: every(1 #cycle){
		int n_borns <- born_rate*adult_count;
		create person number: n_borns{
			age <- 1;
		}
	}
	
}


experiment simulation  type:gui {
	
	parameter "number of people" var: num_of_human min:0 max:1000;
	parameter "human max age" var: human_max_age min:0 max: 200;
	parameter "human min age" var: human_min_age min:0 max: 200;
	//parameter "young chance death" var: young_chance_death min: 0.0 max: 100.0;
	//parameter "adult chance death" var: adult_chance_death min: 0.0 max: 100.0;
	//parameter "old chance deat" var: old_chance_death min: 0.0 max:100.0;
	
	output {
		display Popuplatin_information refresh: every(1#cycles) type: 2d{
			chart "my_chart" type: histogram {
				datalist (distribution_of(person collect each.age,20,0,100) at "legend") 
		    	value:(distribution_of(person collect each.age,20,0,100) at "values");	
	    	}
		}
	}
}



species person{
	int age <- rnd(human_min_age,human_max_age);
	string gender <- one_of(["male","female"]);
	string marital_status <- one_of(marital_status_list);
	string age_status;
	string job_status;
	list<string> marital_status_list <- ["bachelor" , "married" , "divorced"];

	aspect default{
		if(gender = "male"){
			draw circle(1) color: #blue border: #black;
		}else{
			draw circle(1) color: #red border: #black;
		}
	}
	
	
	
	reflex life_incrementer when: every(1 #cycle){
		age <- age+1;
	}
	
	reflex age_count_refresher{
		young_count <- length(person where (each.age <= 20));
		adult_count <- length(person where (each.age >=21 and each.age <= 60));
		old_count <- length(person where (each.age <= 61 and each.age >= 80));
	}
	
	reflex status_giver{
		if(age <= 20){
			age_status <- "young";
			marital_status <- "bachelor";
			job_status <- "unemployed";
		}else if(age <= 60){
			age_status <- "adult";
			marital_status <- one_of(marital_status_list);
		}else{
			age_status <- "old";
			int random <- rnd(1,100);
			if(random = 1){
				marital_status <- "bachelor";
			}else if(random <= 10){
				marital_status <- "divorced";
			}else{
				marital_status <- "married";
			}
		}
	}
	
	
	
	reflex die{
		if(age >= human_max_age){
			old_count <- old_count -1;
			do die;
		}/*else{
			float n_rand <- rnd(0.0,100.0);
			if(age_status = "young" and n_rand <= young_chance_death){
			* 	young_count <- young_count -1;
				do die;
			}else if(age_status = "adult" and n_rand <= adult_chance_death){
			* 	adult_count <- adult_count -1;
				do die;
			}else if(n_rand <= old_chance_death){
			* 	old_count <- old_count -1;
				do die;
			}
		}*/
	}
	
	
	
}