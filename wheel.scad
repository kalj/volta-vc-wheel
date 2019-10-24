nfacets=40;

wheel_width=10;
wheel_diam=20;
wheel_hole_diam=5;
wheel_symplate_width=3;
wheel_rim_thickness=1;
wheel_radplate_width=1;

module wheel() {
    difference() {

        union() {
            // Rim
            difference() {
                cylinder(d=wheel_diam,h=wheel_width,
                         center=true,$fn=nfacets);
                cylinder(d=wheel_diam-2*wheel_rim_thickness,
                         h=wheel_width+2,
                         center=true,$fn=nfacets);
                }

            // Center part
            cylinder(d=wheel_hole_diam+2,
                    h=wheel_width,center=true,
                    $fn=nfacets);

           // Symmetry plate
            cylinder(d=wheel_diam,h=wheel_symplate_width,
                    center=true,$fn=nfacets);

                for(i=[0:2]) {
                    rotate([0,0,i*60])
                        cube([wheel_radplate_width,
                                wheel_diam-.5,
                                wheel_width],
                            center=true);
                }
            }
        cylinder(d=wheel_hole_diam,h=wheel_width+2,center=true,$fn=nfacets);

    }
}

translate([0,0,wheel_width*0.5]) wheel();
