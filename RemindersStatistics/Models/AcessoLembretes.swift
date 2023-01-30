//
//  AcessoLembretes.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 30/01/23.
//

import Foundation
import EventKit

var store = EKEventStore()

class AcessoLembretes: EKReminder, ObservableObject{
    
    var todosLembretes: [EKReminder] = []
    
    public static func requestAccess() -> Bool {
           let semaphore = DispatchSemaphore(value: 0)
           var grantedAccess = false
           store.requestAccess(to: .reminder) { granted, _ in
               grantedAccess = granted
               semaphore.signal()
           }

           semaphore.wait()
           return grantedAccess
       }
    
    
    
    func fetchAllReminders(for store:EKEventStore) {
        let predicate: NSPredicate? = store.predicateForIncompleteReminders(withDueDateStarting: nil, ending: nil, calendars: nil)
        store.fetchReminders(matching: predicate!, completion: { (reminders: [EKReminder]?) -> Void in
            guard let reminders = reminders else {
                assertionFailure("No reminders found")
                return
            }
            if reminders.isEmpty {
                print("No reminders found")
                return
            }
            for reminder in reminders {
                print("Title: \(reminder.title ?? "No title")")
                print("Calendar: \(reminder.calendar.title)")
                if(reminder.hasNotes) {
                    print("Notes: \(reminder.notes ?? "No Notes")")
                }
            }
        })
    }



}
