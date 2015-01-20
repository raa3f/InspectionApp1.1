//
//  AddIssueViewController.swift
//  InspectionApp1.1
//
//  Created by Raaef Khan on 20/01/2015.
//  Copyright (c) 2015 Raaef Khan. All rights reserved.
//

import UIKit
import CoreData

var imagePath: String = "images.jpg"

class AddIssueViewController: UIViewController {


    @IBOutlet weak var projectImage: UIImageView!
    @IBOutlet weak var issueDescription: UITextField!
    @IBOutlet weak var severity: UITextField!

    @IBAction func SavePressed(sender: AnyObject) {
        Save(sender)
    }
    
    @IBAction func Save(sender: AnyObject) {
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        var context: NSManagedObjectContext = appDelegate.managedObjectContext!
        
        var issue = NSEntityDescription.insertNewObjectForEntityForName("Issues", inManagedObjectContext: context) as NSManagedObject
        issue.setValue(imagePath, forKey: "imagePath")
        issue.setValue(selectedProject?.projectName, forKey: "projectName")
        issue.setValue(issueDescription.text, forKey: "issueDescription")
        issue.setValue(severity.text, forKey: "severity")
        issue.setValue("\(NSDate())", forKey: "recordedDate")
        
        context.save(nil)
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func Cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var Back: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
