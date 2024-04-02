//
//  PreviewData.swift
//  UpcomingEvents-MH
//
//  Created by Cause I'm Electric on 4/1/24.
//

import Foundation
import CoreData

class PreviewData {
    static var myEvent: MyEvent {
        let viewContext = CoreDataProvider.shared.persistentContainer.viewContext
        let request = MyEvent.fetchRequest()
        return (try? viewContext.fetch(request).first) ?? MyEvent()
    }
}
