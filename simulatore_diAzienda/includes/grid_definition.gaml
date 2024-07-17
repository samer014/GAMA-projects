/**
* Name: grid
* Based on the internal empty template. 
* Author: zetaemme
* Tags: 
*/

model grid_definition

grid Environment width: 100 height: 100 neighbors: 4 {
    rgb color <- #white;
    
    aspect default {
        draw shape color: color border: #black;
    }
}