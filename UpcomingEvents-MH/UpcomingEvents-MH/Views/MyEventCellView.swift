//
//  MyEventCellView.swift
//  UpcomingEvents-MH
//
//  Created by Cause I'm Electric on 4/1/24.
//

import SwiftUI

struct MyEventCellView: View {
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
/*
#Preview {
    MyEventCellView(event: event)
}
*/
