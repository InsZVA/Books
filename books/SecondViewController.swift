//
//  SecondViewController.swift
//  books
//
//  Created by InsZVA on 16/4/7.
//  Copyright © 2016年 InsZVA. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var txtType: UITextField!
    @IBOutlet weak var txtBookId: UITextField!
    @IBOutlet weak var txtBookName: UITextField!
    @IBOutlet weak var txtPress: UITextField!
    @IBOutlet weak var txtAuthor: UITextField!
    @IBOutlet weak var txtYear: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtCount: UITextField!

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

    @IBAction func onImport(sender: AnyObject) {
        let type = txtType.text
        if type == nil || type == "" {
            let alert = Alert(vc: self)
            alert.show("错误", message: "请输入类别")
            return
        }
        let book_id = txtBookId.text
        if book_id == nil || book_id == "" {
            let alert = Alert(vc: self)
            alert.show("错误", message: "请输入书号")
            return
        }
        let book_name = txtBookName.text
        if book_name == nil || book_name == "" {
            let alert = Alert(vc: self)
            alert.show("错误", message: "请输入书名")
            return
        }
        let press = txtPress.text
        if press == nil || press == "" {
            let alert = Alert(vc: self)
            alert.show("错误", message: "请输入出版社")
            return
        }
        let author = txtAuthor.text
        if author == nil || author == "" {
            let alert = Alert(vc: self)
            alert.show("错误", message: "请输入作者")
            return
        }
        let yearT = txtYear.text
        let yearC = Business.checkInt(yearT)
        if !yearC.0 {
            let alert = Alert(vc: self)
            alert.show("错误", message: "请输入正确的年份")
            return
        }
        let year = yearC.1
        let priceT = txtPrice.text
        let priceC = Business.checkFloat(priceT)
        if !priceC.0 {
            let alert = Alert(vc: self)
            alert.show("错误", message: "请输入正确的价格")
            return
        }
        let price = priceC.1
        let countT = txtCount.text
        let countC = Business.checkInt(countT)
        if !countC.0 {
            let alert = Alert(vc: self)
            alert.show("错误", message: "请输入正确的数量")
            return
        }
        let count = countC.1
        let res = Business.newBook(type!, book_id: book_id!, name: book_name!, press: press!, author: author!, year: year, price: price, number: count)
        if res {
            let alert = Alert(vc: self)
            alert.show("成功！", message: "成功插入！")
            //TODO: clear form
            txtType.text = ""
            txtAuthor.text = ""
            txtBookId.text = ""
            txtBookName.text = ""
            txtCount.text = ""
            txtPress.text = ""
            txtPrice.text = ""
            txtYear.text = ""
        } else {
            let alert = Alert(vc: self)
            alert.show("失败！", message: "插入失败！")
        }
    }

}

