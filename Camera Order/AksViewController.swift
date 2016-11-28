//
//  AksViewController.swift
//  Camera Order
//
//  Created by Warren Hansen on 7/15/16.
//  Copyright © 2016 Warren Hansen. All rights reserved.
//

import UIKit

var aksText = " "

var normalTextOutput = " "

var normalStringOutput = NSMutableAttributedString(string:normalTextOutput)

class AksViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var aksMultiTextInput: UITextView!
    
    @IBOutlet weak var updateButton: UIButton!
    
    @IBOutlet weak var gradImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show aks example for 1st launch unless perm starage has values
        if NSUserDefaults.standardUserDefaults().objectForKey("aks") == nil  {
            aksText = "7in on board, Remote focus, Splash bag, Hand held rig"
        } else {
            aksMultiTextInput.text! = ComputerBrain().getAKSOnly()
        }
        
        // round corners of text feild
        aksMultiTextInput.layer.cornerRadius = 8
        updateButton.layer.cornerRadius = 12
        //  close keyboard after entry
        self.aksMultiTextInput.delegate = self
        
    }
    
    // attempt to round imageview corners
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        gradImage.layer.cornerRadius = gradImage.frame.height / 18.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // prepare aks data to sugue back to main screen
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "aksToMain" {
            
            // set aksText var to contents of text window
            if aksMultiTextInput.text != nil {
                aksText = aksMultiTextInput.text
            }
            
            // append to equipment list
            equipmentList.append("Aks: \(aksText)") // append lens package to equip list
            print("Prepare \(aksText)")
            equipmentListTitle.append("\(equipmentArray[0][savedCompZero])")
            equipmentListContent.append(aksText)
            myTitle.append("\(equipmentArray[0][savedCompZero])")
            myContent.append(aksText)
            // write to perm storage
            ComputerBrain().setStoredAKS(aksText)
            click_1?.play()
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
        aksMultiTextInput.resignFirstResponder()
        return true
        
    }
    
}
