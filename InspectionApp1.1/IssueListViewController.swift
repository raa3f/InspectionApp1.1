//
//  IssueListViewController.swift
//  InspectionApp1.1
//
//  Created by Raaef Khan on 19/01/2015.
//  Copyright (c) 2015 Raaef Khan. All rights reserved.
//

import UIKit
import CoreData

var issueList: [Issues] = []

class IssueListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func initData() {
        issueList = []
        
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        var res = NSFetchRequest(entityName: "Issues")
        var result = context.executeFetchRequest(res, error: nil) as [Issues]
        
        for issue in result {
            if issue.projectName == selectedProject?.projectName {
                issueList.append(issue)
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        initData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        initData()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issueList.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "IssueCell")
        cell.textLabel?.text = issueList[indexPath.row].issueDescription
        cell.imageView?.image = UIImage(named: "images.jpg")
        return cell
    }
    
    @IBAction func Back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
