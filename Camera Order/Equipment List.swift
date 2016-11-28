//
//  Equipment List.swift
//  PickerTest
//
//  Created by Warren Hansen on 6/18/16.
//  Copyright © 2016 Warren Hansen. All rights reserved.
//
//  SavedComZero = var holds location of frist wheel
/*  
 0   camera
 1   prime
 2   macro
 3   probe
 4   zoom
 5   aks
 6   finder
 7   filters
 8   support
 */
/*--------------------------------------------------------------------|
 |                   database and wheel logic                          |
 ---------------------------------------------------------------------*/

import Foundation

public class ComputerBrain {
    
    // get todays date for view 1
    internal func getDate() -> String {
        let d = NSDate()
        let dateFortmattedForm = NSDateFormatter()
        dateFortmattedForm.dateFormat = "MM / d / yyyy"
        return(dateFortmattedForm.stringFromDate(d))
    }
    
    /*--------------------------------------------------------------------|
     |                        Set Up Perm Storage                           |
    ----------------------------------------------------------------------*/
    // retrive saved name
    internal func checkStoredUserName() -> String {
        // check and populate username
        if NSUserDefaults.standardUserDefaults().objectForKey("userName") != nil {
            let thisOwner = NSUserDefaults.standardUserDefaults().objectForKey("userName") as! String
            return ("\(thisOwner) - Director of Photography")
        }
        else { return ("No Stored Name") }
    }
    
    // retrive saved job
    internal func checkStoredJobName() -> String {
        if NSUserDefaults.standardUserDefaults().objectForKey("jobName") != nil {
            let thisForm    =   "Camera Order"
            let thisJob = NSUserDefaults.standardUserDefaults().objectForKey("jobName") as! String
            let myDate = ComputerBrain().getDate()
            //let myQuote = "\""
            return ("\(thisForm)  \"\(thisJob)\"  \(myDate)")
        }
        else { return ("No Stored Job") }
    }
    
    // set perm storage name only
    internal func setStoredName(owner: String) {
        NSUserDefaults.standardUserDefaults().setObject(owner, forKey: "userName")
    }
    
    // set perm storage job only
    internal func setStoredJob(job: String) {
        NSUserDefaults.standardUserDefaults().setObject(job, forKey: "jobName")
    }
    
    // set perm storage production name only
    internal func setStoredProd(job: String) {
        NSUserDefaults.standardUserDefaults().setObject(job, forKey: "prodName")
    }
    
    // set perm storage filters
    internal func setStoredFilters(filterText: String) {
        NSUserDefaults.standardUserDefaults().setObject(filterText, forKey: "filter")
    }
    
    // set perm storage Support
    internal func setStoredSupport(supportText: String) {
        NSUserDefaults.standardUserDefaults().setObject(supportText, forKey: "support")
    }
    
    // set perm AKS Support
    internal func setStoredAKS(aksText: String) {
        NSUserDefaults.standardUserDefaults().setObject(aksText, forKey: "aks")
    }
    
    // retrieve perm storage name only for 2nd screen load
    internal func getNameOnly() -> String {
        if NSUserDefaults.standardUserDefaults().objectForKey("userName") != nil {
            let thisUser = NSUserDefaults.standardUserDefaults().objectForKey("userName") as! String
            return (thisUser)
        } else {
            return "No Stored Name"
        }
    }
    // retrieve perm storage user only for 2nd screen load
    internal func getJobOnly() -> String {
        if NSUserDefaults.standardUserDefaults().objectForKey("jobName") != nil {
            let thisJob = NSUserDefaults.standardUserDefaults().objectForKey("jobName") as! String
            return (thisJob)
        } else {
            return "No Stored Job"
        }
    }
    // retrieve perm storage user only for 2nd screen load  setStoredProd getProdOnly
    internal func getProdOnly() -> String {
        if NSUserDefaults.standardUserDefaults().objectForKey("prodName") != nil {
            let thisProd = NSUserDefaults.standardUserDefaults().objectForKey("prodName") as! String
            return (thisProd)
        } else {
            return "No Stored Production"
        }
    }
    // retrieve perm storage of filters
    internal func getFiltersOnly() -> String {
        if NSUserDefaults.standardUserDefaults().objectForKey("filter") != nil {
            let filterText = NSUserDefaults.standardUserDefaults().objectForKey("filter") as! String
            return (filterText)
        } else {
            return "Filters"
        }
    }
    // retrieve perm storage of Support
    internal func getSupportOnly() -> String {
        if NSUserDefaults.standardUserDefaults().objectForKey("support") != nil {
            let supportText = NSUserDefaults.standardUserDefaults().objectForKey("support") as! String
            return (supportText)
        } else {
            return "Support"
        }
    }
    // retrieve perm storage of AKS
    internal func getAKSOnly() -> String {
        if NSUserDefaults.standardUserDefaults().objectForKey("aks") != nil {
            let aksText = NSUserDefaults.standardUserDefaults().objectForKey("aks") as! String
            return (aksText)
        } else {
            return "AKS"
        }
    }
    
}

    /*--------------------------------------------------------------------|
    |            class for equipment loaded on wheel picker               |
    ---------------------------------------------------------------------*/
class Equipment {
    
    /*--------------------------------------------------------------------|
     |                           Wheel One Moved                           |
     ----------------------------------------------------------------------*/
    
    func wheelOneMoved(component: Int, row: Int) -> Int{
        print("wheel One Moved")
        // Camera selected
        if ( savedCompZero == 0  ) {
            equipmentArray[1]   = ["Arri", "Red","Phantom","Panavision","Sony"," ", " ", " ", " ", " ", " ", " ", " "]
            equipmentArray[2]   = ["Alexa Mini", "Amira", "Alexa", "Alexa XT+","Alexa +XR","Alexa ST XR","Alexa M",
                                   "235", "535B", "435", "Arricam LT", "Arricam ST", "SR3", "416"]
        }
        if ( savedCompZero == 1  ) {
            //print("Selected Primes")
            equipmentArray[1]   =  ["Zeiss","Leica","Canon","Cooke", "Vantage", "Bausch + Lomb", "Kowa",
            "Kineoptic", "Nikkor", "Red", "CamTec", "Anamorphic"]
            equipmentArray[2]   =  ["Master Primes", "Ultra Primes", "Super Speeds", "SS Uncoated", "Standard Speeds", "Compact S2"]
        }
        if ( savedCompZero == 2 ){
            // print("Selected Macros")
            equipmentArray[1]   = ["Arri","Zeiss"]
            equipmentArray[2]   = ["Macro"]
        }
        if ( savedCompZero == 3  ){
            //print("Probes Selected")
            equipmentArray[1]    = ["Innovision","T-Rex", "Revolution", "Skater", "Century", "Optex"]
            equipmentArray[2]    = ["Probe +II"]
        }
        if ( savedCompZero == 4  ){
            //print("Zooms Selected")
            equipmentArray[1]   = ["Angenieux","Fujinon", "Cooke", ]
            equipmentArray[2]   = ["17-102", "16-42", "30-80", "45-120", "28-76", "15-40","17-80", "24-290"]
        }
        if ( savedCompZero == 5  ){
            //print("AKS Selected")
            equipmentArray[1]   = ["Standard"]
            equipmentArray[2]   = [" "]
        }
        if ( savedCompZero == 6  ){
            //print("FINDER Selected")
            equipmentArray[1]    = ["Standard", "Anamorphic"]
            equipmentArray[2]   = [" "]
        }
        if ( savedCompZero == 7  ){
            //print("FILTERS Selected")
            equipmentArray[1]    = ["Standard"]
            equipmentArray[2]   = [" "]
        }
        if ( savedCompZero == 8 ){
            //print("SUPPORT Selected")
            equipmentArray[1]    = ["Standard"]
            equipmentArray[2]   = [" "]
        }
        
        return(row)
    }
    
    /*--------------------------------------------------------------------|
     |                           Wheel Two Moved                           |
     ----------------------------------------------------------------------*/
    func wheelTwoMoved(component: Int, row: Int) -> Int{
        print("wheel Two Moved")
        // Camera + arri selected
        if ( savedCompZero == 0 && savedCompOne == 0 ) {
            equipmentArray[2]      = ["Alexa Mini", "Amira", "Alexa", "Alexa XT+","Alexa +XR","Alexa ST XR","Alexa M",
                                      "235", "535B", "435", "Arricam LT", "Arricam ST", "SR3", "416"]
        }
        // Camera + red selected
        if ( savedCompZero == 0  && savedCompOne == 1 ) {
            equipmentArray[2]       = ["Weapon", "Epic","Epic Dragon","One"]
        }
        // Camera + phantom selected
        if ( savedCompZero == 0  && savedCompOne == 2 ) {
            equipmentArray[2]     = ["Flex 4k", "Flex","HD Gold"]
        }
        // Camera + panavision selected
        if ( savedCompZero == 0  && savedCompOne == 3 ) {
            equipmentArray[2]     = ["Genesis", "XL2", "Platinum", "Gold-G2", "Millennium"]
        }
        // Camera + sony selected
        if ( savedCompZero == 0  && savedCompOne == 4 ) {
            equipmentArray[2]     = ["F-55", "F-65", "F-5","F-S5","F-S7"]
        }
        
/*-----------------------------------------------------------------------------------------------------------------|
|******************************     Wheel Two Primes    ***********************************************************|
"Zeiss",0      "Leica",1       "Canon",2       "Cooke",3       "Vantage One",4     "B+L Super Baltar",5
"Kowa Cine Prominar",6      "Kineoptic Apochromat",7     "Nikkor",8   "Red Pro",9  "CamTec Vintage", 10
------------------------------------------------------------------------------------------------------------------*/
        // Primes + Zeiss selected
        if ( savedCompZero == 1  && savedCompOne == 0 ) {
            equipmentArray[2]    = ["Master Primes", "Ultra Primes", "Super Speeds", "SS Uncoated", "Standard Speeds", "Compact S2"]    // print("Selected Zeiss Primes")
            primeSelected = true
        }
        // Primes + Leica selected
        if ( savedCompZero == 1  && savedCompOne == 1 ) {
            equipmentArray[2]     =  ["Summilux-C", "Summicron-C", "Telephoto"]  // print("Selected Leica Primes")
        }
        // Primes + Canon selected
        if ( savedCompZero == 1  && savedCompOne == 2 ) {
            equipmentArray[2]     =  ["K-35", "Telephoto"]                      //Print("Selected Canon Primes")
        }
        // Primes + Cooke selected
        if ( savedCompZero == 1  && savedCompOne == 3) {
            equipmentArray[2]     =  ["I5", "S4", "Speed Panchro"]              // print("Selected Cooke Primes")
        }
        // Primes + Vantage One selected
        if ( savedCompZero == 1  && savedCompOne == 4) {
            equipmentArray[2]     =  ["One", " ", " ", " ", " ", " ", " "]              // print("Selected Vantage Primes")
        }
        // Primes + "Bausch + Lomb Super Baltar",5 selected
        if ( savedCompZero == 1  && savedCompOne == 5) {
            equipmentArray[2]     =  ["Super Baltar", " ", " ", " ", " ", " ", " "]              // print("Selected Bausch + Lomb Primes")
        }
        // Primes + "Kowa Cine Prominar",6  selected
        if ( savedCompZero == 1  && savedCompOne == 6) {
            equipmentArray[2]     =  ["Cine Prominar", " ", " ", " ", " ", " ", " "]              // print("Selected Kowa Primes")
        }
        // Primes + "Kineoptic Apochromat",7  selected
        if ( savedCompZero == 1  && savedCompOne == 7) {
            equipmentArray[2]     =  ["Apochromat", " ", " ", " ", " ", " ", " "]              // print("Selected Kowa Primes")
        }
        // Primes + "Nikkor",8   selected
        if ( savedCompZero == 1  && savedCompOne == 8) {
            equipmentArray[2]     =  ["Telephoto", " ", " ", " ", " ", " ", " "]              // print("Selected Kowa Primes")
        }
        // Primes + "Red Pro",9   selected
        if ( savedCompZero == 1  && savedCompOne == 9) {
            equipmentArray[2]     =  ["Pro", " ", " ", " ", " ", " ", " "]              // print("Selected Kowa Primes")
        }
        // Primes + "CamTec Vintage", 10  selected
        if ( savedCompZero == 1  && savedCompOne == 10 ) {
            equipmentArray[2]     =  ["Ultra Primes", " ", " ", " ", " ", " ", " "]              // print("Selected Kowa Primes")
        }
        
        // Primes + "Anamorphic", 11  selected
        if ( savedCompZero == 1  && savedCompOne == 11 ) {
            equipmentArray[2]     =  ["Cooke Vintage", "Cooke", "Master Primes", "Arriscope", "Kowa", "Hawk VL", "Hawk V", "Hawk C", "Cineovision"]              // print("Selected Kowa Primes")
        }
        
        /*--------------------------------------------------------------------|
         |                           Wheel Two Macros                           |
         ----------------------------------------------------------------------*/
        // Macro LENS change the contents of 2nd wheel based on 1st wheel
        if ( savedCompZero == 2  && savedCompOne == 0){
            equipmentArray[2]     =  ["Macro"]                                  // print("Selected Arri Macro")
            
            lensArray   = ["16mm","24mm","32mm", "40mm","50mm","100mm","200mm"]
            
            displayLensArray = [ "16mm      T 2.1   ^6in",
                                 "24mm      T 2.1   ^6.5in",
                                 "32mm      T 2.1   ^7.5in",
                                 "40mm      T 2.1   ^9in",
                                 "50mm      T 3     ^8in",
                                 "100mm     T 3     ^1ft 2in",
                                 "200mm     T 4.3   ^1ft 8in"]
        }
        
        if ( savedCompZero == 2  && savedCompOne == 1){
            equipmentArray[2]     =  ["Master Prime"]                          // print("Selected Zeiss Macro")
            
            lensArray   = [ "100mm"]
            
            displayLensArray = [ "100mm      T 2   ^13.75in"]
        }
        
        /*--------------------------------------------------------------------|
         |                           Wheel Two Probe                           |
         ----------------------------------------------------------------------*/
        if ( savedCompZero == 3  && savedCompOne == 0){
            equipmentArray[1]   = ["Innovision","T-Rex", "Revolution", "Skater", "Century", "Optex"]
            equipmentArray[2]    = ["Probe II+"]
            lensArray   = ["9mm", "12mm", "16mm", "20mm", "28mm", "32mm", "40mm" , "55mm"]
            
            displayLensArray = ["9mm    T 6.3", "12mm    T 6.3", "16mm    T 6.3", "20mm    T 6.3", "28mm    T 6.3", "32mm    T 6.3", "40mm    T 6.3" , "55mm    T 6.3"]
        }
        // t rex probe
        if ( savedCompZero == 3  && savedCompOne == 1){
            equipmentArray[2]    = ["Probe"]
            lensArray   = ["5.5-20mm", "8-18mm", "17-35mm", "32-70mm", "55-112mm Macro"]
            displayLensArray = ["5.5-20mm   T 7.1", "8-18mm   T 7.1", "17-35mm   T 7.1", "32-70mm   T 7.1", "55-112mm   T 7.1 Macro"]
        }
        // revolution probe
        if ( savedCompZero == 3  && savedCompOne == 2){
            equipmentArray[2]    = ["Probe"]
            lensArray   = ["9.8mm", "12mm", "16mm", "20mm", "24mm", "32mm", "40mm" , "65mm"]
            displayLensArray  = ["9.8mm T 7.5", "12mm T 7.5", "16mm T 7.5", "20mm T 7.5", "24mm T 7.5", "32mm T 7.5", "40mm T 7.5" , "65mm T 7.5"]
        }
        // skater Scope
        if ( savedCompZero == 3  && savedCompOne == 3){
            equipmentArray[2]    = ["Scope"]
            lensArray   = ["PL Mount"]
            displayLensArray = ["PL Mount"]
        }
        // century Periscope
        if ( savedCompZero == 3  && savedCompOne == 4){
            equipmentArray[2]    = ["Periscope"]
            lensArray   = ["PL Mount"]
            displayLensArray = ["PL Mount"]
        }
        // Optex probe
        if ( savedCompZero == 3  && savedCompOne == 5){
            equipmentArray[2]    = ["Excellence"]
            lensArray   = ["10mm", "14mm", "20mm", "28mm"]
            displayLensArray = ["10mm   T 5.6", "14mm   T 5.6", "20mm   T 5.6", "28mm   T 5.6"]
        }
        
        /*--------------------------------------------------------------------|
         |                           Wheel Two Zooms                           |
         ----------------------------------------------------------------------*/
        if ( savedCompZero == 4  && savedCompOne == 0){
            equipmentArray[1]   = ["Angenieux","Fujinon", "Cooke","Zeiss VP", "Hawk", "Century", "Canon","Anamorphic" ]
            // Angenieux
            equipmentArray[2]   = ["17-102", "16-42 Rouge", "30-80 Rouge", "45-120 Optimo", "28-76 Optimo", "15-40 Optimo","17-80 Optimo", "24-290 Optimo", "25-250 HR"]
            
            displayLensArray   = ["17-102   T 2.9   ^2ft 9in",
                                  "16-42 Rouge  T 2.8   ^2ft",
                                  "30-80 Rouge  T 2.8   ^2ft",
                                  "45-120 Optimo    T 2.8   ^3ft 1in",
                                  "28-76 Optimo     T 2.6   ^2ft",
                                  
                                  "15-40 Optimo    T 2.6   ^2ft",
                                  "17-80 Optimo    T 2.2   ^2ft",
                                  "24-290 Optimo    T 2.8   ^4ft",
                                  "25-250 HR    T 3.5   5ft 7in",]
        }
        // Fuji
        if ( savedCompZero == 4  && savedCompOne == 1){
            equipmentArray[2]   =  ["24-180 Premier", "75-400 Premier", "18-85 Premier", "45-250 Alura", "18-80 Alura"]
            
            displayLensArray   =  ["24-180 Premier    T 2.6   ^4ft 1in",
                                   "75-400 Premier    T 2.8  ^6ft 6in",
                                   "18-85 Premier    T 2   ^2ft 10in",
                                   "45-250 Alura    T 2.6   ^3ft 11in",
                                   "18-85 Alura    T 2   ^2ft 10in"]
        }
        // Cooke
        if ( savedCompZero == 4  && savedCompOne == 2){
            equipmentArray[2]   =  ["25-250 Mk2", "20-60", "15-40 CXX", "18-100"]
            
            displayLensArray   =  ["25-250 Mk2    T 4   ^5ft 6in",
                                   "20-60    T 3.1   ^2ft 4in",
                                   "15-40 CXX    T 2   ^1ft 6in",
                                   "18-100    T 3   ^2ft 4in",]
        }
        // zeiss variable primes
        if ( savedCompZero == 4  && savedCompOne == 3){
            equipmentArray[2]   =  ["16-30", "29-60", "55-105"]
            
            displayLensArray   =  ["16-30    T 2.2  ^2ft",
                                   "29-60    T 2.2  ^2ft 3in",
                                   "55-105   T 2.2  ^2ft 3in"]
        }
        // hawk
        if ( savedCompZero == 4  && savedCompOne == 4){
            equipmentArray[2]   =  ["17-35", "100-300", "150-450"]
            
            displayLensArray   =  ["17-35    T 2.8  ^1ft",
                                   "100-300    T 2.2  ^10ft",
                                   "150-450    T 2.8  ^10ft" ]
        }
        // century
        if ( savedCompZero == 4  && savedCompOne == 5){
            equipmentArray[2]   =  ["28-70", "17-35", "150-600"]
            
            displayLensArray   =  ["28-70    T 3  ^3ft",
                                   "17-35    T 3  ^1ft 4in",
                                   "150-600    T 6.7  ^10ft"]
        }
        // canon
        if ( savedCompZero == 4  && savedCompOne == 6){
            equipmentArray[2]   =  ["50-1000"]
            displayLensArray   =  ["50-1000 T 5"]
        }
        // Zooms + "Anamorphic", 11  selected
        if ( savedCompZero == 4  && savedCompOne == 7 ) {
            equipmentArray[2]     =  ["Angenieux 30-72", "Angenieux 56-152","Angenieux 34-204", "Angenieux 50-500",
                                      "Angenieux 48-580","Cooke 40-120", "Cooke 36-200", "Cooke 40-200","Cooke 50-500"]
            
            displayLensArray     =  ["Angenieux 30-72",
                                     "Angenieux 56-152  T 4",
                                     "Angenieux 34-204  T 4.1",
                                     "Angenieux 50-500  T 5.2",
                                     "Angenieux 48-580  T 4",
                                     "Cooke 40-120  T 4.4",
                                     "Cooke 36-200  T 4.4",
                                     "Cooke 40-200  HR  T 5.2",
                                     "Cooke 50-500  Optimo T 4"]
        }
        //***************************   Assign wheel two AKS   *****************************************
        if ( savedCompZero == 5 && savedCompOne == 0){
            //print("AKS Selected")
            equipmentArray[1]   = ["select items"]
            equipmentArray[2]   = [" "]
        }
        
        //***************************   Assign wheel two FINDER
        if ( savedCompZero == 6 && savedCompOne == 0){
            //print("FINDER Selected")
            equipmentArray[1]    = ["Standard", "Anamorphic"]
            equipmentArray[2]   = [" "]
        }
        
        //***************************   Assign wheel two Filters
        if ( savedCompZero == 7 && savedCompOne == 0 ){
            //print("FILTERS Selected")
            equipmentArray[1]   = ["select items"]
            equipmentArray[2]   = [" "]
        }
        
        //***************************   Assign wheel two SUPPORT
        if ( savedCompZero == 8 && savedCompOne == 0 ){
            //print("SUPPORT Selected")
            equipmentArray[1]   = ["select items"]
            equipmentArray[2]   = [" "]
        }
        return(row)
    }
    
    /*--------------------------------------------------------------------|
     |                           Wheel Three Moved                           |
     ----------------------------------------------------------------------*/
    func wheelThreeMoved(component: Int, row: Int) -> Int{
        print("wheel Three Moved")
        
        // add control flow for lens mm selection
        
        // Primes + Zeiss + Master Primes selected
        if ( savedCompZero == 1  && savedCompOne == 0 && savedCompTwo == 0 ) {
            
            equipmentArray[2]    = ["Master Primes", "Ultra Primes", "Super Speeds", "SS Uncoated", "Standard Speeds", "Compact S2"]    // print("Selected Zeiss Primes")
            
            primeSelected = true
            
            lensArray   = ["12mm", "14mm", "16mm", "18mm", "21mm", "25mm", "27mm",
                               "32mm", "35mm","40mm", "50mm", "65mm", "75mm", "100mm", "135mm", "150mm"]
            
            displayLensArray   = ["12mm    T 1.3   ^16in",
                                  "14mm    T 1.3   ^14in",
                                  "16mm    T 1.3   ^14in",
                                  "18mm    T 1.3   ^14in",
                                  "21mm    T 1.3   ^14in",
                                  "25mm    T 1.3   ^14in",
                                  "27mm    T 1.3   ^14in",
                                  "32mm    T 1.3   ^14in",
                                  "35mm    T 1.3   ^14in",
                                  "40mm    T 1.3   ^16in",
                                  "50mm    T 1.3   ^20in",
                                  "65mm    T 1.3   ^2ft 3in",
                                  "75mm    T 1.3   ^2ft 9in",
                                  "100mm   T 1.3   ^3ft 6in",
                                  "135mm   T 1.3   ^3ft 3in",
                                  "150mm   T 1.3   ^4ft 11in"]
        }
        
        // Primes + Zeiss + Ultra Primes selected
        if ( savedCompZero == 1  && savedCompOne == 0 && savedCompTwo == 1 ) {
            
            equipmentArray[2]    = ["Master Primes", "Ultra Primes", "Super Speeds", "SS Uncoated", "Standard Speeds", "Compact S2"]    // print("Selected Zeiss Primes")
            
            primeSelected = true
            
            lensArray   = [ "8mm","10mm","12mm","14mm","16mm","20mm","24mm","28mm","32mm",
            "40mm","50mm","65mm","85mm","100mm","135mm","180mm"]
            
            displayLensArray   = [ "8mm     T 2.8   ^14in",
                            "10mm    T 2.1   ^14in",
                            "12mm    T 2     ^12in",
                            "14mm    T 1.9   ^9in",
                            "16mm    T 1.9   ^10in",
                            "20mm    T 1.9   ^11in",
                            "24mm    T 1.9   ^12in",
                            "28mm    T 1.9   ^11in",
                            "32mm    T 1.9   ^14in",
                            "40mm    T 1.9   ^15in",
                            "50mm    T 1.9   ^2ft",
                            "65mm    T 1.9   ^2ft 3in",
                            "85mm    T 1.9   ^3ft",
                            "100mm   T 1.9   ^3ft 3in",
                            "135mm   T 1.9   ^5ft",
                            "180mm   T 1.9   ^8ft 6in" ]
        }
        
        // Primes + Zeiss + Super Speeds or uncoated
        if ( savedCompZero == 1  && savedCompOne == 0 && ( savedCompTwo == 2 || savedCompTwo == 3  )) {
            
            equipmentArray[2]    = ["Master Primes", "Ultra Primes", "Super Speeds", "SS Uncoated", "Standard Speeds", "Compact S2"]    // print("Selected Zeiss Primes")
            
            primeSelected = true
            
            lensArray   = [ "18mm","25mm","35mm","50mm","65mm","85mm"]
            
            displayLensArray = [ "18mm      T 1.3   ^10in",
                                 "25mm      T 1.3   ^10in",
                                 "35mm      T 1.3   ^1ft 2in",
                                 "50mm      T 1.3   ^2ft 6in",
                                 "65mm      T 1.3   ^2ft 4in",
                                 "85mm      T 1.3   ^3ft"]
        }
        
        // Primes + Zeiss + Standard Speeds
         if ( savedCompZero == 1  && savedCompOne == 0 && savedCompTwo == 4 ) {
            
            equipmentArray[2]    = ["Master Primes", "Ultra Primes", "Super Speeds", "SS Uncoated", "Standard Speeds", "Compact S2"]    // print("Selected Zeiss Primes")
            
            primeSelected = true
            
            lensArray   = [ "10mm","12mm","14mm","16mm","20mm","24mm","28mm","32mm",
                            "40mm","50mm","85mm","100mm","135mm","180mm"]
            
            displayLensArray   = ["10mm    T 2.1   ^14in",
                                  "12mm    T 2.1   ^10in",
                                  "14mm    T 2.1   ^9in",
                                  "16mm    T 2.1   ^5in",
                                  "20mm    T 2.1   ^8in",
                                  "24mm    T 2.1   ^8in",
                                  "28mm    T 2.1   ^11in",
                                  "32mm    T 2.1   ^1ft 4in",
                                  "40mm    T 2.1   ^1ft 4in",
                                  "50mm    T 2.1   ^1ft 4in",
                                  "85mm    T 2.1   ^3ft",
                                  "100mm   T 2.1   ^3ft 4in",
                                  "135mm   T 2.1   ^5ft",
                                  "180mm   T 3     ^5ft"]
        }
        
        // Primes + Zeiss + Compact S2
        if ( savedCompZero == 1  && savedCompOne == 0 && savedCompTwo == 5 ) {
            
            equipmentArray[2]    = ["Master Primes", "Ultra Primes", "Super Speeds", "SS Uncoated", "Standard Speeds", "Compact S2"]    // print("Selected Zeiss Primes")
            
            primeSelected = true
            
            lensArray   = [ "18mm","21mm","25mm","28mm","35mm",
                            "50mm","85mm", "100mm", "135mm"]
            
            displayLensArray = ["15mm    T 2.9   ^12in",
                                "18mm    T 3.6   ^12in",
                                 "21mm   T 2.9   ^10in",
                                 "25mm   T 2.1   ^10in",
                                 "28mm   T 2.1   ^10in",
                                 "35mm   T 2.1   ^12in",
                                 "50mm   T 2.1   ^18in",
                                 "85mm   T 2.1   ^3ft 3in",
                                 "100mm  T 2.1   ^2ft 6in",
                                 "135mm  T 2.1   ^3ft 3in"
            ]
        }
        
        // Primes + Leica + Summilux-C
        if ( savedCompZero == 1  && savedCompOne == 1 && savedCompTwo == 0 ) {
            
            equipmentArray[2]     =  ["Summilux-C", "Summicron-C", "Telephoto"]  // print("Selected Leica Primes")
            
            primeSelected = true
            
            lensArray   = [ "16mm", "18mm","21mm","25mm","29mm","35mm",
                            "40mm","50mm","65mm","75mm","100mm","135mm"]
            
            displayLensArray = ["16mm   T 1.4    ^14in",
                                "18mm   T 1.4    ^14in",
                                 "21mm  T 1.4    ^12in",
                                 "25mm  T 1.4    ^12in",
                                 "29mm  T 1.4    ^18in",
                                 "35mm  T 1.4    ^14in",
                                 "40mm  T 1.4    ^16in",
                                 "50mm  T 1.4    ^20in",
                                 "65mm  T 1.4    ^18in",
                                 "75mm  T 1.4    ^2ft 3in",
                                 "100mm T 1.4    ^2ft 11in",
                                 "135mm T 1.4    ^4ft 1in"]
        }
        
        // Primes + Leica + Summicron-C
        if ( savedCompZero == 1  && savedCompOne == 1 && savedCompTwo == 1 ) {
            
            equipmentArray[2]     =  ["Summilux-C", "Summicron-C", "Telephoto"]  // print("Selected Leica Primes")
            
            primeSelected = true
            
            lensArray   = [ "15mm", "18mm","21mm","25mm","29mm","35mm",
                            "40mm","50mm","75mm","100mm","135mm"]
            
            displayLensArray  = [ "15mm  T 2.0    ^12in",
                                  "18mm  T 2.0    ^12in",
                                  "21mm  T 2.0    ^12in",
                                  "25mm  T 2.0    ^12in",
                                  "29mm  T 2.0    ^12in",
                                  "35mm  T 2.0    ^14in",
                                  "40mm  T 2.0    ^18in",
                                  "50mm  T 2.0    ^2ft",
                                  "75mm  T 2.0    ^2ft 7in",
                                  "100mm T 2.0    ^3ft 3in",
                                  "135mm T 2.0    ^5ft"]
        }
        
        // Primes + Leica + Telephoto
        if ( savedCompZero == 1  && savedCompOne == 1 && savedCompTwo == 2 ) {
            
            equipmentArray[2]     =  ["Summilux-C", "Summicron-C", "Telephoto"]  // print("Selected Leica Primes")
            
            primeSelected = true
            
            lensArray   = [ "180mm","280mm"]
            
            displayLensArray   = [ "180mm   T 2  ^5",
                                   "280mm   T 2  ^8"]
        }
        
        // Primes + Canon + K-35
        if ( savedCompZero == 1  && savedCompOne == 2 && savedCompTwo == 0 ) {
            
            equipmentArray[2]     =  ["K-35", "Telephoto"]                      //Print("Selected Canon Primes")
            
            primeSelected = true
            
            lensArray   = [ "18mm","24mm", "35mm", "55mm","85mm"]
            
            displayLensArray    = [ "18mm   T 1.5   ^12in",
                                    "24mm   T 1.5   ^12in",
                                    "35mm   T 1.5   ^12in",
                                    "55mm   T 1.5   ^2ft",
                                    "85mm   T 1.5   ^3ft"]
        }
        
        // Primes + Canon + Telephoto
        if ( savedCompZero == 1  && savedCompOne == 2 && savedCompTwo == 1 ) {
            
            equipmentArray[2]     =  ["K-35", "Telephoto"]                      //Print("Selected Canon Primes")
            
            primeSelected = true
            
            lensArray   = [ "200mm T2","200 T2.8", "300mm", "400mm"]
            
            displayLensArray = [ "200mm     T2      ^10ft",
                                 "200mm     T2.8    ^4ft 9in",
                                 "300mm     T2.8    ^10ft",
                                 "400mm     T2.8    ^15ft"]
        }
        
        // Primes + Cooke + I5
        if ( savedCompZero == 1  && savedCompOne == 3 && savedCompTwo == 0 ) {
            
            equipmentArray[2]     =  ["I5", "S4", "Speed Panchro"]              // print("Selected Cooke Primes")
            
            primeSelected = true
            
            lensArray   = [ "18mm","25mm","32mm","40mm","50mm","65mm","75mm","100mm","135mm"]
            
            displayLensArray  = [ "18mm   T 1.4   ^5in",
                                  "25mm   T 1.4   ^5in",
                                  "32mm   T 1.4   ^5in",
                                  "40mm   T 1.4   ^7in",
                                  "50mm   T 1.4   ^11in",
                                  "65mm   T 1.4   ^15in",
                                  "75mm   T 1.4   ^17in",
                                  "100mm  T 1.4   ^21in",
                                  "135mm  T 1.4   ^21in"]
        }
        
        // Primes + Cooke + S4
        if ( savedCompZero == 1  && savedCompOne == 3 && savedCompTwo == 1 ) {
            
            equipmentArray[2]     =  ["I5", "S4", "Speed Panchro"]              // print("Selected Cooke Primes")
            
            primeSelected = true
            
            lensArray   = ["12mm", "14mm", "16mm", "18mm", "21mm", "25mm", "27mm",
                           "32mm", "35mm","40mm", "50mm", "65mm", "75mm", "100mm", "135mm", "150mm", "180mm"]
            
            displayLensArray = ["12mm   T 2   ^9in",
                                "14mm   T 2   ^9in",
                                "16mm   T 2   ^9in",
                                "18mm   T 2   ^9in",
                                "21mm   T 2   ^9in",
                                "25mm   T 2   ^9in",
                                "27mm   T 2   ^10in",
                                "32mm   T 2   ^12in",
                                "35mm   T 2   ^14in",
                                "40mm   T 2   ^16in",
                                "50mm   T 2   ^20in",
                                "65mm   T 2   ^27in",
                                "75mm   T 2   ^30in",
                                "100mm  T 2   ^36in",
                                "135mm  T 2   ^30in",
                                "150mm  T 2   ^42in",
                                "180mm  T 2   ^51in"]
        }
        
        // Primes + Cooke + Speed Panchro
        if ( savedCompZero == 1  && savedCompOne == 3 && savedCompTwo == 2 ) {
            
            equipmentArray[2]     =  ["I5", "S4", "Speed Panchro"]              // print("Selected Cooke Primes")
            
            primeSelected = true
            
            lensArray   = ["18mm", "25mm", "32mm", "40mm", "50mm", "75mm", "100mm Macro", "152mm Macro"]
            
            displayLensArray  = ["18mm  T 2.2   ^7in",
                                 "25mm  T 2.3   ^11in",
                                 "32mm  T 2.3   ^8in",
                                 "40mm  T 2.3   ^9in",
                                 "50mm  T 2.3   ^12in",
                                 "75mm  T 2.3   ^22in",
                                 "100mm Macro  T 2.8   ^3in",
                                 "152mm Macro  T 3.2   ^3in"]
            
        }
        
        // Primes + Vantage One
        if ( savedCompZero == 1  && savedCompOne == 4 && savedCompTwo == 0 ) {
            
            equipmentArray[2]     =  ["One", " ", " ", " ", " ", " ", " "]              // print("Selected Cooke Primes")
            
            primeSelected = true
            
            lensArray   = ["17.5mm", "21mm", "25mm", "32mm","40mm","50mm", "65mm", "90mm", "102mm"]
            
            displayLensArray   = ["17.5mm   T 1.0   ^10in",
                                  "21mm     T 1.0   ^10in",
                                  "25mm     T 1.0   ^10in",
                                  "32mm     T 1.0   ^10in",
                                  "40mm     T 1.0   ^1ft 2in",
                                  "50mm     T 1.0   ^1ft 2in",
                                  "65mm     T 1.0   ^1ft 2in",
                                  "90mm     T 1.0   ^1ft 8in",
                                  "102mm    T 1.0   ^2ft 6in"]
        }
        
        // Primes + "B+L Super Baltar"
        if ( savedCompZero == 1  && savedCompOne == 5 && savedCompTwo == 0 ) {
            
            equipmentArray[2]     =  ["Super Baltar", " ", " ", " ", " ", " ", " "]              // print("Selected Cooke Primes")
            
            primeSelected = true
            
            lensArray   = ["20mm", "25mm", "35mm","50mm", "75mm", "100mm"]
            
            displayLensArray = ["20mm     T 2.3   ^18in",
                                "25mm     T 2.3   ^18in",
                                "35mm     T 2.3   ^18in",
                                "50mm     T 2.3   ^18in",
                                "75mm     T 2.3   ^22in",
                                "100mm    T 2.3   ^4ft",]
        }
        
  //"Kowa Cine Prominar",6      "Kineoptic Apochromat",7     "Nikkor",8   "Red Pro",9  "CamTec Vintage", 10
        
        // Primes + "Kowa Cine Prominar",
        if ( savedCompZero == 1  && savedCompOne == 6 && savedCompTwo == 0 ) {
            
            equipmentArray[2]     =  ["Prominar", " ", " ", " ", " ", " ", " "]              // print("Selected Cooke Primes")
            
            primeSelected = true
            
            lensArray   = ["15mm", "20mm", "25mm", "32mm","40mm","50mm", "75mm", "100mm", "200mm"]
            
            displayLensArray = ["15mm     T 4     ^12in",
                                "20mm     T 2.3   ^12in",
                                "25mm     T 2.3   ^12in",
                                "32mm     T 2.3   ^1ft 6in",
                                "40mm     T 2.3   ^2ft 6in",
                                "50mm     T 2.3   ^2ft 6in",
                                "75mm     T 2.3   ^3ft",
                                "100mm    T 2.6   ^5ft",
                                "200mm    T 2.6   ^8ft",]
        }
        
        // Primes + "Kineoptic Apochromat",7
        if ( savedCompZero == 1  && savedCompOne == 7 && savedCompTwo == 0 ) {
            
            equipmentArray[2]     =  ["Apochromat", " ", " ", " ", " ", " ", " "]              // print("Selected Cooke Primes")
            
            primeSelected = true
            
            lensArray   = ["9.8mm", "18mm", "25mm","28mm", "32mm","35mm", "40mm","50mm", "75mm", "100mm"]
            
            displayLensArray = ["9.8mm    T 2.2   ^9in",
                                "18mm     T 2.8   ^8in",
                                "25mm     T 2.8   ^14in",
                                "28mm     T 2.8   ^16in",
                                "32mm     T 3.2   ^17in",
                                "35mm     T 2.4   ^22in",
                                "40mm     T 2.4   ^2ft 3in",
                                "50mm     T 2.5   ^18in",
                                "75mm     T 2.4   ^3ft",
                                "100mm    T 2.4   ^4ft"]
        }
        // Primes + "Nikkor",8
        if ( savedCompZero == 1  && savedCompOne == 8 && savedCompTwo == 0 ) {
            
            equipmentArray[2]     =  ["Telephoto", " ", " ", " ", " ", " ", " "]              // print("Selected Cooke Primes")
            
            primeSelected = true
            
            lensArray   = ["200mm","300mm T2", "300mm T2.8","400mm"]
            
            displayLensArray = ["200mm     T 2     ^9ft",
                                "300mm     T 2     ^9ft",
                                "300mm     T 2.8   ^7ft",
                                "400mm     T 2.8   ^8ft 6in"]
        }

        // Primes + Red Pro 9
        if ( savedCompZero == 1  && savedCompOne == 9 && savedCompTwo == 0 ) {
            
            equipmentArray[2]     =  ["Pro", " ", " ", " ", " ", " ", " "]              // print("Selected Cooke Primes")
            
            primeSelected = true
            
            lensArray   = [ "18mm","25mm","35mm","50mm","85mm","100mm"]
            
            displayLensArray   = [ "18mm     T 1.8     ^13in",
                                   "25mm     T 1.8     ^4in",
                                   "35mm     T 1.8     ^4in",
                                   "50mm     T 1.8     ^6in",
                                   "85mm     T 1.8     ^18in",
                                   "100mm    T 1.8     ^2ft"]
        }
        // Primes + "CamTec Vintage", 10
        if ( savedCompZero == 1  && savedCompOne == 10 && savedCompTwo == 0 ) {
            
            equipmentArray[2]     =  ["Ultra Primes", " ", " ", " ", " ", " ", " "]              // print("Selected Cooke Primes")
            
            primeSelected = true
            
            lensArray   = [ "16mm","20mm","24mm","28mm","32mm",
                            "40mm","50mm","65mm","85mm","100mm","135mm"]
            
            displayLensArray  = [ "16mm     T 1.9     ^12in",
                                  "20mm     T 1.9     ^12in",
                                  "24mm     T 1.9     ^12in",
                                  "28mm     T 1.9     ^12in",
                                  "32mm     T 1.9     ^15in",
                                  "40mm     T 1.9     ^15in",
                                  "50mm     T 1.9     ^2ft",
                                  "65mm     T 1.9     ^2ft3in",
                                  "85mm     T 1.9     ^3ft",
                                  "100mm    T 1.9     ^3ft 3in",
                                  "135mm    T 1.9     ^5ft"]
        }
        
// Primes + "Anamorphic", 11  selected
// ["Cooke Vintage",0 "Cooke",1 "Master Primes",2 "Arriscope",3 "Kowa",4 "Hawk VL",5 "Hawk V",6 "Hawk C",7 "Cineovision",8]
        // Primes + "Anamorphic Cooke Vintage
        if ( savedCompZero == 1  && savedCompOne == 11 && savedCompTwo == 0  ) {
            equipmentArray[2]     =  ["Cooke Vintage", "Cooke", "Master Primes", "Arriscope", "Kowa", "Hawk VL", "Hawk V", "Hawk C", "Cineovision"]
            
            lensArray   = [ "25mm","32mm","40mm","50mm","75mm","100mm"]
            
            displayLensArray  = [ "25mm     T 2.3     ^36in",
                                  "32mm     T 2.3     ^22in",
                                  "40mm     T 2.3     ^22in",
                                  "50mm     T 2.3     ^22in",
                                  "75mm     T 2.3     ^31in",
                                  "100mm    T 2.3     ^35in"]
        }
        // Primes + "Anamorphic Cooke
        if ( savedCompZero == 1  && savedCompOne == 11 && savedCompTwo == 1  ) {
            equipmentArray[2]     =  ["Cooke Vintage", "Cooke", "Master Primes", "Arriscope", "Kowa", "Hawk VL", "Hawk V", "Hawk C", "Cineovision"]
            
            lensArray   = [ "25mm","32mm","40mm","50mm","75mm","100mm"]
            
            displayLensArray  = [ "25mm     T 2.3     ^36in",
                                  "32mm     T 2.3     ^22in",
                                  "40mm     T 2.3     ^22in",
                                  "50mm     T 2.3     ^22in",
                                  "75mm     T 2.3     ^31in",
                                  "100mm    T 2.3     ^35in"]
        }
        // Primes + "Anamorphic Master Primes
        if ( savedCompZero == 1  && savedCompOne == 11 && savedCompTwo == 2  ) {
            equipmentArray[2]     =  ["Cooke Vintage", "Cooke", "Master Primes", "Arriscope", "Kowa", "Hawk VL", "Hawk V", "Hawk C", "Cineovision"]
            
            lensArray   = [ "35mm","40mm","50mm","60mm","75mm","100mm", "135mm"]
            
            displayLensArray   = [ "35mm     T 1.9     ^2ft 6in",
                                   "40mm     T 1.9     ^2ft 4in",
                                   "50mm     T 1.9     ^2ft 6in",
                                   "60mm     T 1.9     ^3ft",
                                   "75mm     T 1.9     ^3ft",
                                   "100mm    T 1.9     ^3ft 1in",
                                   "135mm    T 1.9     ^3ft 11in"]
        }
        // Primes + "Anamorphic Arriscope
        if ( savedCompZero == 1  && savedCompOne == 11 && savedCompTwo == 3  ) {
            equipmentArray[2]     =  ["Cooke Vintage", "Cooke", "Master Primes", "Arriscope", "Kowa", "Hawk VL", "Hawk V", "Hawk C", "Cineovision"]
            
            lensArray   = [ "40mm","50mm","75mm","100mm", "135mm"]
            
            displayLensArray   = [ "40mm     T 2.3     ^3ft 3in",
                                   "50mm     T 2.3     ^3ft 3in",
                                   "75mm     T 2.3     ^4ft",
                                   "100mm    T 3       ^",
                                   "135mm    T 3       ^"]
        }
        // Primes + "Anamorphic Kowa
        if ( savedCompZero == 1  && savedCompOne == 11 && savedCompTwo == 4  ) {
            equipmentArray[2]     =  ["Cooke Vintage", "Cooke", "Master Primes", "Arriscope", "Kowa", "Hawk VL", "Hawk V", "Hawk C", "Cineovision"]
            
            lensArray   = [ "32mm","40mm","50mm","75mm","100mm" ]
            
            displayLensArray = [ "32mm     T 2.3     ^3ft",
                                 "40mm     T 2.3     ^3ft",
                                 "50mm     T 2.3     ^3ft",
                                 "75mm     T 2.8     ^3ft",
                                 "100mm    T 3.4     ^5ft"]
        }
        // Primes + "Anamorphic Hawk VL
        if ( savedCompZero == 1  && savedCompOne == 11 && savedCompTwo == 5  ) {
            equipmentArray[2]     =  ["Cooke Vintage", "Cooke", "Master Primes", "Arriscope", "Kowa", "Hawk VL", "Hawk V", "Hawk C", "Cineovision"]
            
            lensArray   = [ "25mm","28mm","35mm","45mm","55mm", "65mm", "80mm", "110mm", "140mm", "180mm" ]
            
            displayLensArray   = [ "25mm     T 2.2     ^3ft 6in",
                                   "28mm     T 2.2     ^2ft 7in",
                                   "35mm     T 2.2     ^3ft 3in",
                                   "45mm     T 2.2     ^3ft 3in",
                                   "55mm     T 2.2     ^3ft 3in",
                                   "65mm     T 2.2     ^3ft 3in",
                                   "80mm     T 2.2     ^3ft 3in",
                                   "110mm    T 3       ^3ft 3in",
                                   "140mm    T 3.5     ^3ft 3in",
                                   "180mm    T 3       ^6ft 6in" ]
        }
        // Primes + "Anamorphic Hawk V
        if ( savedCompZero == 1  && savedCompOne == 11 && savedCompTwo == 6  ) {
            equipmentArray[2]     =  ["Cooke Vintage", "Cooke", "Master Primes", "Arriscope", "Kowa", "Hawk VL", "Hawk V", "Hawk C", "Cineovision"]
            
            lensArray   = [ "25mm","35mm","40mm","50mm","75mm", "100mm", "135mm", "180mm" ]
            
            displayLensArray   = [ "25mm     T 2.2     ^3ft 6in",
                                   "35mm     T 2.2     ^2ft 6in",
                                   "40mm     T 2.2     ^2ft 6in",
                                   "50mm     T 2.2     ^2ft",
                                   "75mm     T 2.2     ^2ft",
                                   "100mm    T 2.2     ^3ft 6in",
                                   "135mm    T 3       ^3ft 6in",
                                   "180mm    T 3       ^6ft 6in"]
        }
        // Primes + "Anamorphic Hawk C
        if ( savedCompZero == 1  && savedCompOne == 11 && savedCompTwo == 7  ) {
            equipmentArray[2]     =  ["Cooke Vintage", "Cooke", "Master Primes", "Arriscope", "Kowa", "Hawk VL", "Hawk V", "Hawk C", "Cineovision"]
            
            lensArray   = [ "25mm","35mm","50mm","75mm", "100mm", "135mm"]
            
            displayLensArray   = [ "25mm     T 2.2     ^3ft 6in",
                                   "35mm     T 2.2     ^3ft 6in",
                                   "50mm     T 2.2     ^3ft 6in",
                                   "75mm     T 2.2     ^3ft 6in",
                                   "100mm    T 3       ^3ft 6in",
                                   "135mm    T 3       ^3ft 6in"]
        }
        // Primes + "Anamorphic  Cineovision
        if ( savedCompZero == 1  && savedCompOne == 11 && savedCompTwo == 8  ) {
            equipmentArray[2]     =  ["Cooke Vintage", "Cooke", "Master Primes", "Arriscope", "Kowa", "Hawk VL", "Hawk V", "Hawk C", "Cineovision"]
            
            lensArray   = [ "24mm","35mm","40mm","50mm", "85mm", "100mm"]
            
            displayLensArray  = [ "24mm     T 1.6     ^3ft",
                                  "35mm     T 1.6     ^",
                                  "40mm     T 2.4     ^",
                                  "50mm     T 1.4     ^3ft",
                                  "85mm     T 1.4     ^3ft",
                                  "100mm    T 2.8     ^3ft"]
        }
        
        return(row)
    }
}


