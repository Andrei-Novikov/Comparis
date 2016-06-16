//
//  RedirectLinksInfo.swift
//  ImageGallary
//
//  Created by Andrei Novikau on 6/13/16.
//  Copyright © 2016 IntoSoft. All rights reserved.
//

import UIKit

class RedirectLinksInfo: NSObject {
    var IsClickable = false
    var SiteName = ""
    var TrackingUrls = [String]()
    var Url = ""
    
    override init() {
        super.init()
    }
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        if let IsClickable = dict["IsClickable"] as? Bool {
            self.IsClickable = IsClickable
        }
        if let SiteName = dict["SiteName"] as? String {
            self.SiteName = SiteName
        }
        if let TrackingUrls = dict["TrackingUrls"] as? [String] {
            self.TrackingUrls = TrackingUrls
        }
        if let Url = dict["Url"] as? String {
            self.Url = Url
        }
    }
}