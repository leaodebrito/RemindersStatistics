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
            GeneralStatistics()
                .tabItem{
                    Label("Geral", systemImage: "chart.xyaxis.line")
                }
            EspecificStatistics()
                .tabItem{
                    Label("Lista", systemImage: "")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
