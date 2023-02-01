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
    
    @StateObject private var dataController = DataController()
   
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
