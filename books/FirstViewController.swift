//
//  FirstViewController.swift
//  books
//
//  Created by InsZVA on 16/4/7.
//  Copyright © 2016年 InsZVA. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var txtBookId: UITextField!
    @IBOutlet weak var txtBookName: UITextField!
    @IBOutlet weak var txtAuthor: UITextField!
    
    @IBOutlet weak var txtType: UITextField!
    @IBOutlet weak var txtPriceEnd: UITextField!
    @IBOutlet weak var txtPriceStart: UITextField!
    @IBOutlet weak var txtPress: UITextField!
    @IBOutlet weak var txtYearStart: UITextField!
    
    @IBOutlet weak var txtYearEnd: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    var db:SQLiteDB!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSearchUp(sender: AnyObject) {
        let viewC = self.storyboard?.instantiateViewControllerWithIdentifier("1") as! BooksViewController
        let book_id = txtBookId.text
        let name = txtBookName.text
        let author = txtAuthor.text
        let type = txtType.text
        let press = txtPress.text
        let yearStart = Int(txtYearStart.text!)
        let yearEnd = Int(txtYearEnd.text!)
        let priceStart = Float(txtPriceStart.text!)
        let priceEnd = Float(txtPriceEnd.text!)
        let data = Business.search(type, book_id: book_id, name: name, press: press, author: author, yearStart: yearStart, yearEnd: yearEnd, priceStart: priceStart, priceEnd: priceEnd)
        viewC.setDataRows(data)
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    


}

