//
//  BooksViewController.swift
//  books
//
//  Created by InsZVA on 16/4/8.
//  Copyright © 2016年 InsZVA. All rights reserved.
//

import UIKit

class BooksViewController: UITableViewController {
    
    var data = [[String: String]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reusedCell", forIndexPath: indexPath)

        // Configure the cell...
        let labelName = cell.viewWithTag(2) as! UILabel
        labelName.text = data[indexPath.row]["name"]
        let labelId = cell.viewWithTag(1) as! UILabel
        labelId.text = data[indexPath.row]["book_id"]
        let labelAuthor = cell.viewWithTag(3) as! UILabel
        labelAuthor.text = data[indexPath.row]["author"]
        let labelYear = cell.viewWithTag(4) as! UILabel
        labelYear.text = data[indexPath.row]["year"]
        let labelPress = cell.viewWithTag(5) as! UILabel
        labelPress.text = data[indexPath.row]["press"]
        let labelPrice = cell.viewWithTag(6) as! UILabel
        labelPrice.text = data[indexPath.row]["price"]
        return cell
    }
    
    func setDataRows(data: [[String: AnyObject]]) {
        for var i = 0;i < data.count;i++ {
            let temp = ["book_id": data[i]["book_id"] as! String,
                "name": data[i]["name"] as! String,
                "press": data[i]["press"] as! String,
                "year": String(data [i]["year"] as! NSNumber),
                "price": String(data[i]["price"] as! NSNumber),
                "author": data[i]["author"] as! String,
            ]
            self.data.append(temp)
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
