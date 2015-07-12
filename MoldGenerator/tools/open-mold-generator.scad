/*******************************************
 Open-face mold generator script
 Author: Jason Webb
 Website: http://jason-webb.info
********************************************/

// Create a single positive or negative open face mold
module generate_mold(mold_polarity, model_debug) {
	// Negative mold (simple)
	if (mold_polarity < 0) {
		difference() {
			translate([0, 0, mold_depth/2])
				cube([mold_width, mold_height, mold_depth], center = true);
			import_model(model_filename, model_translate, model_scale, model_rotate, model_debug);
		}

	// Positive mold (complex)
	} else if (mold_polarity > 0) {
		difference() {
			union() {
				difference() {
					// Walls and base
					translate([0, 0, mold_depth/2 + base_height/2])
						cube([mold_width, mold_height, mold_depth + base_height], center = true);
				
					// Hollow out the mold, leaving walls and a base
					translate(v = [0,0,25 + base_height])
						if(walls)
							cube([mold_width - wall_thickness*2, mold_height - wall_thickness*2, 50], center = true);
						else
							cube([mold_width, mold_height, 50], center = true);
				}
				import_model(model_filename, model_translate, model_scale, model_rotate, model_debug);
			}

			// Create slot for removable wall
			if(removable_wall) {
				// Remove the old wall
				translate([mold_width/2 - wall_thickness/2, 0, base_height + 25])
					cube([wall_thickness, mold_height - wall_thickness*2, 50], center = true);

				// Create a notch for the removable wall
				translate([mold_width/2 - wall_thickness, 0, base_height + 25])
					cube([removable_wall_thickness + wiggle_room*2, mold_height - wall_thickness + wiggle_room*2, 50], center = true);
			}

			// Remove any geometry popping out from under the mold
			translate([0,0,-50])
				cube([mold_width, mold_height, 100], center = true);
		}

		// Add removable wall
		if(removable_wall)
			translate([mold_width/2 + 5, 0, mold_depth/2])
				cube([removable_wall_thickness, mold_height - wall_thickness, mold_depth], center = true);
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