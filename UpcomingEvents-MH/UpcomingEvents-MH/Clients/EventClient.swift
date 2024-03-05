//
//  EventClient.swift
//  UpcomingEvents-MH
//
//  Created by Cause  I'm Electric on 2/29/24.
//

import SwiftUI
import Combine


enum NetworkError: Error {
    case badJSON
    case decodingError
}

class EventClient: ObservableObject {
    
    @Published var events = [Event]()
    
    init() {
        readJSON()
    }
    
    func readJSON() {
        guard let url = Bundle.main.url(forResource: "events", withExtension: "json") else {
            return
        }
        
        let data = try? Data(contentsOf: url)
        guard let events = try? JSONDecoder().decode([Event].self, from: data!) else {
            return
        }
        self.events = events
    }
}
