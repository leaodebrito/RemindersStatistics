//
//  ContentView.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 27/01/23.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        TabView{
            ReminderList()
                .tabItem{
                    Label("Tarefas", systemImage: "checklist")
                }
            GeneralStatistics()
                .tabItem{
                    Label("Estatísticas", systemImage: "chart.xyaxis.line")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
