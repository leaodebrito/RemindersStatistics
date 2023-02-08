//
//  AllRemindersList.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 01/02/23.
//

import SwiftUI

struct AllRemindersList: View {
    
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "titulo", ascending: true)]) var lembrete: FetchedResults<Reminder>
    
    var body: some View {
        NavigationView{
            List(lembrete) { lembrete in
                NavigationLink(destination: ReminderDetail(lembrete: lembrete), label: {
                    Text(lembrete.titulo ?? "")
                })
                
            }
            .listStyle(.inset)
            .navigationTitle("Todos")

        }
        
    }
}

struct AllRemindersList_Previews: PreviewProvider {
    static var previews: some View {
        AllRemindersList()
    }
}
