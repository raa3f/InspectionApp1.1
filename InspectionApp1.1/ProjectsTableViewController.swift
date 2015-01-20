//
//  ProjectsTableViewController.swift
//  InspectionApp1.1
//
//  Created by Raaef Khan on 18/01/2015.
//  Copyright (c) 2015 Raaef Khan. All rights reserved.
//

import UIKit
import CoreData

var projectList:[Projects] = []
var selectedProject: Projects?

class ProjectsTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    func initData() {
        projectList = []
        selectedProject = nil
        
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        var context: NSManagedObjectContext = appDelegate.managedObjectContext!
        var result = NSFetchRequest(entityName: "Projects")
        var resultList = context.executeFetchRequest(result, error: nil)
        
        for i in resultList as [Projects] {
            projectList.append(i)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        initData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return projectList.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCell", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel?.text = projectList[indexPath.row].projectName
        cell.imageView?.image = UIImage(named: "images.jpg")
        // Configure the cell...

        return cell
    }

    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            projectList.removeAtIndex(indexPath.row)
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            var addView: AddProjectViewController = AddProjectViewController()
            selectedProject = projectList[indexPath.row]
            self.presentViewController(addView, animated: true, completion: nil)
        }    
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var issueListView: IssueListViewController = self.storyboard?.instantiateViewControllerWithIdentifier("IssueListViewController")! as IssueListViewController
        selectedProject?=projectList[indexPath.row]
        
        self.presentViewController(issueListView, animated: true, completion: nil)
    }
/*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }*/

/*

    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
