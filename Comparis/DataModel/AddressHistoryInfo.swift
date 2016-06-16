//
//  AddressHistory.swift
//  ImageGallary
//
//  Created by Andrei Novikau on 6/13/16.
//  Copyright © 2016 IntoSoft. All rights reserved.
//

import UIKit

class AddressHistoryInfo: NSObject {
    var Area: Int = -1
    var Floor: Int = -1
    var HistoryData = [HistoryDataInfo]()
    var LivingSpace: Int = -1
    var PropertyTypeID: Int = -1
    var Rooms: Float = -1
    var SubPropertyTypeID: Int = -1
    
    override init() {
        super.init()
    }
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        if let Area = dict["Area"] as? Int {
            self.Area = Area
        }
        if let Floor = dict["Floor"] as? Int {
            self.Floor = Floor
        }
        if let HistoryData = dict["HistoryData"] as? [[String: AnyObject]] {
            for item in HistoryData {
                self.HistoryData.append(HistoryDataInfo(dict: item))
            }
        }
        if let LivingSpace = dict["LivingSpace"] as? Int {
            self.LivingSpace = LivingSpace
        }
        if let PropertyTypeID = dict["PropertyTypeID"] as? Int {
            self.PropertyTypeID = PropertyTypeID
        }
        if let Rooms = dict["Rooms"] as? Float {
            self.Rooms = Rooms
        }
        if let SubPropertyTypeID = dict["SubPropertyTypeID"] as? Int {
            self.SubPropertyTypeID = SubPropertyTypeID
        }
    }
}
