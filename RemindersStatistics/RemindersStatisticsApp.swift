//
//  RemindersStatisticsApp.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 27/01/23.
//

import SwiftUI
import Shift

@main
struct RemindersStatisticsApp: App {
    
    init() {
        Shift.configureWithAppName("MyApp")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
