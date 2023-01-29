//
//  GeneralStatistics.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 28/01/23.
//

import EventKit
import SwiftUI
import Shift



struct GeneralStatistics: View {
    
    @StateObject var eventKitWrapper = Shift.shared
    @State private var selectedEvent: EKEvent?
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 10) {
            ForEach(eventKitWrapper.events, id: \.self) { event in
                Text(event.title)
            }
        }
        .padding()
        .task { // wrap async call inside .task modifier
            try? await eventKitWrapper.fetchEventsForToday()
        }
    }
}
    
struct GeneralStatistics_Previews: PreviewProvider {
    static var previews: some View {
        GeneralStatistics()
    }
}

