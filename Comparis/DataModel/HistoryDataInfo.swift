//
//  HistoryDataInfo.swift
//  ImageGallary
//
//  Created by Andrei Novikau on 6/13/16.
//  Copyright © 2016 IntoSoft. All rights reserved.
//

import UIKit

class HistoryDataInfo: NSObject {
    var CurrencyID: Int = -1
    var Price: Int = -1
    var PriceChangeDate = ""
    
    override init() {
        super.init()
    }
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        if let CurrencyID = dict["CurrencyID"] as? Int {
            self.CurrencyID = CurrencyID
        }
        if let Price = dict["Price"] as? Int {
            self.Price = Price
        }
        if let PriceChangeDate = dict["PriceChangeDate"] as? String {
            self.PriceChangeDate = PriceChangeDate
        }
    }
}
