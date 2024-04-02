//
//  MyEventsView.swift
//  UpcomingEvents-MH
//
//  Created by Cause I'm Electric on 4/1/24.
//

import SwiftUI

struct MyEventsView: View {
    
    @ObservedObject var eventClient = EventClient()
    
    let event: Event
    
    var body: some View {
        NavigationStack {
            VStack {
                List(eventClient.events) { event in
                    MyEventCellView(event: event)
                }
            }.task {
                let overlappingEvents = EventService.findOverlappingEvents(eventClient.events)
                for overlap in overlappingEvents {
                    print("Overlap between \(overlap.0.start)-\(overlap.0.end) and \(overlap.1.start)-\(overlap.1.end)")
                }
            }
        }
    }
}


//#Preview {
//    MyEventsView()
//}
