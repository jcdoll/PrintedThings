$fn = 64;
$fs = 0.5;

// Fully enclosed single shelf design

nx = 2;
ny = 1;

dxy_kongs = 70; // lateral spacing between kongs
l = nx*dxy_kongs; // overall length (long dimension)
w = ny*dxy_kongs; // overall width (short dimension)
t_walls = 2; // thickness of all walls
g_shelf = 60; // height from floor to shelf bottom

d_kong = 55; // top layer diameter

// Top layer
translate([0, 0, g_shelf])
difference() {
    cube([l, w, t_walls]);
    for (dx = [1:nx]) {
        for (dy = [1:ny]) {
            translate([(dx-0.5)*dxy_kongs, (dy-0.5)*dxy_kongs, 0])
                cylinder(h = t_walls, d = d_kong);
        }
    }
}

// Walls and floor
for (x = [0, l - t_walls]) {
    translate([x, 0, 0])
        cube([t_walls, w, g_shelf]);
}
for (y = [0, w - t_walls]) {
    translate([0, y, 0])
        cube([l, t_walls, g_shelf]);
}
cube([l, w, t_walls]);