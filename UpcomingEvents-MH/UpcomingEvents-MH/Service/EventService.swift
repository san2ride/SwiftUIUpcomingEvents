//
//  EventService.swift
//  UpcomingEvents-MH
//
//  Created by Cause I'm Electric on 4/1/24.
//

import Foundation
import UIKit

class EventService {
    static func findOverlappingEvents(_ events: [Event]) -> [(Event, Event)] {
        
        let sortedEvents = events.sorted { $0.start < $1.start }
        var activeEvents: [Event] = []
        var overlaps: [(Event, Event)] = []
        
        for event in sortedEvents {
            // check for overlaps with active events
            for activeEvent in activeEvents {
                if activeEvent.end > event.start {
                    overlaps.append((activeEvent, event))
                }
            }
            // update active set
            activeEvents = activeEvents.filter { $0.end > event.start }
            activeEvents.append(event)
            activeEvents.sort { $0.end < $1.end}
        }
        return overlaps
    }
}
