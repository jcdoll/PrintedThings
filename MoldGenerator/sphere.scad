include <tools/closed-mold-generator.scad>;

// Model parameters
model_filename = "inputs/sphere.stl";
model_rotate = [0,0,0];
model_translate = [0,0,10];
model_scale = 1;
model_debug = 0;

// Mold parameters
mold_width = 45;			// Measured along X axis
mold_height = 45;			// Measured along Y axis
mold_depth = 20;			// Measured along Z axis
mold_spacing = 10;		// Space between mold halves
rounded_corners = true; // Round the corners to reduce warping?
edge_radius = 8;			// Radius of rounded corners

// Key parameters (registration marks)
key_size = 3;		// Radius of spherical keys
key_fettle = 0.4;	// Size difference between keys and corresponding holes
key_margin = 7;	// Distance from outside edge of mold

// Pour hole parameters
pour_hole_r1 = 8;			// First radius of cylindrical pour hole
pour_hole_r2 = 3;				// Second radius (make r2 < r1 to make a funnel)
pour_hole_height = 6;		// Height of the pour hole
pour_hole_translate = [0, 0, -mold_depth/2];
pour_hole_rotate = [0, 0, ];


$fn = 20;
generate_mold(model_debug);