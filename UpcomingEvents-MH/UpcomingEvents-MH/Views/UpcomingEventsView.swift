//
//  UpcomingEventsView.swift
//  UpcomingEvents-MH
//
//  Created by Cause  I'm Electric on 2/28/24.
//

import SwiftUI

struct UpcomingEventsView: View {
    @ObservedObject var eventClient = EventClient()
    var body: some View {
        NavigationStack {
            VStack {
                List(eventClient.events) { event in
                    EventCellView(event: event)
                }.navigationTitle("Events")
                    .task {
                        let overlappingEvents = EventService.findOverlappingEvents(eventClient.events)
                        for overlap in overlappingEvents {
                            print("Overlap between \(overlap.0.start)-\(overlap.0.end) and \(overlap.1.start)-\(overlap.1.end)")
                        }
                    }
                HStack {
                    
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
