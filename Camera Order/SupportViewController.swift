//
//  SupportViewController.swift
//  Camera Order
//
//  Created by Warren Hansen on 7/15/16.
//  Copyright © 2016 Warren Hansen. All rights reserved.
//

import UIKit

var supportText = " "

class SupportViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var supportTextField: UITextView!
    
    @IBOutlet weak var updateBttn: UIButton!
    
    @IBOutlet weak var greyFeild: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show support example for 1st launch unless perm starage has values
        if NSUserDefaults.standardUserDefaults().objectForKey("support") == nil  {
            supportText = "O’Connor fluid head, Tango dutch, Std + Baby Sticks, Hi Hat"
        } else {
            supportTextField.text! = ComputerBrain().getSupportOnly()
        }
        
        // round corners of text feild
        supportTextField.layer.cornerRadius = 8
        updateBttn.layer.cornerRadius = 12

        //  close keyboard after entry :
        self.supportTextField.delegate = self
        
    }
    
    // attemp to round imageview corners
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        greyFeild.layer.cornerRadius = greyFeild.frame.height / 18.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // prepare aks data to sugue back to main screen
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "supportToMain" {
            
            // set supportText var to contents of text window
            if supportTextField.text != nil {
                supportText = supportTextField.text!
            }
            
            // append to equipment list
            equipmentList.append("Support: \(supportText)") // append support to equip list
            print("Prepare \(supportText)")
            equipmentListTitle.append("\(equipmentArray[0][savedCompZero])")
            equipmentListContent.append(supportText)
            myTitle.append("\(equipmentArray[0][savedCompZero])")
            myContent.append(supportText)
            // write to perm storage
            ComputerBrain().setStoredSupport(supportText)
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
        supportTextField.resignFirstResponder()
        return true
        
    }
    


}
