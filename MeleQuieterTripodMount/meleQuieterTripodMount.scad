// mele quieter 4c to sky watcher SA GTi leg mount
// all units in mm

$fn = 128;
$fs = 0.15;

rLeg = 15.4;

tCover = 2; // thickness of the printed cover
dCover = 175; // outside diameter of the printed cover
rMagnetInset = 2; // additional inset of the magnets from edge-to-edge alignment

// Magnets are nominally 8mm dia x 1 mm thick - include one layer of extra thickness to ensure that they are flush
dMagnet = 8;
tMagnet = 1.25;

debugMode = false;

if (!debugMode) {
    // Full part
    difference() {
        cylinder(h = tCover, d = dCover);
        for (theta = [0:90:270]) {
            translate(
            [(dCover/2-rMagnetInset-dMagnet/2)*sin(theta),
            (dCover/2-rMagnetInset-dMagnet/2)*cos(theta),
            tCover - tMagnet])
                cylinder(h = 3*tMagnet, d = dMagnet + 2*epsInterference);
        }
    }
} else {
    difference() {
        cylinder(h = tCover, d = 1.5*dMagnet);
        translate([0, 0, tCover - tMagnet])
        cylinder(h = 3*tMagnet, d = dMagnet);
    }
}
