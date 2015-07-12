include <tools/open-mold-generator.scad>;

// STL import and scaling parameters
model_filename = "inputs/coolpyramid.stl";
model_scale = 5;
model_translate = [-45,-15,33];
model_rotate = [180,0,0];
model_debug = 0;

// Mold parameters
// Mold polarity can be positive (>0) or negative(<0)
mold_polarity = -1;
mold_width = 40;
mold_height = 40;
mold_depth = 32;

generate_mold(mold_polarity, model_debug);
