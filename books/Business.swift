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
    
    static func search(type: String?, book_id: String?, var name: String?, var press: String?, author: String?, yearStart: Int?, yearEnd: Int?, priceStart: Float?, priceEnd: Float?) -> [[String: AnyObject]] {
        var whereClause = "select * from book where "
        var cursor = 0
        var parameters = [AnyObject]()
        if book_id != nil && book_id != "" {
            whereClause += "book_id=?"
            parameters.append(book_id!)
            cursor++
        }
        if type != nil && type != "" {
            if cursor > 0 {
                whereClause += " and "
            }
            whereClause += "type = ?"
            parameters.append(type!)
            cursor++
        }
        if name != nil && name != "" {
            if cursor > 0 {
                whereClause += " and "
            }
            name = "%" + name! + "%"
            whereClause += "name like ?"
            parameters.append(name!)
            cursor++
        }
        if press != nil && press != "" {
            if cursor > 0 {
                whereClause += " and "
            }
            whereClause += "press like ?"
            press = "%" + press! + "%"
            parameters.append(press!)
            cursor++
        }
        if author != nil && author != "" {
            if cursor > 0 {
                whereClause += " and "
            }
            whereClause += "author='?'"
            parameters.append(author!)
            cursor++
        }
        if yearStart != nil {
            if cursor > 0 {
                whereClause += " and "
            }
            whereClause += "year>=? and year<=?"
            parameters.append(yearStart!)
            parameters.append(yearEnd!)
            cursor++
        }
        if priceStart != nil {
            if cursor > 0 {
                whereClause += " and "
            }
            whereClause += "price>=? and price<=?"
            parameters.append(priceStart!)
            parameters.append(priceEnd!)
            cursor++
        }
        let db = SQLiteDB.sharedInstance()
        let data = db.query(whereClause, parameters: parameters)
        if data.count > 0 {
            print(data[0]["name"] as! String)
        }
        return data
    }
}
