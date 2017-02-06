//
//  DemoURL.swift
//
//  Created by CS193p Instructor.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import Foundation

struct DemoURL {
    static let Stanford = NSURL(string: "http://stanford.edu/about/images/intro_about.jpg")
    static let NASA =
        ["Cassini":NSURL(string: "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg"),
        "Earth":NSURL(string: "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg"),
        "Saturn":NSURL(string: "http://www.nasa.gov/sites/default/files/saturn_collage.jpg")]
    
    
    
}
