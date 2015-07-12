include <tools/open-mold-generator.scad>;

// STL import and scaling parameters
model_filename = "inputs/Mr.Jawsv2.stl";
model_scale = [1,1,0.5];
model_translate = [0,0,2.5];
model_rotate = [0,0,0];
model_debug = 0;

// Mold parameters
// Mold polarity can be positive (>0) or negative(<0)
mold_polarity = -1;
mold_width = 80;
mold_height = 30;
mold_depth = 8;

generate_mold(mold_polarity, model_debug);
