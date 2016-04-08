//
//  LoginAlert.swift
//  books
//
//  Created by InsZVA on 16/4/8.
//  Copyright © 2016年 InsZVA. All rights reserved.
//

import UIKit

class LoginAlert: NSObject {
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func show(callback: (String, String) -> Void) {
        var username = "", password = ""
        let alert = UIAlertController(title: "请您登陆", message: "请先输入管理员账号和密码：", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addTextFieldWithConfigurationHandler{(textField: UITextField!) -> Void in
            textField.placeholder = "admin_id"
        }
        alert.addTextFieldWithConfigurationHandler{(textField: UITextField!) -> Void in
            textField.placeholder = "password"
            textField.secureTextEntry = true
        }
        let loginAction = UIAlertAction(title: "登陆", style: UIAlertActionStyle.Default, handler:{
            (action: UIAlertAction!) -> Void in
            let usernameT = alert.textFields!.first as UITextField!
            username = usernameT.text!
            let passwordT = alert.textFields!.last as UITextField!
            password = passwordT.text!
            callback(username, password)
        }
        )
        alert.addAction(loginAction)
        viewController.presentViewController(alert, animated: true, completion: nil)
    }

}
