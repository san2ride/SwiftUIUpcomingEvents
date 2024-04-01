//
//  MyEvents+CoreDataProperties.swift
//  UpcomingEvents-MH
//
//  Created by Cause I'm Electric on 4/1/24.
//

import Foundation
import CoreData
import UIKit

extension MyEvent {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyEvent> {
        return NSFetchRequest<MyEvent>(entityName: "MyEvent")
    }
    @NSManaged public var name: String
    @NSManaged public var color: UIColor
    @NSManaged public var conflicts: NSSet?
}

extension MyEvent: Identifiable {
    
}
// Generated accessors for notes
extension MyEvent {
//    @objc(removeConflictsObject:)
//    @NSManaged public func removeFromConflicts(_ value: Conflict)
//    
//    @objc(removeConflicts:)
//    @NSManaged public func removeFromConflicts(_ value: NSSet)
}
