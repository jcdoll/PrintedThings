d_puck = 55.5;
t_puck = 5;

d_cable = 3;
d_cable_thick = 5;
l_cable_thick = 10; // reinforced no bend section


l_base = 190;
w_base = 95;
t_base = d_cable + 2; // 11.5 mm max depth


difference() {
    union() {
        // Rectangular base
        cube([w_base, l_base, t_base], center = true);
        
        // Thick section surrounding
        cylinder(h = t_puck, d = d_puck + l_cable_thick);
    }
    
    // Charger puck cut out
    cylinder(h = t_puck, d = d_puck);
    
    // Cable slot (thin section)
    cube([d_cable, l_base, d_cable], center = true);
    
    // Cable slot (strain relief section)
    translate([w_base/2, l_base/2 + d_puck/2, 0])
        cube([d_cable_thick, l_cable_thick, d_cable_thick], center = true);
}