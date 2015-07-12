/*************************************************
Parametric two-part mold generator
Author: Jason Webb
Website: http://jason-webb.info

With modifications by: Joey Doll

A parametric two-part mold generator that constructs two-
part molds with registration marks based on STL files.
*************************************************/

// Create the two mold halves and offset along the x-axis
module generate_mold(model_debug) {
	// Left (bottom) half)
	translate([mold_width/2 + mold_spacing/2, 0, mold_depth/2])
		bottom_half(model_debug);
		
	// Right (top) half
	translate([-mold_width/2 - mold_spacing/2, 0, mold_depth*3/2]) rotate([0, 180, 0])
		top_half(model_debug);
}

/*******************************************
 Bottom half of the mold
********************************************/
module bottom_half(model_debug) {
	// Create the mold form with negative keys
	difference() {

		// Create the basic mold form by subtracting the STL from a cube half it's size
		difference() {
			if(rounded_corners) 
				roundedBox([mold_width, mold_height, mold_depth], edge_radius);
			else
				cube(size = [mold_width, mold_height, mold_depth], center = true);
			import_model(model_filename, model_translate, model_scale, model_rotate, model_debug);
		}

		// Negative key 1
		translate([-mold_width/2 + key_margin, -mold_height/2 + key_margin, mold_depth/2])
			sphere(key_size + key_fettle);

		// Negative key 2
		translate([mold_width/2 - key_margin, mold_height/2 - key_margin, mold_depth/2])
			sphere(key_size + key_fettle);

		// Pour hole
		translate(pour_hole_translate)
			rotate(pour_hole_rotate)
				cylinder(pour_hole_height, pour_hole_r1, pour_hole_r2);
	}

	// Positive key 1
	translate(v = [-mold_width/2 + key_margin, mold_height/2 - key_margin, mold_depth/2])
		sphere(r = key_size);

	// Positive master key
	translate(v = [mold_width/2 - key_margin, -mold_height/2 + key_margin, mold_depth/2])
		sphere(r = key_size);
}

/*******************************************
 Top half of the mold
********************************************/
module top_half(model_debug) {
	// Create the mold form with negative keys
	difference() {

		// Create the mold form by subtracting the STL from a cube half it's size
		difference() {
			translate([0, 0, mold_depth])
				if(rounded_corners) 
					roundedBox([mold_width, mold_height, mold_depth], edge_radius);
				else
					cube(size = [mold_width, mold_height, mold_depth], center = true);
				import_model(model_filename, model_translate, model_scale, model_rotate, model_debug);
		}

		// Negative master key
		translate(v = [mold_width/2 - key_margin, -mold_height/2 + key_margin, mold_depth/2])
			sphere(key_size + key_fettle);

		// Negative key 2
		translate(v = [-mold_width/2 + key_margin, mold_height/2 - key_margin, mold_depth/2])
			sphere(key_size + key_fettle);

		// Pour hole
		translate(pour_hole_translate)
			rotate(pour_hole_rotate)
				cylinder(pour_hole_height, pour_hole_r1, pour_hole_r2);
	}

	// Positive key 1
	translate(v = [mold_width/2 - key_margin, mold_height/2 - key_margin, mold_depth/2])
		sphere(key_size);

	// Positive key 2
	translate(v = [-mold_width/2 + key_margin, -mold_height/2 + key_margin, mold_depth/2])
		sphere(key_size);
}

// Generate a box with rounded sides (for rectangular mold)
module roundedBox(size, radius)
{
	cube(size - [2*radius,0,0], true);
	cube(size - [0,2*radius,0], true);
	for (x = [radius-size[0]/2, -radius+size[0]/2],
		 y = [radius-size[1]/2, -radius+size[1]/2]) {
		translate([x,y,0]) cylinder(r=radius, h=size[2], center=true);
	}
}

module import_model(model_filename, model_translate, model_scale, model_rotate, model_debug) {
	translate(model_translate) scale(model_scale) rotate(model_rotate)
	if (model_debug) {
		% import(model_filename);
	} else {
		import(model_filename);
	}
}
