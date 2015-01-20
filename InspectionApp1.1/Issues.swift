//
//  Issues.swift
//  InspectionApp1.1
//
//  Created by Raaef Khan on 19/01/2015.
//  Copyright (c) 2015 Raaef Khan. All rights reserved.
//

import Foundation
import CoreData

@objc(Issues)
class Issues: NSManagedObject {
    @NSManaged var projectName: String!
    @NSManaged var issueDescription: String!
    @NSManaged var recordedDate: String!
    @NSManaged var imagePath: String!
    @NSManaged var severity: String!
    
}