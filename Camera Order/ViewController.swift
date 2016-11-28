//
//  ViewController.swift
//  Camera Order
//
//  Created by Warren Hansen on 6/16/16.
//  Copyright © 2016 Warren Hansen. All rights reserved.
//
//  6/16 correctly fill array in print
//  correctly show array on text output
//  add logic for 3 wheels
//  show logic on text display
//  add table view
//  edit table view
//  add name + job + date
//  6/20 canon array too small causes out of range error
//  finish addin bulk of the equipment
//  add email
//  add save file as title * date
//  add open file
//  add keyboard
//  add delete in list
//  add set up = job entry + Name entry
//  remove delete
//  first camera item comes up blank
//  not reloading saved names on main screen, not adding job to date ect
//  can add but not update equipment list array from 2nd view need to update pos and 1 not add
//  6/23/2016   Big day dove deeper into classes and:
//  fixed perm storage + added classes to handle saving perm storage + loading name + Job Names
//  organizd into classes and functions for better flow!!!
//  6/24    attempted to put global vars and savedCompZero into classes did not acheive
//  add version control
//  6/25 clicking away from keyboard to hide, lost todays work because i didnt understand version control
//  have array sort and trunc first letter working in a playground
//  7/3 moving on from arraysort, will solve later
//  add mm  & make  deletable
//  need string that is mutated as global var to return
//  adding any prime pulls mm list up, then return adds it to array and list
//  add aks items
//  7/4
//  add support items
//  fix return from mail
//  add Filters
//  make filters support and AKS persistant
//  BKG doesnt fill full screen
//  AKS prints 4x
//  7/5
//  make GUI pretty
//  change name - not happening, causes errors
//  7/6
//  load and user icons
//  app icon
//  launch screen
//  7/8
//  add custom mm for current lenses
//  add every cam + lens + mm on camtec site
//  7/9
//  insert anamorphic to center wheel  Primes: anamorphic:
//  7/10 - 11 moved to guest house
//  7/12 - 16
//  rebuild app with proper name and navigation controller
//  New Design in Sketch
//  Add min focus + T stop to lenses
//  selecting Vantage row 2 comp 1 causes crash
//  fix default aks support prints Aks multi
//  fix back button to back
//  possible to have lens selection title be the lens kit?
//  7/20 not able to bold font for title
//  7/21 add some sound
//  default aks + filter
//  use " in text string
//  solved Bold font
//  extra quotes on filters
//  checked fit on iphone 5
//  7/22 add quotes to job name
//  email caps
//  add production company
//  primes not deleting properly
//  fix user update button too big
//  get rid of double space in mail
//  7/23  add more sounds
//  add zoom & probes Tstop min focus
//  splash screen
//  move splash left
//  7/25 new icon
//  7/26 itunes connect
//  test flight beta testing
//  provisioning profiles
//  upload to app store
//  keyboard obscures prod name
//  when list edited.. does not change email

//  send test to Tom + Richard
//  screen shots + description
//  website
//  submit app

//  add sort for list cam -> support
//  is there a way to swipe up to re arrage equipment order?
//  add border to cells, text input and picker?
//  Unsolved Add buttton to navigation bar to edit tableview
//  Unsolved return from lens selection with a saved picker state - remember where picker was
//  Unsolved make mail bold



import UIKit
import MessageUI
import AVFoundation

/*--------------------------------------------------------------------|
 |                           MAIN VIEW CONTROLLER                      |
 ---------------------------------------------------------------------*/

// global vars for all classes to access - These need to become classes or structs to be more professional
var equipmentList:[String]   = []   //array of items on the camera order
var equipmentListBold:[String]   = []   //array of items on the camera order

var equipmentListTitle:[String]   = []   //array of items on the camera order
var equipmentListContent:[String]   = []   //array of items on the camera order
var myTitle:[String]   = []   //array of items on the camera order
var myContent:[String]   = []   //array of items on the camera order

var typeArray   = ["Camera: ", "Primes:","Macros:","Probe Lens: ","Zoom Lens: ","AKS:","Finder:","Filters:","Support:"]
var MidArray    = ["Arri", "Red","Phantom","Panavision","Sony"," ", " ", " ", " ", " ", " ", " ", " "]
var lastArray   = ["Alexa Mini", "Amira", "Alexa", "Alexa XT+","Alexa +XR","Alexa ST XR","Alexa M",
                   "235", "535B", "435", "Arricam LT", "Arricam ST", "SR3", "416"]
var equipmentArray:[[String]] = [[" ", " ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " ", " "],[" ", " ", " ", " ", " ", " ", " ", " "]] // 2D array of all the gear
//var equipmentArray:[[String]] = [["a","b","c"],["d","e","f"],["g","h","i"]] // 2D array of all the gear
var lensArray   = ["12mm", "14mm", "16mm", "18mm", "21mm", "25mm", "27mm","32mm", "35mm","40mm", "50mm", "65mm", "75mm", "100mm", "135mm", "150mm"]
var displayLensArray = ["12mm", "14mm", "16mm", "18mm", "21mm", "25mm", "27mm","32mm", "35mm","40mm", "50mm", "65mm", "75mm", "100mm", "135mm", "150mm"]
var savedCompZero       = 0
var savedCompOne        = 0
var savedCompTwo        = 0
//var savedState = [savedCompZero, savedCompOne, savedCompTwo]
var savedComponent      = 0
var primeSelected       = false
var selectedLenses      = "18mm"
let ltGray = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 0.5)    // universal cell color
//sounds in other controllers
var click_1: AVAudioPlayer?
var Click_2: AVAudioPlayer?
var Click_3: AVAudioPlayer? //  Click_3?.play()
var Roger_beep:AVAudioPlayer?

class ViewController: UIViewController,  UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDelegate, MFMailComposeViewControllerDelegate , UITextFieldDelegate, UINavigationControllerDelegate {
    
    var buttonBeep : AVAudioPlayer?
    var secondBeep : AVAudioPlayer?
    var picker_01 : AVAudioPlayer?
    var picker_02 : AVAudioPlayer?
    var picker_03 : AVAudioPlayer?
    var PLUS_pan__tone: AVAudioPlayer?
    var Etrenitys_interface_1: AVAudioPlayer?
    var Etrenitys_interface_2: AVAudioPlayer?
    var Etrenitys_interface_3: AVAudioPlayer?
    var Roger_beep:AVAudioPlayer?
 
    
    @IBOutlet weak var myPicker: UIPickerView!
    
    @IBOutlet weak var textDisplay: UITextField!
    
    // add equipment to list
    @IBAction func addButton(sender: UIButton) {
        // we selected a prime add mm
        if ( savedCompZero == 1 || savedCompZero == 2 || savedCompZero == 3 )
        {
            PLUS_pan__tone?.play()
            // save state
            //savedState = [savedCompZero, savedCompOne, savedCompTwo]
            // add to equip list then redraw redraw
            equipmentList.append(textDisplay.text!)
            
            viewDidAppear(true)
            // go to lenses view
            performSegueWithIdentifier("mainToLenses", sender: sender)
        }
        else  if ( savedCompZero == 5 ) {
            secondBeep?.play()
            // save state AKS
            //savedState = [savedCompZero, savedCompOne, savedCompTwo]
            // go to AKS view
            performSegueWithIdentifier("mainToAKS", sender: sender)
        }
        else  if ( savedCompZero == 7 ) {
            picker_01?.play()
            // save state FILTERS
            //savedState = [savedCompZero, savedCompOne, savedCompTwo]
            // go to filter view
            performSegueWithIdentifier("mainToFilter", sender: sender)
        }
        else  if ( savedCompZero == 8 ) {
            picker_02?.play()
            // save state Support
            //savedState = [savedCompZero, savedCompOne, savedCompTwo]
            // go to Support view
            performSegueWithIdentifier("mainToSupport", sender: sender)
        }
        else // we didnt select a prime just add to list
        {
            picker_03?.play()
            // save state
            //savedState = [savedCompZero, savedCompOne, savedCompTwo]
            // add to equip list then redraw redraw
            equipmentList.append(textDisplay.text!)
            // populate array of equipment title and contents
            equipmentListTitle.append(equipmentArray[0][savedCompZero])
            equipmentListContent.append("\(equipmentArray[1][savedCompOne])  \(equipmentArray[2][savedCompTwo])")
            myTitle.append(equipmentArray[0][savedCompZero])
            myContent.append("\(equipmentArray[1][savedCompOne])  \(equipmentArray[2][savedCompTwo])")
            viewDidAppear(true)
            
        }
    }
    
    @IBOutlet weak var equipListTabel: UITableView!
    
    // send cam list thru email
    @IBAction func mailButton(sender: UIBarButtonItem) {  sendEmail()
        Roger_beep?.play()
    }
    
    // save the default camera order
    @IBAction func saveThisList(sender: UIBarButtonItem) {
        //NSUserDefaults.standardUserDefaults().setObject(equipmentList, forKey: "Default")
        NSUserDefaults.standardUserDefaults().setObject(equipmentListTitle, forKey: "DefaultTitle")
        NSUserDefaults.standardUserDefaults().setObject(equipmentListContent, forKey: "DefaultContent")
    }
    
    // load the default camera order
    @IBAction func openList(sender: UIBarButtonItem) {  openDefaultFile()
    }
    private var equipMe = Equipment()   // initialize the class I created to control picker logic
    
    /*--------------------------------------------------------------------|
     |                 Add Sound before view did load                     |
     ---------------------------------------------------------------------*/
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer?  {
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        var audioPlayer:AVAudioPlayer?
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("Player not available")
        }
        
        return audioPlayer
    }
    
    /*--------------------------------------------------------------------|
     |                              View Did Load                         |
     ---------------------------------------------------------------------*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textDisplay.adjustsFontSizeToFitWidth = true // adjust width of selection
        // set access to sounds
        if let buttonBeep = self.setupAudioPlayerWithFile("ButtonTap", type:"wav") {
            self.buttonBeep = buttonBeep    }
        if let secondBeep = self.setupAudioPlayerWithFile("SecondBeep", type:"wav") {
            self.secondBeep = secondBeep    }
        if let picker_01 = self.setupAudioPlayerWithFile("picker_01", type:"mp3") {
            self.picker_01 = picker_01  }
        if let picker_02 = self.setupAudioPlayerWithFile("picker_02", type:"mp3") {
            self.picker_02 = picker_02  }
        if let picker_03 = self.setupAudioPlayerWithFile("picker_03", type:"mp3") {
            self.picker_03 = picker_03  }

        if let PLUS_pan__tone = self.setupAudioPlayerWithFile("PLUS_pan__tone", type:"wav") {
            self.PLUS_pan__tone = PLUS_pan__tone  }
        if let Etrenitys_interface_1 = self.setupAudioPlayerWithFile("Etrenitys_interface_1", type:"wav") {
            self.Etrenitys_interface_1 = Etrenitys_interface_1  }
        if let Etrenitys_interface_2 = self.setupAudioPlayerWithFile("Etrenitys_interface_2", type:"wav") {
            self.Etrenitys_interface_2 = Etrenitys_interface_2  }
        if let Etrenitys_interface_3 = self.setupAudioPlayerWithFile("Etrenitys_interface_3", type:"wav") {
            self.Etrenitys_interface_3 = Etrenitys_interface_3  }
        if let Roger_beep = self.setupAudioPlayerWithFile("Roger_beep", type:"mp3") {
            self.Roger_beep = Roger_beep  }
        
        setUpPicker()                   // set initial values for picker wheels
        populateEquipmentListTableBold()
        self.textDisplay.delegate = self       //  close keyboard after entry :: this VC is responible for textDisplay
        
        // Set Nav Bar Font
        let titleLabel = UILabel()
        
        let attributes: NSDictionary = [
            NSFontAttributeName:UIFont(name: "Helvetica", size: 20)!,
            NSForegroundColorAttributeName:UIColor.whiteColor(),
            NSKernAttributeName:CGFloat(5.7)
        ]
        
        let attributedTitle = NSAttributedString(string: "Camera Order", attributes: attributes as? [String : AnyObject])
        
        titleLabel.attributedText = attributedTitle
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
        
        // set color of nav bar
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.70, green: 0.70, blue: 0.70, alpha: 1.0)
        
        // set text of back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: nil, action: nil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        // wider nav bar
        self.navigationController!.navigationBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 65)
        equipListTabel.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    /*--------------------------------------------------------------------|
     |                Set Up TableView of Equipment List                  |
     ---------------------------------------------------------------------*/
    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return equipmentListTitle.count
    }
    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = equipmentListTitle[indexPath.row]
        cell.detailTextLabel?.text = equipmentListContent[indexPath.row]
        // cell color
        tableView.separatorColor = UIColor.blackColor()
        tableView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 0.5) // lower  tableview cells
        //tableView.tableFooterView = UIView()
        cell.backgroundColor =  UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 0.5) // upper prototyped cells
        reloadComponentsAndText()
        return cell
    }
  /*
 this is how you set up a table at udacity
 
 class ViewController: UIViewController, UITableViewDataSource {
 
 // Use this string property as your reuse identifier,
 // Storyboard has been set up for you using this String.
 let cellReuseIdentifier = "MyCellReuseIdentifier"
 
 // Choose some data to show in your table
 
 let model = [
 ["text" : "Do", "detail" : "A deer. A female deer."],
 ["text" : "Re", "detail" : "A drop of golden sun."],
 ["text" : "Mi", "detail" : "A name, I call myself."],
 ["text" : "Fa", "detail" : "A long long way to run."],
 ["text" : "So", "detail" : "A needle pulling thread."],
 ["text" : "La", "detail" : "A note to follow So."],
 ["text" : "Ti", "detail" : "A drink with jam and bread."]
 ]
 
 // Add the two essential table data source methods here
 
 func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 return self.model.count;
 }
 
 func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
 let cell =  tableView.dequeueReusableCellWithIdentifier(self.cellReuseIdentifier)!
 
 let dictionary = self.model[indexPath.row]
 
 cell.textLabel?.text = dictionary["text"]
 cell.detailTextLabel?.text = dictionary["detail"]
 
 return cell
 }
 
 }
 */
    /*--------------------------------------------------------------------|
     |                          swipe left deletes                        |
     ---------------------------------------------------------------------*/
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            equipmentListTitle.removeAtIndex(indexPath.row)
            equipmentListContent.removeAtIndex(indexPath.row)
            // edit mail list
            myTitle.removeAtIndex(indexPath.row)
            myContent.removeAtIndex(indexPath.row)
            equipListTabel.reloadData()
        }
    }
    
    /*--------------------------------------------------------------------|
     |                Set up Picker Wheel of equipment                    |
     ---------------------------------------------------------------------*/
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return equipmentArray.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return equipmentArray[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return equipmentArray[component][row]
    }
    
    /*---------------------------------------------------------------------|
     |               Custom Fonts for Picker View                          |
     ----------------------------------------------------------------------*/
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.blackColor()
        pickerLabel.text = equipmentArray[component][row]
        //pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 16)
        pickerLabel.font = UIFont(name: "Helvetica", size: 18) // In this use your custom font
        pickerLabel.textAlignment = NSTextAlignment.Center
        textDisplay.textColor = UIColor.blackColor()
        pickerLabel.adjustsFontSizeToFitWidth = true
        return pickerLabel
    }
    
    /*--------------------------------------------------------------------|
     |                detect picker wheel movement                        |
     ---------------------------------------------------------------------*/
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print( "Wheel move Comp: \(component) row: \(row)")
        savedComponent = component
        // ID the wheel that was moved
        switch ( component ) {
        case 0:
            
            //picker_01?.play()
            
            /*--------------------------------------------------------------------|
             |                this should become link to wheelOneMoved            |
             ----------------------------------------------------------------------*/
            /*
             0 0 0 Component Accross + Row Down
             0 1 2
             1 1 1
             2 2 2
             3 3 3
             4 4 4
             */
            
            savedCompZero = row
            equipMe.wheelOneMoved(component, row: row)
            // next 2 lines reset 3rd wheel to pos 0 so i dont get out of range error
            pickerView.selectRow(0, inComponent: 1, animated: true)
            self.pickerView(self.myPicker, didSelectRow: 0, inComponent: 1)
            reloadComponentsAndText()
            
        case 1:
            //picker_02?.play()
            print("Case 1")
            savedCompOne = row
            equipMe.wheelTwoMoved(component, row: row)
            savedCompTwo = 0      // reset 3rd wheel to stop out of range error
            Equipment().wheelTwoMoved(component, row: row)
            // next 2 lines reset 3rd wheel to pos 0 so i dont get out of range error
            pickerView.selectRow(0, inComponent: 2, animated: true)
            self.pickerView(self.myPicker, didSelectRow: 0, inComponent: 2)
            reloadComponentsAndText()
            
        case 2:
            Etrenitys_interface_3?.play()
            print("Case 2")
            savedCompTwo = row
            equipMe.wheelThreeMoved(component, row: row)
            Equipment().wheelThreeMoved(component, row: row)
            reloadComponentsAndText()
        default:break
        }
        
    }
    
    /*--------------------------------------------------------------------|
     |                     Functions to help flow                         |
     ---------------------------------------------------------------------*/
    
    // call a reload on text in picker UI   savedCompZero
    func reloadComponentsAndText (){
        print("\(savedCompZero)    \(savedCompOne)    \(savedCompTwo)")
        
        textDisplay.text = "\(equipmentArray[0][savedCompZero]) \(equipmentArray[1][savedCompOne])  \(equipmentArray[2][savedCompTwo])"
        textDisplay.adjustsFontSizeToFitWidth = true // adjust width of selection
        
        myPicker.reloadComponent(1)
        myPicker.reloadComponent(2)
    }
    
    /*--------------------------------------------------------------------|
     |                          Mail                                      |
     ---------------------------------------------------------------------*/
    func sendEmail() {
        var combinedString:[String]   = []
        
        //  equipmentListTitle
        
        for (index, element) in myTitle.enumerate() {

            //combine 2 strings
            combinedString.append(element.uppercaseString)              // bold title
            combinedString.append("\n")                 // tring to add return after name
            combinedString.append(myContent[index] )    // regular body
            combinedString.append("\n")                 // space bettween items
            combinedString.append("\n")
            
        }
        
        //let mailBody = combinedString  // for future use with bold text
        //let mailBody = combinedString.joinWithSeparator(" ")
        let mailBody = combinedString.joinWithSeparator(" ")
        print(combinedString)
        print(mailBody)
        
        // commented out because sim wont do mail and crashes
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
        else{
            print("Mail services available")
        }
        
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        // Configure the fields of the interface.
        //composeVC.setToRecipients(["whansen1@mac.com"])
        composeVC.setSubject(ComputerBrain().checkStoredJobName() )
        
        composeVC.setMessageBody(mailBody, isHTML: false)
        
        // Present the view controller modally.
        self.presentViewController(composeVC, animated: true, completion: nil)
        
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*--------------------------------------------------------------------|
     |          close keyboard with click away from text input            |
     ---------------------------------------------------------------------*/
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // return closes keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        //add ViewDidLoad/self.textDisplay.delegate = self //  this VC is responible for textDisplay
    }
    
    // load the default camera order
    func openDefaultFile() {
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("DefaultTitle") != nil)
        {
            let savedListTitle = NSUserDefaults.standardUserDefaults().objectForKey("DefaultTitle")! as! NSArray
            let savedListContent = NSUserDefaults.standardUserDefaults().objectForKey("DefaultContent")! as! NSArray
            
            equipmentListTitle = savedListTitle as! [String] // un wrap ns array as string array
            equipmentListContent = savedListContent as! [String] // un wrap ns array as string array
            equipListTabel.reloadData()
        }
        
    }
    
    // set initial values for picker wheel = row in arr, component
    func setUpPicker() {
        
        myPicker.selectRow(savedCompZero, inComponent: 0, animated: true)
        myPicker.selectRow(savedCompOne, inComponent: 1, animated: true)
        myPicker.selectRow(savedCompTwo, inComponent: 2, animated: true)
        // this saves initial state of picker and textInput
        equipmentArray = [typeArray,MidArray,lastArray]
        // this remembers pickerstate when back from picking lenses & aks ect
        equipMe.wheelOneMoved(savedComponent, row: savedCompOne)
        equipMe.wheelTwoMoved(savedComponent, row: savedCompTwo)
    }
    
    // set up list on initialization and also return to this view
    func populateEquipmentListTable() {
        if equipmentList.count == 0 {
            equipmentList.append( ComputerBrain().checkStoredUserName() )
            equipmentList.append( ComputerBrain().checkStoredJobName() )
            equipmentList.append(" ")
        } else {
            equipmentList[0] = ComputerBrain().checkStoredUserName()
            equipmentList[1] = ComputerBrain().checkStoredJobName()
        }
    }
    
    // add return after DP
    func populateEquipmentListTableBold() {
        // first run of app
        if equipmentListTitle.count == 0 || equipmentListContent.count == 0 {
            equipmentListTitle.append(ComputerBrain().checkStoredUserName() )
            equipmentListContent.append( ComputerBrain().checkStoredJobName() )
            myTitle.append(ComputerBrain().checkStoredUserName())
            if ComputerBrain().getProdOnly() == "No Stored Production"
            {
                myContent.append(ComputerBrain().checkStoredJobName())        // no procudtion co
            } else {
                myContent.append("\(ComputerBrain().checkStoredJobName()) \(ComputerBrain().getProdOnly())")
            }
            
        } else {
            // subsequent run of app
            equipmentListTitle[0] = ComputerBrain().checkStoredUserName()
            equipmentListContent[0] = ComputerBrain().checkStoredJobName()
            myTitle[0] = ComputerBrain().checkStoredUserName()
            if ComputerBrain().getProdOnly() == "No Stored Production" {
                myContent[0] = ComputerBrain().checkStoredJobName()    // no procudtion co
            } else{
                myContent[0] = ("\(ComputerBrain().checkStoredJobName())  \(ComputerBrain().getProdOnly())")
            }
        }
        
        
    }
    
    
}


