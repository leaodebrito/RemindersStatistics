//
//  ReminderStore.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 28/01/23.
//

import Foundation
import EventKit

class ReminderStore{
    static let shared = ReminderStore()
    
    private let ekStore = EKEventStore()
    
    var isAvailable: Bool{
        EKEventStore.authorizationStatus(for: .reminder) == .authorized
    }
}
