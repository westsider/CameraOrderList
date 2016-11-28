//
//  PrimesViewController.swift
//  Camera Order
//
//  Created by Warren Hansen on 7/15/16.
//  Copyright © 2016 Warren Hansen. All rights reserved.
//

import UIKit

/*--------------------------------------------------------------------|
 |                    Primes VIEW CONTROLLER                        |
 ---------------------------------------------------------------------*/


//var displayLensArray = ["12mm"]

class PrimesViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var lensSelection: UITableView!
    
    @IBOutlet weak var updateButton: UIButton!
    
    // prepare lens data to sugue back to main screen
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "lensesToMain" {
            
            let convertMutable = NSMutableString(); // convert edited lens package arr-> str
            
            for item in lensArray
            {
                convertMutable.appendFormat("%@ ", item)    // removed comma after %@
            }
            
            equipmentList.append(convertMutable as String) // append lens package to equip list
            // populate array of equipment title and contents
            equipmentListTitle.append("\(equipmentArray[0][savedCompZero]) \(equipmentArray[1][savedCompOne])  \(equipmentArray[2][savedCompTwo])")
            equipmentListContent.append(convertMutable as String)
            myTitle.append("\(equipmentArray[0][savedCompZero]) \(equipmentArray[1][savedCompOne])  \(equipmentArray[2][savedCompTwo])")
            myContent.append(convertMutable as String)
            Click_3?.play()

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create Edit Button
        
        // radius to grad bkg
        updateButton.layer.cornerRadius = 12
        
        // edit buton in nav bar
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //title bar 
        self.navigationItem.title = equipmentArray[2][savedCompTwo]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*--------------------------------------------------------------------|
     |                           Set Up MM Table                           |
     ---------------------------------------------------------------------*/
    
    
    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayLensArray.count
    }
    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "LensCell")
        cell.textLabel?.text = displayLensArray[indexPath.row]
        cell.textLabel?.textAlignment = .Center
        
        // cell text color
cell.textLabel?.text = displayLensArray[indexPath.row] // why is this here twice
        cell.textLabel?.textColor = UIColor.blackColor()
        cell.textLabel!.font = UIFont(name: "Helvetica", size: 14) // Change the font size
        // cell color
        tableView.separatorColor = UIColor.blackColor()
        tableView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 0.5) // lower  tableview cells
        tableView.tableFooterView = UIView()
        cell.backgroundColor =  UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 0.5) // upper prototyped cells
 
        
        return cell
        
    }
    
    // Override to support conditional editing of the table view.
     func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
/*
    
    // Override to support editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            lensArray.removeAtIndex(indexPath.row)
            //displayLensArray.removeLast(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
 */
    /*--------------------------------------------------------------------|
     |                          swipe left deletes                        |
     ---------------------------------------------------------------------*/
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            displayLensArray.removeAtIndex(indexPath.row)
            lensArray.removeAtIndex(indexPath.row)
            lensSelection.reloadData()
        }
    }
    override func viewDidAppear(animated: Bool) {
        lensSelection.reloadData()
    }
}

