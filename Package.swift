//
//  Package.swift
//  Core Data
//
//  Created by Amitabh Mishra on 10/14/19.
//  Copyright © 2019 Amitabh Mishra. All rights reserved.
//

import Foundation
import CoreData

public class Package:NSManagedObject, Identifiable {
    @NSManaged public var createdAt:Date?
    @NSManaged public var trackingID:Int64
    @NSManaged public var packageWeight:Int64
    @NSManaged public var packageSource:String
    @NSManaged public var packageDestination:String
}

extension Package {
    static func getAllPackages() -> NSFetchRequest<Package> {
        let request:NSFetchRequest<Package> = Package.fetchRequest() as!
            NSFetchRequest<Package>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
