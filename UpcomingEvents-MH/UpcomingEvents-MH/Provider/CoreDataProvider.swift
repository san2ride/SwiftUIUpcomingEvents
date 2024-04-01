//
//  CoreDataProvider.swift
//  UpcomingEvents-MH
//
//  Created by Cause I'm Electric on 4/1/24.
//

import Foundation
import CoreData

class CoreDataProvider {
    static let shared = CoreDataProvider()
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "UpcomingEventsModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                fatalError("Error initializing UpcomingEventsModel \(error)")
            }
        }
    }
}
