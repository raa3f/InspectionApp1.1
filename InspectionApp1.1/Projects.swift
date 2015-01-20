//
//  File.swift
//  InspectionApp1.1
//
//  Created by Raaef Khan on 18/01/2015.
//  Copyright (c) 2015 Raaef Khan. All rights reserved.
//

import Foundation
import CoreData
@objc (Projects)
class Projects: NSManagedObject {
    @NSManaged var imagePath: String!
    @NSManaged var projectName: String!
    @NSManaged var createdBy: String!
    @NSManaged var companyName: String!
    @NSManaged var companyAddress: String!
    @NSManaged var referenceNo: String!
    @NSManaged var createdDate: String!
    @NSManaged var updatedDaate: String!
}