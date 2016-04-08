//
//  FirstViewController.swift
//  books
//
//  Created by InsZVA on 16/4/7.
//  Copyright © 2016年 InsZVA. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var btnSearch: UIButton!
    var db:SQLiteDB!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        if Business.logined() {
            return
        }
        let alert = LoginAlert(viewController: self)
        alert.show({
            (username: String, password: String) -> Void in
            if Business.verifyAdmin(username, password: password) {
                print("ok")
            } else {
                print("fail")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSearchUp(sender: AnyObject) {
        let viewC = self.storyboard?.instantiateViewControllerWithIdentifier("1")
        self.navigationController?.pushViewController(viewC!, animated: true)
    }
    


}

