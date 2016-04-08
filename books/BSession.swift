//
//  BSession.swift
//  books
//
//  Created by InsZVA on 16/4/7.
//  Copyright © 2016年 InsZVA. All rights reserved.
//

import UIKit

class BSession: NSObject {
    static var session: Dictionary<String, String> = Dictionary<String, String>()
    
    static func setSession(key: String, value: String) {
        self.session.updateValue(value, forKey: key)
    }
    
    static func getSession(key: String) -> String {
        if (self.session[key] != nil) {
            return self.session[key]!
        }
        return ""
    }
    
    static func removeSession(key :String) {
        self.session.removeValueForKey(key)
    }
}
