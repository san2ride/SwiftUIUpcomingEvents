//
//  UpcomingEventsView.swift
//  UpcomingEvents-MH
//
//  Created by Cause  I'm Electric on 2/28/24.
//

import SwiftUI

private func findOverlappingEvents(_ events: [Event]) -> [(Event, Event)] {
    
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

struct UpcomingEventsView: View {
    @ObservedObject var eventClient = EventClient()
    var body: some View {
        NavigationStack {
            List(eventClient.events) { event in
                EventCellView(event: event)
            }.navigationTitle("Events")
                .task {
                    let overlappingEvents = findOverlappingEvents(eventClient.events)
                    for overlap in overlappingEvents {
                        print("Overlap between \(overlap.0.start)-\(overlap.0.end) and \(overlap.1.start)-\(overlap.1.end)")
                    }
                }
        }
    }
}

#Preview {
    UpcomingEventsView()
}

struct EventCellView: View {
    let event: Event
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.title)
                .font(.headline)
            Text(event.start)
            Text(event.end)
        }
    }
}
