$fn = 32;
$fs = 1;

nx = 3;
ny = 2;
dxy_kongs = 71; // lateral spacing between kongs

l = nx*dxy_kongs; // overall length (long dimension)
w = ny*dxy_kongs; // overall width (short dimension)
t_shelf = 4; // thickness of each layer

w_legs = 4; // width of rails/feet
t_feet = 5; // thickness of feet

g_shelf = 60; // gap between layers

d_lower = 25; // bottom layer diameter
d_upper = 65; // top layer diameter

// Bottom layer
difference() {
    cube([l, w, t_shelf]);
    for (dx = [1:nx]) {
        for (dy = [1:ny]) {
            translate([(dx-0.5)*dxy_kongs, (dy-0.5)*dxy_kongs, 0])
                cylinder(h = t_shelf, d = d_lower);
        }
    }
}

// Top layer
translate([0, 0, t_shelf + g_shelf])
difference() {
    cube([l, w, t_shelf]);
    for (dx = [1:nx]) {
        for (dy = [1:ny]) {
            translate([(dx-0.5)*dxy_kongs, (dy-0.5)*dxy_kongs, 0])
                cylinder(h = t_shelf, d = d_upper);
        }
    }
}

// Feet
for (x = [0, l - w_legs]) {
    for (y = [0, w - w_legs]) {
        translate([x, y, -t_feet])
            cube([w_legs, w_legs, t_feet + 2*t_shelf + g_shelf]);
    }
}
