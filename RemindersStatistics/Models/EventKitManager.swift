//
//  EventKitManager.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 29/01/23.
//

import EventKit
import Combine
import Foundation
import SwiftUI

class EventKitManager: ObservableObject {
    
    var store = EKEventStore()
    var lembrete = EKReminder()
    var remindersss = EKReminder()
    @Published var events: [EKEvent] = []

    
    init() {
        requestAccessToCalendar()
        todaysEvents()
    }
    
    func requestAccessToCalendar() {
        store.requestAccess(to: .event) { success, error in
            self.store = EKEventStore()

        }
    }
    

    func todaysEvents() {
        let calendar = Calendar.autoupdatingCurrent
        let startDate = Date.now
        var onDayComponents = DateComponents()
        onDayComponents.day = 1
        let endDate = calendar.date(byAdding: onDayComponents, to: .now)!
        let predicate = store.predicateForEvents(withStart: startDate, end: endDate, calendars: nil)
        events = store.events(matching: predicate)
        
    }
    
    //MARK: - Reminders
    

}
