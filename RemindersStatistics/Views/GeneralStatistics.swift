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
    
    @StateObject var reminder = EventKitManager()
        
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    
                    Text("\(reminder.reminderTitle())")
                }
            }
            .navigationTitle("Dados Gerais")
        }
 
    }
}
    
struct GeneralStatistics_Previews: PreviewProvider {
    static var previews: some View {
        GeneralStatistics()
    }
}

