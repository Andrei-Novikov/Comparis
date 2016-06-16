//
//  Header.swift
//  ImageGallary
//
//  Created by Andrei Novikau on 6/13/16.
//  Copyright © 2016 IntoSoft. All rights reserved.
//

import UIKit

class HeaderInfo: NSObject {
    var DebugMessage = ""
    var IsVerified = false
    var Message = ""
    var RequestKey: Int = -1
    var ResponseType = ""
    var StatusCode: Int = -1
    var StatusMessage = ""
    
    override init() {
        super.init()
    }
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        if let DebugMessage = dict["DebugMessage"] as? String {
            self.DebugMessage = DebugMessage
        }
        if let IsVerified = dict["IsVerified"] as? Bool {
            self.IsVerified = IsVerified
        }
        if let Message = dict["Message"] as? String {
            self.Message = Message
        }
        if let RequestKey = dict["RequestKey"] as? Int {
            self.RequestKey = RequestKey
        }
        if let ResponseType = dict["ResponseType"] as? String {
            self.ResponseType = ResponseType
        }
        if let StatusCode = dict["StatusCode"] as? Int {
            self.StatusCode = StatusCode
        }
        if let StatusMessage = dict["StatusMessage"] as? String {
            self.StatusMessage = StatusMessage
        }
    }
}
