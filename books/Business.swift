//
//  Business.swift
//  books
//
//  Created by InsZVA on 16/4/8.
//  Copyright © 2016年 InsZVA. All rights reserved.
//

import UIKit

class Business: NSObject {
    static func verifyAdmin(username: String, password: String) -> Bool {
        let db = SQLiteDB.sharedInstance()
        let data = db.query("select admin_id from admin where admin_id=? and password=?;", parameters: [username, password])
        if data.count > 0 {
            let row = data[0] 
            let id = row["admin_id"] as! NSString
            BSession.setSession("admin_id", value: id as String)
            return true
        }
        return false
    }
    
    static func logined() -> Bool {
        return BSession.getSession("admin_id") != ""
    }
    
    static func newBook(type: String, book_id: String, name: String, press: String, author: String, year: Int, price: Float, number: Int) -> Bool {
        let db = SQLiteDB.sharedInstance()
        let result = db.execute("insert into 'book' values(?,?,?,?,?,?,?,?,?);", parameters: [book_id, type, name, press, year, author, price, number, number])
        if result == 0 {
            return false
        }
        return true
    }
    
    static func isNull(str: String?) -> Bool {
        return str != nil && str != ""
    }
    
    static func checkInt(str: String?) -> (Bool, Int) {
        if str == nil {
            return (false, 0)
        }
        let i = Int(str!)
        if i != nil {
            return (true, i!)
        }
        return (false, 0)
    }
    
    static func checkFloat(str: String?) -> (Bool, Float) {
        if str == nil {
            return (false, 0)
        }
        let f = Float(str!)
        if f != nil {
            return (true, f!)
        }
        return (false, 0)
    }
}
