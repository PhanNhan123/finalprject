//
//  User+CoreDataProperties.swift
//  
//
//  Created by Test VPN on 11/11/2022.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var title: String?
    @NSManaged public var link: String?
    @NSManaged public var image: String?

}
