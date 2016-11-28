//
//  FiltersViewController.swift
//  Camera Order
//
//  Created by Warren Hansen on 7/15/16.
//  Copyright © 2016 Warren Hansen. All rights reserved.
//

import UIKit

var filterText = " "

class FiltersViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var filterTextField: UITextView!
    
    @IBOutlet weak var updateButton: UIButton!
    
    @IBOutlet weak var gradBkg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // show filter example for 1st launch unless perm starage has values
        if NSUserDefaults.standardUserDefaults().objectForKey("filter") == nil  {
            filterText = "Diopters, Optical Flat, Nd IR set, Polarizer"
        } else {
            filterTextField.text! = ComputerBrain().getFiltersOnly()
        }
        
        // round corners of text feild
        filterTextField.layer.cornerRadius = 8
        updateButton.layer.cornerRadius = 12
        
        //  close keyboard after entry :
        self.filterTextField.delegate = self

    }

    // attempt to round imageview corners
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        gradBkg.layer.cornerRadius = gradBkg.frame.height / 18.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // prepare aks data to sugue back to main screen
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "filtersToMain" {
            
            // set filterText var to contents of text window
            if filterTextField.text != nil {
                filterText = filterTextField.text!
            }
            
            // change first letters to bold
            let myFont = UIFont(name: "Helvetica", size: 14.0)
            let myAttributes = [
                NSFontAttributeName : myFont!
                ,NSForegroundColorAttributeName : UIColor.blackColor()
                ,NSStrokeColorAttributeName : UIColor.redColor()
                ,NSStrokeWidthAttributeName : -4
            ]
            
            let newString = "Filters: \(filterText)"
            
            let myMutableString = NSMutableAttributedString(string: newString, attributes: myAttributes)
            
            myMutableString.addAttribute(NSFontAttributeName, value: UIFont(name: "Helvetica-Bold", size: 14.0)!, range: NSRange(location: 0, length: 7))
            
            
            
            // append to equipment list
            //equipmentList.attri
            //equipmentList.append("newString.attributedText) // append support to equip list
            equipmentList.append("Filters: \(filterText)") // append support to equip list
            print("Prepare \(filterText)")
            equipmentListTitle.append("\(equipmentArray[0][savedCompZero])")
            equipmentListContent.append(filterText)
            myTitle.append("\(equipmentArray[0][savedCompZero])")
            myContent.append(filterText)
            // write to perm storage
            ComputerBrain().setStoredFilters(filterText)
            Click_2?.play()
            
        }
    }
    
    /*--------------------------------------------------------------------|
    |          close keyboard with click away from text input            |
    ---------------------------------------------------------------------*/
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // return closes keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        filterTextField.resignFirstResponder()
        return true
        
    }
}
