// soffit vent cover for 6 inch famco vent
// for use during wildfire season to limit smoke ingress on intake vents
// cover snaps into place without removing it from the house
//
// https://www.famcomfg.com/product/round-soffit-under-eave-vent-plastic-6-inch/
// https://www.amazon.com/Plastic-Under-Eave-Vent-Brown/dp/B01DLDAHLO
//
// approach: embed magnets in the soffit vent (one-time install) and the printed cover

$fn = 128;
$fs = 0.15;

epsInterference = 0.2; // fudge factor for tuning interferene fit of the magnets in the cover (we want a snug fit or use epoxy)

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
