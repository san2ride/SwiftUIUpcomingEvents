//
//  UpcomingEventsView.swift
//  UpcomingEvents-MH
//
//  Created by Cause  I'm Electric on 2/28/24.
//

import SwiftUI

struct UpcomingEventsView: View {
    
    @ObservedObject var eventClient = EventClient()
    @State private var event: Event?
    
    var body: some View {
        NavigationStack {
            VStack {
                List(eventClient.events) { event in
                    MyEventCellView(event: event)
                }.navigationTitle("Events")
                
                .task {
                    let overlappingEvents = EventService.findOverlappingEvents(eventClient.events)
                    for overlap in overlappingEvents {
                        Text("Overlap between \(overlap.0.start)-\(overlap.0.end) and \(overlap.1.start)-\(overlap.1.end)")
                        print("Overlap between \(overlap.0.start)-\(overlap.0.end) and \(overlap.1.start)-\(overlap.1.end)")
                    }
                }
                Divider()
                
            }
        }
    }
}

#Preview {
    UpcomingEventsView()
}
