//
//  NamesViewController.swift
//  Camera Order
//
//  Created by Warren Hansen on 7/15/16.
//  Copyright © 2016 Warren Hansen. All rights reserved.
//

import UIKit

class NamesViewController: UIViewController, UITextFieldDelegate {
    
    var owner =     "No Stored Name"
    var job   =     "No Stored Job"
    var prodCo =    "No Stored Info"
    
    @IBOutlet weak var userNameInput: UITextField!
    
    @IBOutlet weak var jobTextFeild: UITextField!
    
    @IBOutlet weak var prodCoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // sending stored names to display  setStoredProd getProdOnly
        userNameInput.text! = ComputerBrain().getNameOnly()
        jobTextFeild.text!  = ComputerBrain().getJobOnly()
        prodCoTextField.text! = ComputerBrain().getProdOnly()
        print("View did load Setup 2nd view")
        //  close keyboard after entry :: this VC is responible for textDisplay
        self.userNameInput.delegate = self
        self.jobTextFeild.delegate = self
        self.prodCoTextField.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // prepare lens data to sugue back to main screen
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "namesToMain" {
            
            // Name + Job section
            owner = userNameInput.text!
            job = jobTextFeild.text!
            prodCo = prodCoTextField.text!
            // write to perm storage
            ComputerBrain().setStoredName(owner)
            ComputerBrain().setStoredJob(job)
            ComputerBrain().setStoredProd(prodCo)
            print("Segue namesToMain")
            Roger_beep?.play()
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
        userNameInput.resignFirstResponder()
        jobTextFeild.resignFirstResponder()
        prodCoTextField.resignFirstResponder()
        return true
        
    }
    
}
