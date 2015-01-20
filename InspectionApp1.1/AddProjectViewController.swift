//
//  AddProjectViewController.swift
//  InspectionApp1.1
//
//  Created by Raaef Khan on 18/01/2015.
//  Copyright (c) 2015 Raaef Khan. All rights reserved.
//

import UIKit
import CoreData

class AddProjectViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var projectImage: UIImageView!
    @IBOutlet weak var projectName: UITextField!
    @IBOutlet weak var referenceNo: UITextField!
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var companyAddress: UITextField!
    @IBOutlet weak var createdBy: UITextField!
    
    @IBAction func SaveToCoreData(sender: AnyObject) {
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        var context: NSManagedObjectContext = appDelegate.managedObjectContext!
        var errorPointer: NSErrorPointer?
        
        var project = NSEntityDescription.insertNewObjectForEntityForName("Projects", inManagedObjectContext: context) as NSManagedObject
        project.setValue(projectName?.text, forKey: "projectName")
        project.setValue(referenceNo?.text, forKey: "referenceNo")
        project.setValue(companyName?.text, forKey: "companyName")
        project.setValue(companyAddress?.text, forKey: "companyAddress")
        project.setValue(createdBy?.text, forKey: "createdBy")
        project.setValue("\(NSDate())", forKey: "createdDate")
        project.setValue("", forKey: "updatedDate")
        
        context.save(nil)
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if selectedProject != nil {
            projectName?.text = selectedProject?.projectName
            referenceNo?.text = selectedProject?.referenceNo
            companyName?.text = selectedProject?.companyName
            companyAddress?.text = selectedProject?.companyAddress
            createdBy?.text = selectedProject?.createdBy
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.endEditing(true)
        println("textField.endEditing(true)")
        //textField.resignFirstResponder()
        //println("textField.resignFirstResponder")
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
