$fn = 64;
$fs = 0.5;

nx = 2;
ny = 1;
size = "large";

dxy_kongs = 70; // lateral spacing between kongs
l = nx*dxy_kongs; // overall length (long dimension)
w = ny*dxy_kongs; // overall width (short dimension)

// Kong grip sizing
d_medium = 38;
t_medium = 20;
d_large = 50;
t_large = 25;
t_wall = 2;

// Base cylinder (should be larger than dxy_kongs for tiling)
d_base = 75;
t_base = 1.2;

for (dx = [1:nx]) {
    for (dy = [1:ny]) {
            translate([(dx-0.5)*dxy_kongs, (dy-0.5)*dxy_kongs, t_base]) {

            // Cylinder
            if (size == "large") {
                difference() {
                    cylinder(h = t_large, d = d_large + 2*t_wall);
                    cylinder(h = t_large, d = d_large);
                }
            } else if (size == "medium") {
                difference() {
                    cylinder(h = t_medium, d = d_medium + 2*t_wall);
                    cylinder(h = t_medium, d = d_medium);
                }
            } else {
                assert(false, "Unknown kong size");
            }
                
            // Base (cylindrical)
            cylinder(h = t_base, d = d_base);
        }
    }
}
