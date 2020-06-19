$fn = 64;
$fs = 0.5;

nx = 1;
ny = 1;
dxy_kongs = 70; // lateral spacing between kongs

l = nx*dxy_kongs; // overall length (long dimension)
w = ny*dxy_kongs; // overall width (short dimension)

t_cone = 70; // height of support cone
d_lower = 40; // bottom layer diameter
d_upper = 68; // top layer diameter
t_wall = 0.8; // support cone wall thickness

// Base/grid
t_base = 0.8; // thickness of each layer

for (dx = [1:nx]) {
    for (dy = [1:ny]) {
            translate([(dx-0.5)*dxy_kongs, (dy-0.5)*dxy_kongs, 0]) {
                // Cone
                difference() {
                    cylinder(h = t_cone, d1 = d_lower, d2 = d_upper);
                    cylinder(h = t_cone, d1 = d_lower - 2*t_wall, d2 = d_upper - 2*t_wall);
                }
                
                // Base with grid support
                translate([-dxy_kongs/2, -dxy_kongs/2, 0])
                difference() {
                    cube([dxy_kongs, dxy_kongs, t_base]);
                    cylinder(h = t_base, d = dxy_kongs/2);
                    translate([dxy_kongs, 0, 0])
                        cylinder(h = t_base, d = dxy_kongs/2);
                    translate([0, dxy_kongs, 0])
                        cylinder(h = t_base, d = dxy_kongs/2);
                    translate([dxy_kongs, dxy_kongs, 0])
                        cylinder(h = t_base, d = dxy_kongs/2);
                }
        }
    }
}
