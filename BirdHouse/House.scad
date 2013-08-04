// 1.5" diameter entryway
// 6" diameter, 6" tall house

r_entry = 0.75*25;        // entry hole radius (mm)
z_entry = 1.5*25;         // entryway offset from the bottom of the house (mm)

w_perch = 1/4*25;      //
l_perch = 2*25;        //

r_house = 3*25;        // house radius (mm)
h_house =6*25;        // house height (mm)
t_house = 2;         // wall thickness (mm)

r_drainage = 1;      // drainage hole radius (mm)

r_mount = 8/2;       // nail head radius (mm)
w_mount = 2.5/2;         // nail radius (mm)
h_mount = 3*w_mount;

$fn = 80;

// 

union() {
  difference() {
    // Body of the house except for back
    cylinder(r=r_house, h=h_house, center=true);
    translate([0, 0, t_house]) cylinder(r=r_house-t_house, h=h_house, center=true);
    translate([0, r_house, 0]) cube([2*r_house, 2*r_house, 2*h_house], center=true);

    // Entry hole
   translate([0, -r_house, -h_house/2+r_entry+z_entry])
     rotate(v=[1,0,0], a=90) cylinder(r=r_entry, h=10*t_house, center=true);

    // Drainage holes
    translate([r_house/2, -r_house/4, -h_house/2]) cylinder(r=r_drainage, h=2*t_house, center=true);
    translate([0, -r_house/4, -h_house/2]) cylinder(r=r_drainage, h=2*t_house, center=true);
    translate([-r_house/2, -r_house/4, -h_house/2]) cylinder(r=r_drainage, h=2*t_house, center=true);
  };

  // Back of the house with mounting holes
  difference() {
    translate([0, t_house/2, 0]) cube([2*r_house, t_house, h_house], center=true);
    
    for (x_offset = [-r_house/2, r_house/2])
    {
      translate([x_offset,0,0])
        rotate(v=[1,0,0], a=90) cylinder(r=r_mount, h=5*t_house, center=true);
      translate([x_offset,0,5/6*r_mount+h_mount/2])
        cube([w_mount, 5*t_house, h_mount], center=true);
    }
  };

  // Perch
  translate([0, -r_house-l_perch/2+t_house/2, -h_house/2+w_perch/2])
    cube([w_perch, l_perch, w_perch], center=true);

};