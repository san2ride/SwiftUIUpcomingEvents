//
//  Event.swift
//  UpcomingEvents-MH
//
//  Created by Cause  I'm Electric on 2/29/24.
//

import Foundation

struct Event: Decodable, Hashable, Identifiable {
    var id = UUID()
    let title: String
    let start: String
    let end: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case start
        case end
    }
}
