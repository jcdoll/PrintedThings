// Sparrow birdhouse
// 32mm diameter entry hole, TBD above the bottom
// No perch
// 150mm diameter, 150mm tall

r_entry = 32/2;        // entry hole radius (mm)
z_entry = 20;          // entryway offset from the bottom of the house (mm)

r_house = 150/2;       // house radius (mm)
h_house = 150;         // house height (mm)
b_house = 2;           // thickness of the house bottom (mm)
w_house = 1;           // thickness of the house walls (mm)

r_drainage = 2;        // drainage hole radius (mm)
n_drainage = 8;        // number of drainage holes

r_air = 2;             // Air hole radius (mm)
n_air = 8;             // Number of air holes
z_air = 10;            // Air hole offset from the top (mm)

r_mount = 8/2;         // nail head radius (mm)
w_mount = 2.5/2;       // nail radius (mm)
h_mount = 3*w_mount;   // height of the nail slot (mm)

$fn = 80;

// 

union() {
  difference() {
    // Body of the house except for back
    cylinder(r=r_house, h=h_house, center=true);
    translate([0, 0, b_house]) cylinder(r=r_house-w_house, h=h_house, center=true);
    translate([0, r_house, 0]) cube([2*r_house, 2*r_house, 2*h_house], center=true);

    // Entry hole
   translate([0, -r_house, h_house/2-r_entry-z_entry])
     rotate(v=[1,0,0], a=90) cylinder(r=r_entry, h=10*w_house, center=true);

    // Drainage holes
    for (x_offset = [-5/6*r_house : 2*r_house/n_drainage : 5/6*r_house]) {
      translate([x_offset, -r_house/6, -h_house/2])  cylinder(r=r_drainage, h=3*b_house, center=true);
    }

    // Air holes
    for (theta = [20 : 180/n_air : 160]) {
      rotate(v=[0,0,1], a=theta)
        translate([-r_house+w_house,0,h_house/2-z_air]) rotate(v=[0,1,0], a=90)
        cylinder(r=r_air, h=4*w_house, center=true);
    }
  };

  // Back of the house with mounting holes
  difference() {
    translate([0, w_house/2, 0]) cube([2*r_house, w_house, h_house], center=true);
    
    for (x_offset = [-r_house/2, r_house/2])
    {
      translate([x_offset,0,0])
        rotate(v=[1,0,0], a=90) cylinder(r=r_mount, h=5*w_house, center=true);
      translate([x_offset,0,5/6*r_mount+h_mount/2])
        cube([w_mount, 5*w_house, h_mount], center=true);
    }
  };

};