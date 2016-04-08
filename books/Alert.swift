//
//  Alert.swift
//  books
//
//  Created by InsZVA on 16/4/8.
//  Copyright © 2016年 InsZVA. All rights reserved.
//

import UIKit

class Alert: NSObject {
    var viewController: UIViewController
    
    init(vc: UIViewController) {
        self.viewController = vc
    }
    
    func show(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(okAction)
        viewController.presentViewController(alert, animated: false, completion: nil)
    }
}
