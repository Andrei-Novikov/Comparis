//
//  LocationFactorsInfo.swift
//  ImageGallary
//
//  Created by Andrei Novikau on 6/13/16.
//  Copyright © 2016 IntoSoft. All rights reserved.
//

import UIKit

class LocationFactorsInfo: NSObject {
    var Exposition = ""
    var Gradient = ""
    var Height: Int = -1
    var SunshineHoursSummer: Int = -1
    var SunshineHoursWinter: Int = -1
    
    override init() {
        super.init()
    }
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        if let Exposition = dict["Exposition"] as? String {
            self.Exposition = Exposition
        }
        if let Gradient = dict["Gradient"] as? String {
            self.Gradient = Gradient
        }
        if let Height = dict["Height"] as? Int {
            self.Height = Height
        }
        if let SunshineHoursSummer = dict["SunshineHoursSummer"] as? Int {
            self.SunshineHoursSummer = SunshineHoursSummer
        }
        if let SunshineHoursWinter = dict["SunshineHoursWinter"] as? Int {
            self.SunshineHoursWinter = SunshineHoursWinter
        }
    }
}