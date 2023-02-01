//
//  RemindeStruct.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 01/02/23.
//

import Foundation
import SwiftUI


struct ReminderStruct: Identifiable {
    var id: UUID
    var priority: Int
    var list: String
    var notas: String
    var titulo: String
    var flag: Bool
    var date: Date
    var hour: Date
}


struct Lista: Identifiable{
    var id: UUID
    var name: String
    var color: Color
    var symbol: String
}
