//
//  Contact.swift
//  ImageGallary
//
//  Created by Andrei Novikau on 6/13/16.
//  Copyright © 2016 IntoSoft. All rights reserved.
//

import UIKit

class ContactInfo: NSObject {
    var ContactComment = ""
    var ContactName = ""
    var ContactTel = ""
    var VendorContact = ""
    
    override init() {
        super.init()
    }
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        if let ContactComment = dict["ContactComment"] as? String {
            self.ContactComment = ContactComment
        }
        if let ContactName = dict["ContactName"] as? String {
            self.ContactName = ContactName
        }
        if let ContactTel = dict["ContactTel"] as? String {
            self.ContactTel = ContactTel
        }
        if let VendorContact = dict["VendorContact"] as? String {
            self.VendorContact = VendorContact
        }
    }
}