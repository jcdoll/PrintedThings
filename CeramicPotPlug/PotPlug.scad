d_plug = 40;
h_plug = 3;
d1_hole = 25;
d2_hole = 23;
h_hole = 16;
$fn=40;

union() {
  cylinder(r=d_plug/2, h=h_plug, center=true);
  translate([0,0,h_plug/2]) cylinder(r1=d1_hole/2, r2=d2_hole/2, h=h_hole);
};