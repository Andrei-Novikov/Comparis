//
//  Coordinates.swift
//  ImageGallary
//
//  Created by Andrei Novikau on 6/13/16.
//  Copyright © 2016 IntoSoft. All rights reserved.
//

import UIKit

class Coordinates: NSObject {
    var Latitude: Double = 0
    var Longitude: Double = 0
    
    override init() {
        super.init()
    }
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        if let Latitude = dict["Latitude"] as? Double {
            self.Latitude = Latitude
        }
        if let Longitude = dict["Longitude"] as? Double {
            self.Longitude = Longitude
        }
    }
}